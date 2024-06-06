package com.brokurly.service.mypage;

import com.brokurly.entity.mypage.Point;
import com.brokurly.dto.mypage.PointDto;
import com.brokurly.dto.mypage.PointLogRecordWithPointNoDto;
import com.brokurly.dto.mypage.PointLogRecordWithoutPointNoDto;
import com.brokurly.entity.mypage.PointLog;
import com.brokurly.repository.mypage.PointDao;
import com.brokurly.repository.mypage.PointLogDao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class PointService {
    private final PointDao pointDao;
    private final PointLogDao pointLogDao;

    // 총 적립금 구하기
    public int getTotalAvailPoints(String custId) {
        return pointDao.selectByCustomer(custId).stream().map(Point::getPointDto).mapToInt(PointDto::getPointAmt).sum();
    }

    // 구매 적립 외 예) 첫가입 적립: orderId가 null
    // 구매 적립 -> 구매 확정 시 발생: orderId가 존재
    @Transactional
    public void earnPoints(Date expirDt, String orderId, String custId, int pointAmt, String pointSpec, String pointStat) {
        // PointDto -> Point
        PointDto pointDto = new PointDto(0, custId, pointAmt, expirDt); // pointNo: insert 후 자동 생성된 pk로 대체
        Point point = new Point();
        point.setPointDto(pointDto);
        pointDao.insert(point);
        int pointNo = point.getPointNo();
        log.info("point_no: {}", pointNo);

        // PointLogRecordWithPointNoDto -> PointLog
        PointLogRecordWithPointNoDto pointLogRecordWithPointNoDto = new PointLogRecordWithPointNoDto(pointNo, orderId, custId, pointAmt, pointSpec, pointStat);
        PointLog pointLog = new PointLog();
        pointLog.setPointLogRecordWithPointNoDto(pointLogRecordWithPointNoDto);
        log.info("{}", pointLog);
        pointLogDao.insert(pointLog);
        log.info("{}", pointLogDao.selectAll());
    }

    // 주문 결제 시 적립금 사용
    @Transactional
    public void usePointsWhenOrder(String orderId, String custId, int pointAmt) {
        List<PointDto> pointDtos = pointDao.selectByExpirDt(custId)
                .stream()
                .map(Point::getPointDto)
                .toList(); // 만료일자가 제일 앞선 것 먼저

        // PointLogRecordWithPointNoDto -> PointLog
        PointLogRecordWithoutPointNoDto pointLogRecordDto = new PointLogRecordWithoutPointNoDto(orderId, custId, pointAmt, "주문 결제 시 사용", "사용");
        PointLog pointLog = new PointLog();
        pointLog.setPointLogRecordWithoutPointNoDto(pointLogRecordDto);

        for (PointDto pointDto : pointDtos) {
            int pointNo = pointDto.getPointNo();
            int pointAvail = pointDto.getPointAmt();

            log.info("잔여 포인트 {}", pointAvail);
            log.info("차감할 포인트 before {}", pointAmt);


            if (pointAvail > Math.abs(pointAmt)) { // 잔여포인트 > 차감포인트금액
                pointDao.updatePointAmtByPointNo(pointAmt, pointNo);
                pointAmt -= pointAmt; // pointAmt는 음수
            } else if (pointAvail == Math.abs(pointAmt)) { // 잔여포인트 = 차감포인트금액
                pointDao.deleteByPointNo(pointNo);
                pointAmt -= pointAmt;
            } else { // pointAvail < pointAmt, 잔여포인트 < 차감포인트금액
                pointDao.deleteByPointNo(pointNo);
                pointAmt += pointAvail; // pointAmt는 음수
            }

            log.info("차감할 포인트 after {}", pointAmt);

            if (pointAmt == 0) {
                pointLogDao.insert(pointLog);
                break;
            }
        }
    }

    // 기간 만료 포인트 소멸
    @Transactional
    public void deleteExpiredPoints(String custId) {
        log.info("{}", pointDao.selectExpiredByCustomer(custId));
        List<PointDto> pointDtos = pointDao.selectExpiredByCustomer(custId)
                .stream()
                .map(Point::getPointDto)
                .collect(Collectors.toList());

        for (PointDto pointDto : pointDtos) {
            int pointNo = pointDto.getPointNo();
            int pointAmt = pointDto.getPointAmt();

            pointDao.deleteByPointNo(pointNo);

            PointLogRecordWithoutPointNoDto pointLogRecordWithoutPointNoDto = new PointLogRecordWithoutPointNoDto(null, custId, pointAmt * -1, "적립금 유효기간 만료", "소멸");
            PointLog pointLog = new PointLog();
            pointLog.setPointLogRecordWithoutPointNoDto(pointLogRecordWithoutPointNoDto);
            pointLogDao.insert(pointLog);
        }
    }

    // 소멸 예정 금액
    public int getTotalPointsToBeExpired(String custId) {
        return pointDao.selectToBeExpired(custId)
                .stream()
                .mapToInt(Point::getPointAmt)
                .sum();
    }

    // CREATE

    // READ
    public PointDto findPointByPointId(Integer pointId) {
        return pointDao.selectByPointNo(pointId).getPointDto();
    }

    // UPDATE

    // DELETE 없음

    /*(일반) 적립
    PointDao insert
    PointLogDao insert

    구매 적립
    PointDao insert
    PointLogDao insert

    주문 결제 시 적립금 사용
    PointDao update
    PointLogDao insert

    기간 소멸
    PointDao update
    PointLogDao insert*/
}

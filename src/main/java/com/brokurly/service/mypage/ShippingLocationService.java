package com.brokurly.service.mypage;

import com.brokurly.dto.mypage.*;
import com.brokurly.entity.mypage.ShippingLocation;
import com.brokurly.entity.mypage.ShippingLocationAndShoppingLocationChangeLog;
import com.brokurly.entity.mypage.ShippingLocationChangeLog;
import com.brokurly.repository.mypage.ShippingLocationChangeLogDao;
import com.brokurly.repository.mypage.ShippingLocationDao;
import com.brokurly.utils.RandomGeneratorUtils;
import com.brokurly.utils.StringFormatUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class ShippingLocationService {
    private final ShippingLocationDao shippingLocationDao;
    private final ShippingLocationChangeLogDao shippingLocationChangeLogDao;

    @Transactional
    public void addNewShippingLocation(String custId, String addr, String specAddr, String defAddrFl) {
        String shipLocaId = RandomGeneratorUtils.randomGeneratedShipLocaId();

        // ShippingLocationAddDto -> ShippingLocation
        ShippingLocation shippingLocation = new ShippingLocation();
        // 현재 배송지를 모두 N으로 바꿈
        unflagCurrAddrFl(custId);
        // 배송지 추가할 때 currAddrFl의 기본값은 "Y"
        ShippingLocationAddDto shippingLocationAddDto = new ShippingLocationAddDto(shipLocaId, addr, specAddr, defAddrFl, currDateAsYYYYMMDD(), "N");
        shippingLocation.updateShippingLocationAddDto(shippingLocationAddDto);

        // 배송지 정보 추가
        shippingLocationDao.insert(shippingLocation);

        // ShippingLocationAddDto -> ShippingLocationChangeLog
        ShippingLocationChangeLog shippingLocationChangeLog = new ShippingLocationChangeLog();
        ShippingLocationChangeLogAddDto shippingLocationChangeLogAddDto = new ShippingLocationChangeLogAddDto(null, null, addr, specAddr, defAddrFl, "추가", custId, shipLocaId);
        shippingLocationChangeLog.updateShippingLocationChangeLogAddDto(shippingLocationChangeLogAddDto);

        // 배송지 변경 이력 추가
        shippingLocationChangeLogDao.insert(shippingLocationChangeLog);
    }

    public List<ShippingLocationDto> getShippingLocationListByCustomer(String custId) {
        return shippingLocationDao.selectByCustomer(custId)
                .stream()
                .map(ShippingLocationAndShoppingLocationChangeLog::makeShippingLocationDto)
                .filter(sl -> "N".equals(sl.getDelFl())) // 삭제된 배송지는 제외
                .sorted(Comparator.comparing(ShippingLocationDto::getShipLocaRegDt).reversed()) // 최근 등록 순으로 배열
                .peek(sl -> {
                    // 01000010001 -> 010-0001-0001
                    if (sl.getTelNo() != null) {
                        String formattedTelNo = StringFormatUtils.formatPhoneNumber(sl.getTelNo());
                        sl.setTelNo(formattedTelNo);
                    }
                })
                .collect(Collectors.toList());
    }

    public ShippingLocationCurrDto getCurrShippingLocationByCustomer(String custId) {
        return shippingLocationDao.selectByCustomer(custId)
                .stream()
                .map(ShippingLocationAndShoppingLocationChangeLog::makeShippingLocationCurrDto)
                .filter(sl -> "Y".equals(sl.getCurrAddrFl())) // 삭제된 배송지는 제외
                .toList()
                .get(0);
    }

    public ShippingLocationModifyPageDto getShippingLocationToModifyByShipLocaId(String shipLocaId) {
        return shippingLocationDao.selectByShipLocaId(shipLocaId)
                .makeShippingLocationModifyPageDto();
    }

    @Transactional
    public void unflagDefAddr(String custId) {
        ShippingLocationUpdateDto shippingLocationUpdateDtoHavingDefAddr = shippingLocationDao.selectByCustomer(custId)
                .stream()
                .map(ShippingLocationAndShoppingLocationChangeLog::makeShippingLocationUpdateDto)
                .filter(sl -> sl.getDefAddrFl().equals("Y"))
                .findAny()
                .orElseGet(() -> null);

        if (shippingLocationUpdateDtoHavingDefAddr != null) {
            shippingLocationUpdateDtoHavingDefAddr.setDefAddrFl("N");

            // ShippingLocation -> updateShippingLocationUpdateDto
            ShippingLocation shippingLocation = new ShippingLocation();
            shippingLocation.updateShippingLocationUpdateDto(shippingLocationUpdateDtoHavingDefAddr);

            shippingLocationDao.updateByShipLocaId(shippingLocation);
        }
    }

    @Transactional
    public void unflagCurrAddrFl(String custId) {
        ShippingLocationUpdateDto shippingLocationUpdateDtoHavingCurrAddr = shippingLocationDao.selectByCustomer(custId)
                .stream()
                .map(ShippingLocationAndShoppingLocationChangeLog::makeShippingLocationUpdateDto)
                .filter(sl -> sl.getCurrAddrFl().equals("Y"))
                .findAny()
                .orElseGet(() -> null);

        if (shippingLocationUpdateDtoHavingCurrAddr != null) {
            shippingLocationUpdateDtoHavingCurrAddr.setCurrAddrFl("N");

            // ShippingLocation -> updateShippingLocationUpdateDto
            ShippingLocation shippingLocation = new ShippingLocation();
            shippingLocation.updateShippingLocationUpdateDto(shippingLocationUpdateDtoHavingCurrAddr);

            shippingLocationDao.updateByShipLocaId(shippingLocation);
        }
    }

    // 배송지 수정 (address-update.jsp)
    @Transactional
    public void modifyShippingLocation(String custId, ShippingLocationModifyDto shippingLocationModifyDto) {
        String shipLocaId = shippingLocationModifyDto.getShipLocaId();
        String specAddr = shippingLocationModifyDto.getSpecAddr();
        String defAddrFl = shippingLocationModifyDto.getDefAddrFl();
        String telNo = shippingLocationModifyDto.getTelNo();
        String recName = shippingLocationModifyDto.getRecName();

        // 기본 배송지로 설정할 경우 다른 배송지의 기본 배송지 값을 N으로 변경
        if ("Y".equals(defAddrFl))
            unflagDefAddr(custId);

        // 기존 ShippingLocation 정보 갖고 옴
        ShippingLocation shippingLocationExisting = shippingLocationDao.selectByShipLocaId(shipLocaId);

        shippingLocationModifyDto = shippingLocationExisting.makeShippingLocationModifyDto();
        shippingLocationModifyDto.setSpecAddr(specAddr);
        shippingLocationModifyDto.setDefAddrFl(defAddrFl);
        shippingLocationModifyDto.setTelNo(telNo);
        shippingLocationModifyDto.setRecName(recName);

        /*// 현재 주소만을 바꾸려는 경우
        // 1. 기존 현재 배송지를 모두 N으로 바꿈
        // 2. 바꾸려는 shipLocaId의 currAddrFl를 Y로 변경
        if ("Y".equals(currAddrFl)) {
            unflagCurrAddrFl(custId);
            shippingLocationUpdateCurrAddrDto.setCurrAddrFl(currAddrFl);
        } else { // 현재 주소 제외 배송지를 수정하려는 경우
        }*/

        shippingLocationExisting.updateShippingLocationModifyDto(shippingLocationModifyDto);

        log.info("{}", shippingLocationExisting);

        shippingLocationDao.updateByShipLocaId(shippingLocationExisting);
    }

    // 현재 배송지 수정 (address.jsp)
    @Transactional
    public void modifyCurrShippingLocation(String custId, String shipLocaId) {
        // 1. 기존 현재 배송지를 모두 N으로 바꿈
        unflagCurrAddrFl(custId);

        // 2. 기존 ShippingLocation 정보 갖고 옴
        ShippingLocation shippingLocationExisting = shippingLocationDao.selectByShipLocaId(shipLocaId);
        // 3. 바꾸려는 shipLocaId의 currAddrFl를 Y로 변경
        ShippingLocationModifyDto shippingLocationModifyDto = shippingLocationExisting.makeShippingLocationModifyDto();
        shippingLocationModifyDto.setCurrAddrFl("Y");

        // 4. 기존 ShippingLocation을 업데이트
        shippingLocationExisting.updateShippingLocationModifyDto(shippingLocationModifyDto);

        log.info("{}", shippingLocationExisting);

        shippingLocationDao.updateByShipLocaId(shippingLocationExisting);

        // 4. 로그 테이블에 추가
    }

    @Transactional
    public void removeShippingLocation(String shipLocaId) {
        // 1. 기존 ShippingLocation 정보 갖고 옴
        ShippingLocation shippingLocationExisting = shippingLocationDao.selectByShipLocaId(shipLocaId);

        // 2. 바꾸려는 shipLocaId의 delFl를 Y로 변경
        ShippingLocationModifyDto shippingLocationModifyDto = shippingLocationExisting.makeShippingLocationModifyDto();
        shippingLocationModifyDto.setDelFl("Y");

        // 3. 기존 ShippingLocation을 업데이트
        shippingLocationExisting.updateShippingLocationModifyDto(shippingLocationModifyDto);

        shippingLocationDao.updateByShipLocaId(shippingLocationExisting);

        // 4. 로그 테이블에 추가
    }

    private static String currDateAsYYYYMMDD() {
        LocalDate currLD = LocalDate.now();
        DateTimeFormatter dtFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        return currLD.format(dtFormatter);
    }
}

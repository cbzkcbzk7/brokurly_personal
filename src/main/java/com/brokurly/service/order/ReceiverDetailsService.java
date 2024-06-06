package com.brokurly.service.order;

import com.brokurly.entity.order.ReceiverDetails;
import com.brokurly.dto.order.ReceiverDetailsRequestDto;
import com.brokurly.dto.order.ReceiverDetailsResponseDto;
import com.brokurly.repository.order.ReceiverDetailsDao;
import com.brokurly.utils.IdGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReceiverDetailsService {
    private final ReceiverDetailsDao receiverDetailsDao;

    @Transactional
    public ReceiverDetailsResponseDto saveReceiverDetails(ReceiverDetailsRequestDto saveDto) {
        saveDto.setRcvDtlId(IdGenerator.generateRcvDtlId(saveDto.getCustId()));

        ReceiverDetails receiverDetails = new ReceiverDetails();
        receiverDetails.changeReceiverDetails(saveDto);

        int result = receiverDetailsDao.insert(receiverDetails);
        if (result == 0)
            throw new RuntimeException();

        return receiverDetails.toResponseDto();
    }

    public ReceiverDetailsResponseDto findReceiverDetails(String shipLocaId) {
        ReceiverDetails receiverDetails = receiverDetailsDao.selectByShipLocaId(shipLocaId);
        if (receiverDetails == null)
            return null;
        return receiverDetails.toResponseDto();
    }

    @Transactional
    public ReceiverDetailsResponseDto modifyReceiverDetails(String shipLocaId, ReceiverDetailsRequestDto changeDto) {
        ReceiverDetails receiverDetails = receiverDetailsDao.selectByShipLocaId(shipLocaId);
        receiverDetails.changeReceiverDetails(changeDto);
        receiverDetailsDao.update(receiverDetails);
        return receiverDetails.toResponseDto();
    }
}

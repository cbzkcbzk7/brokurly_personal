package com.brokurly.dto.order;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class ReceiverDetailsDto {
    private String rcvDtlId;
    private String shipLocaId;
    private String custId;
    private String rcvName;
    private String telNo;
    private String rcvPlace;
    private String enterMthd;
    private String placeExp;
    private String msgTime;
}

package com.brokurly.dto.order;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReceiverDetailsResponseDto {
    private String shipLocaId;
    private String rcvName;
    private String telNo;
    private String rcvPlace;
    private String enterMthd;
    private String placeExp;
    private String msgTime;
}

package com.brokurly.dto;

import lombok.*;


@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class OauthDto {
    private String snsId;
    private String name;
    private String email;
    private String telNo;


}
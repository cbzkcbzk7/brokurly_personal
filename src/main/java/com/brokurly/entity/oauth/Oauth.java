package com.brokurly.entity.oauth;

import com.brokurly.dto.OauthDto;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class Oauth {
    private String snsId;
    private String name;
    private String email;
    private String telNo;

    public OauthDto makeFullDto(){
        return OauthDto.builder()
                .snsId(snsId)
                .name(name)
                .email(email)
                .telNo(telNo)
                .build();
    }

    public void changeStatus(OauthDto oauthDto){
        this.snsId = oauthDto.getSnsId();
        this.name = oauthDto.getName();
        this.email = oauthDto.getEmail();
        this.telNo = oauthDto.getTelNo();
    }
}
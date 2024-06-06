package com.brokurly.dto.member;

import lombok.*;

import javax.validation.constraints.NotBlank;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberAndLoginDto {
    @NotBlank
    private String custId;
    @NotBlank
    private String pwd;

    private String name;
}

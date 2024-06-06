package com.brokurly.dto.order;

import lombok.*;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class ReceiverDetailsRequestDto {
    @NotBlank
    @Length(min = 1, max = 10)
    @Pattern(regexp = "^[가-힣\\s]+$")
    private String rcvName;

    @NotBlank
    @Pattern(regexp = "^010\\d{8}$")
    private String telNo;

    @NotBlank
    @Pattern(regexp = "^[가-힣\\s]+$")
    private String rcvPlace;

    @NotBlank
    @Pattern(regexp = "^[가-힣\\s]+$")
    private String enterMthd;

    @Pattern(regexp = "^[a-zA-Z0-9가-힣.,!?#-]*$")
    private String placeExp;

    @NotBlank
    @Pattern(regexp = "^[가-힣\\s]+$")
    private String msgTime;

    private String rcvDtlId;
    private String shipLocaId;
    private String custId;
}

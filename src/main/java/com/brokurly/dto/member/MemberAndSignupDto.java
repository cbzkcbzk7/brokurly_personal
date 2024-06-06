package com.brokurly.dto.member;

import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;


@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberAndSignupDto {
//    @NotBlank(message = "아이디를 입력해 주세요")
//    @Pattern(regexp = "^[a-z]+[a-z0-9]{5,17}$",
//            message = "id regEx is checked. back") //6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합
    private String custId;

    @NotBlank(message = "비밀번호를 입력해 주세요")
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,15}$",
             message = "영문/숫자/특수기호만 허용하며, 모두 조합")
    private String pwd;

    @NotBlank(message = "이름을 입력해 주세요")
    private String name;

    @NotBlank(message = "이메일을 입력해 주세요")
    @Email(message = "email regEx is checked. back") //이메일 형식으로 입력해 주세요
    private String email;

    @NotBlank(message = "휴대폰 번호를 입력해 주세요")
    @Pattern(regexp="^01(?:0|1|[6-9])\\d{8}$",
            message = "telNo regEx is checked. back") //휴대폰 번호 형식으로 입력해 주세요
    private String telNo;
    private String sex;
    private String birthDt;
    private String consent;
    private String snsId;


}
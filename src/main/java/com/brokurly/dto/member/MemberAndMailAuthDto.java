package com.brokurly.dto.member;

import lombok.*;

/**
 * packageName    : com.brokurly.dto.member
 * fileName       : MemberAndMailAuthDto
 * author         : Sora
 * date           : 2024-03-06
 * description    : 메일 인증을 위한 dto
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024-03-06        Sora       최초 생성
 */

@Setter
@Getter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberAndMailAuthDto {
    private String custId;
    private String email;
    private Integer mailAuth;
    private String mailKey;
}

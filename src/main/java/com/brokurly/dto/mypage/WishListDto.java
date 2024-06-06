package com.brokurly.dto.mypage;


import lombok.*;

@Getter
@Setter
@Builder
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class WishListDto {
    private String itemId;
    private String custId;

}

package com.brokurly.dto.goods;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class GoodsImageDto {
    private String img;
    private String repImgFl;
    private String itemId;

}

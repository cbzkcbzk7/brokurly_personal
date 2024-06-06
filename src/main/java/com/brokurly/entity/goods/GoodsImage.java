package com.brokurly.entity.goods;

import com.brokurly.dto.goods.GoodsImageDto;
import lombok.*;

@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class GoodsImage {
    private String img;
    private String repImgFl;
    private String itemId;

    public GoodsImageDto makeFullDto(){
        return GoodsImageDto.builder()
                .img(img)
                .repImgFl(repImgFl)
                .itemId(itemId)
                .build();
    }

    public void changeStatus(GoodsImageDto goodsImageDto){
        this.img = goodsImageDto.getImg();
        this.repImgFl = goodsImageDto.getRepImgFl();
        this.itemId = goodsImageDto.getItemId();
    }

}

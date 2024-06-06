package com.brokurly.entity.goods;

import com.brokurly.dto.goods.GoodsAnnouncementDto;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class GoodsAnnouncement {
    private String itemId;
    private String itemAnnCate;
    private String itemAnn;

    public GoodsAnnouncementDto makeFullDto(){
        return GoodsAnnouncementDto.builder()
                .itemId(itemId)
                .itemAnnCate(itemAnnCate)
                .itemAnn(itemAnn)
                .build();
    }

    public void changeStatus(GoodsAnnouncementDto goodsAnnouncementDto){
        this.itemId = goodsAnnouncementDto.getItemId();
        this.itemAnnCate = goodsAnnouncementDto.getItemAnnCate();
        this.itemAnn = goodsAnnouncementDto.getItemAnn();
    }

}

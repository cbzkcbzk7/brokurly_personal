package com.brokurly.entity.goods;

import com.brokurly.dto.goods.GoodsInquiryLogDto;
import lombok.*;

@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class GoodsInquiryLog {
  private int inqNo;
  private String custId;
  private String itemId;
  private String inqTitle;
  private String inqContent;
  private String regDt;
  private String privFl;
  private String replyStat;
  private String replyContent;
  private String replyDt;

  //상품 테이블
  private String name;

  public GoodsInquiryLogDto makeFullDto() {
    return GoodsInquiryLogDto.builder()
            .inqNo(inqNo)
            .custId(custId)
            .itemId(itemId)
            .inqTitle(inqTitle)
            .inqContent(inqContent)
            .regDt(regDt)
            .privFl(privFl)
            .replyStat(replyStat)
            .replyContent(replyContent)
            .replyDt(replyDt)
            .name(name)
            .build();
  }

  public void changeStatus(GoodsInquiryLogDto goodsInquiryLogDto) {
    this.inqNo = goodsInquiryLogDto.getInqNo();
    this.custId = goodsInquiryLogDto.getCustId();
    this.itemId = goodsInquiryLogDto.getItemId();
    this.inqTitle = goodsInquiryLogDto.getInqTitle();
    this.inqContent = goodsInquiryLogDto.getInqContent();
    this.regDt = goodsInquiryLogDto.getRegDt();
    this.privFl = goodsInquiryLogDto.getPrivFl();
    this.replyStat = goodsInquiryLogDto.getReplyStat();
    this.replyContent = goodsInquiryLogDto.getReplyContent();
    this.replyDt = goodsInquiryLogDto.getReplyDt();
    this.name = goodsInquiryLogDto.getName();
  }
}

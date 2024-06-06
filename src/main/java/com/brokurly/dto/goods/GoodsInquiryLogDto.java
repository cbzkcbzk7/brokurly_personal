package com.brokurly.dto.goods;

import lombok.*;

@Getter
@Setter
@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
public class GoodsInquiryLogDto {
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
}

package com.brokurly.dto.goods;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@Builder
@EqualsAndHashCode
public class GoodsReviewBoardDto {
  private String revNo;
  private String itemId;
  private String custId;
  private String content;
  private Timestamp regDt;
  private int likeCnt;
  //상품 테이블
  private String name;
  private String grade;
}

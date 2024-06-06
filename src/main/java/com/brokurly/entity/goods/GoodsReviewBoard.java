package com.brokurly.entity.goods;



import com.brokurly.dto.goods.GoodsReviewBoardDto;
import lombok.*;

import java.sql.Timestamp;

@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class GoodsReviewBoard {
  private String revNo;
  private String itemId;
  private String custId;
  private String content;
  private Timestamp regDt;
  private int likeCnt;
  //상품 테이블
  private String name;
  private String grade;

  public GoodsReviewBoardDto makeFullDto(){
    return GoodsReviewBoardDto.builder()
            .revNo(revNo)
            .itemId(itemId)
            .custId(custId)
            .content(content)
            .regDt(regDt)
            .likeCnt(likeCnt)
            .name(name)
            .grade(grade)
            .build();
  }

  public void changeStatus(GoodsReviewBoardDto goodsReivewBoardDto){
    this.revNo = goodsReivewBoardDto.getRevNo();
    this.itemId = goodsReivewBoardDto.getItemId();
    this.custId = goodsReivewBoardDto.getCustId();
    this.content = goodsReivewBoardDto.getContent();
    this.regDt = goodsReivewBoardDto.getRegDt();
    this.likeCnt = goodsReivewBoardDto.getLikeCnt();
    this.name = goodsReivewBoardDto.getName();
    this.grade = goodsReivewBoardDto.getGrade();
  }
}

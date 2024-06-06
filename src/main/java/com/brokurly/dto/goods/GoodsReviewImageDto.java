package com.brokurly.dto.goods;

import lombok.*;

@Getter
@Setter
@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
public class GoodsReviewImageDto {
  private String img;
  private String revNo;
  private String repImgFl;
}

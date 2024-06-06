package com.brokurly.dto.goods;

import lombok.*;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
public class GoodsDto {
  @NotNull(message = "필수 입력 값 입니다.")
  private String itemId;

  @NotNull(message = "필수 입력 값 입니다.")
  private String name;

  @NotNull(message = "필수 입력 값 입니다.")
  private String exp;

  @NotNull(message = "필수 입력 값 입니다.")
  private Integer price;

  @NotNull(message = "필수 입력 값 입니다.")
  private Integer dcRt;

  @NotNull(message = "필수 입력 값 입니다.")
  private int itemDcAmt;

  @NotNull(message = "필수 입력 값 입니다.")
  private String origin;

  @NotNull(message = "필수 입력 값 입니다.")
  private String pointFl;

  @NotNull(message = "필수 입력 값 입니다.")
  private String cpnElgFl;

  @NotNull(message = "필수 입력 값 입니다.")
  private String shipType;

  @NotNull(message = "필수 입력 값 입니다.")
  private String sellerName;

  @NotNull(message = "필수 입력 값 입니다.")
  private String pkgType;

  @NotNull(message = "필수 입력 값 입니다.")
  private String capa;

  @NotNull(message = "필수 입력 값 입니다.")
  private int sellUnit;

  @NotNull(message = "필수 입력 값 입니다.")
  private String adultVerifFl;

  @NotNull(message = "필수 입력 값 입니다.")
  private String cateCode;

  @NotNull(message = "필수 입력 값 입니다.")
  private int itemQty;

  @NotNull(message = "필수 입력 값 입니다.")
  private String bsnsNo;

  @NotNull(message = "필수 입력 값 입니다.")
  private String itemSpec;

}

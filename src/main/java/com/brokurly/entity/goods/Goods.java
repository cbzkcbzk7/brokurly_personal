package com.brokurly.entity.goods;

import com.brokurly.dto.goods.GoodsByBsnsNoDto;
import com.brokurly.dto.goods.GoodsDto;
import com.brokurly.dto.goods.GoodsForCartDto;
import com.brokurly.dto.goods.GoodsListDto;
import com.brokurly.dto.goods.*;
import lombok.*;

import java.util.Date;

@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
  private String itemId;
  private String name;
  private String exp;
  private int price;
  private int dcRt;
  private int itemDcAmt;
  private String origin;
  private String pointFl;
  private String cpnElgFl;
  private String shipType;
  private String sellerName;
  private String pkgType;
  private String capa;
  private int sellUnit;
  private Date regDt;
  private String adultVerifFl;
  private String cateCode;
  private int itemQty;
  private int wishCnt;
  private String bsnsNo;
  private String itemSpec;
  private int sellCnt;
  private int revCnt;
  private String stdySellerFl;


  public GoodsListDto makeGoodsList(){
    return GoodsListDto.builder()
            .itemId(itemId)
            .name(name)
            .exp(exp)
            .price(price)
            .dcRt(dcRt)
            .disPrice(price-itemDcAmt)
            .itemDcAmt(itemDcAmt)
            .revCnt(revCnt)
            .shipType(shipType)
            .build();
  }

  public GoodsDto makeFullDto() {
    return GoodsDto.builder()
            .itemId(itemId)
            .name(name)
            .exp(exp)
            .price(price)
            .dcRt(dcRt)
            .itemDcAmt(itemDcAmt)
            .origin(origin)
            .pointFl(pointFl)
            .cpnElgFl(cpnElgFl)
            .shipType(shipType)
            .sellerName(sellerName)
            .pkgType(pkgType)
            .capa(capa)
            .sellUnit(sellUnit)
            .adultVerifFl(adultVerifFl)
            .cateCode(cateCode)
            .itemQty(itemQty)
            .bsnsNo(bsnsNo)
            .itemSpec(itemSpec)
            .build();
  }

  public GoodsUpdateDto updateDto() {
    return GoodsUpdateDto.builder()
            .name(name)
            .exp(exp)
            .price(price)
            .dcRt(dcRt)
            .itemDcAmt(itemDcAmt)
            .origin(origin)
            .pointFl(pointFl)
            .cpnElgFl(cpnElgFl)
            .shipType(shipType)
            .sellerName(sellerName)
            .pkgType(pkgType)
            .capa(capa)
            .sellUnit(sellUnit)
            .adultVerifFl(adultVerifFl)
            .cateCode(cateCode)
            .itemQty(itemQty)
            .bsnsNo(bsnsNo)
            .itemSpec(itemSpec)
            .build();
  }

  public GoodsDetailDto detailMakeFullDto() {
    return GoodsDetailDto.builder()
            .itemId(itemId)
            .name(name)
            .exp(exp)
            .price(price)
            .dcRt(dcRt)
            .itemDcAmt(itemDcAmt)
            .origin(origin)
            .pointFl(pointFl)
            .cpnElgFl(cpnElgFl)
            .shipType(shipType)
            .sellerName(sellerName)
            .pkgType(pkgType)
            .capa(capa)
            .sellUnit(sellUnit)
            .adultVerifFl(adultVerifFl)
            .cateCode(cateCode)
            .itemQty(itemQty)
            .bsnsNo(bsnsNo)
            .itemSpec(itemSpec)
            .salePrice(price - itemDcAmt)
            .build();
  }

  public GoodsForCartDto toGoodsForCartDto() {
    return GoodsForCartDto.builder()
            .name(name)
            .price(price)
            .itemDcAmt(itemDcAmt)
            .shipType(shipType)
            .pkgType(pkgType)
            .build();
  }

  public GoodsByBsnsNoDto toGoodsByBsnsNoDto(String bsnsNo){
    return GoodsByBsnsNoDto.builder()
            .itemId(itemId)
            .name(name)
            .price(price)
            .dcRt(dcRt)
            .itemDcAmt(itemDcAmt)
            .bsnsNo(this.bsnsNo)
            .build();
  }

  public void changeStatus(GoodsDto goodsDto) {
    this.itemId = goodsDto.getItemId();
    this.name = goodsDto.getName();
    this.exp = goodsDto.getExp();
    this.price = goodsDto.getPrice();
    this.dcRt = goodsDto.getDcRt();
    this.itemDcAmt = goodsDto.getItemDcAmt();
    this.origin = goodsDto.getOrigin();
    this.pointFl = goodsDto.getPointFl();
    this.cpnElgFl = goodsDto.getCpnElgFl();
    this.shipType = goodsDto.getShipType();
    this.sellerName = goodsDto.getSellerName();
    this.pkgType = goodsDto.getPkgType();
    this.capa = goodsDto.getCapa();
    this.sellUnit = goodsDto.getSellUnit();
    this.adultVerifFl = goodsDto.getAdultVerifFl();
    this.cateCode = goodsDto.getCateCode();
    this.itemQty = goodsDto.getItemQty();
    this.bsnsNo = goodsDto.getBsnsNo();
    this.itemSpec = goodsDto.getItemSpec();

  }

  public void UpdateStatus(GoodsUpdateDto goodsUpdateDto) {
    this.name = goodsUpdateDto.getName();
    this.exp = goodsUpdateDto.getExp();
    this.price = goodsUpdateDto.getPrice();
    this.dcRt = goodsUpdateDto.getDcRt();
    this.itemDcAmt = goodsUpdateDto.getItemDcAmt();
    this.origin = goodsUpdateDto.getOrigin();
    this.pointFl = goodsUpdateDto.getPointFl();
    this.cpnElgFl = goodsUpdateDto.getCpnElgFl();
    this.shipType = goodsUpdateDto.getShipType();
    this.sellerName = goodsUpdateDto.getSellerName();
    this.pkgType = goodsUpdateDto.getPkgType();
    this.capa = goodsUpdateDto.getCapa();
    this.sellUnit = goodsUpdateDto.getSellUnit();
    this.adultVerifFl = goodsUpdateDto.getAdultVerifFl();
    this.cateCode = goodsUpdateDto.getCateCode();
    this.itemQty = goodsUpdateDto.getItemQty();
    this.bsnsNo = goodsUpdateDto.getBsnsNo();
    this.itemSpec = goodsUpdateDto.getItemSpec();

  }



}

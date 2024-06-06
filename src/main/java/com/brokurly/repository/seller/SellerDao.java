package com.brokurly.repository.seller;



import com.brokurly.entity.seller.Seller;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellerDao {

    Seller selectSellerByLogin(Seller seller);

    Seller selectBsnsNoById(String id);
}
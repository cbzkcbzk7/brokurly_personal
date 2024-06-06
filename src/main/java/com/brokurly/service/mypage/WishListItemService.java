package com.brokurly.service.mypage;

import com.brokurly.dto.mypage.WishListDto;
import com.brokurly.dto.mypage.WishListItemDto;
import com.brokurly.entity.mypage.WishList;
import com.brokurly.entity.mypage.WishListItem;
import com.brokurly.repository.mypage.WishListDao;
import com.brokurly.repository.mypage.WishListItemDao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class WishListItemService {

    private final WishListItemDao wishListItemDao;
    private final WishListDao wishListDao;

    @Transactional
    public int addWish(WishListItemDto wishListItemDto) {
        WishListItem wishListItem = new WishListItem();
        wishListItem.changeStatus(wishListItemDto);
        return wishListItemDao.insert(wishListItem);
    }

    @Transactional
    public int deleteWish(String itemId, String custId) {
        WishList wishList = new WishList();
        wishList.changeStatus(new WishListDto(itemId, custId));
        return wishListDao.delete(wishList);
    }

    @Transactional
    public List<WishListItemDto> searchWishList(String custId) {
        List<WishListItem> wishListItemList = wishListItemDao.searchByCustId(custId);
        List<WishListItemDto> wishListItemDto = new ArrayList<>();

        for (WishListItem wishListItem : wishListItemList) {
            wishListItemDto.add(wishListItem.makeFullWishListItem());
        }
        return wishListItemDto;
    }

    @Transactional
    public int getWishListCounter(String custId) {
        return wishListItemDao.searchByCustId(custId).size();
    }
}

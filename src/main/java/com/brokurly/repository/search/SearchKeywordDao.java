package com.brokurly.repository.search;


import com.brokurly.entity.search.SearchKeyword;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SearchKeywordDao {

    int insert(SearchKeyword searchKeyword);

    List<String> selectItemIdListByKeyword(String sword);
}

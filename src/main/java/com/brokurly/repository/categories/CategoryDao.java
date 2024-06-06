package com.brokurly.repository.categories;

import com.brokurly.dto.categories.CategoryDto;
import com.brokurly.entity.categories.Category;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface CategoryDao {

    int insert(Category category);

    int deletebyId (String codeId);

    int deleteAll();

    List<Category> getCategoryExpByPrimary(String codeId);

    // CREATE
    //카테고리 추가
    int insertCategory(CategoryDto categoryDto);

    //READ
    //카테고리 대분류 가져오기
    List<Category> selectPrimary();

    //카테고리 중분류 가져오기
    List<Category> selectMiddle(@RequestParam String codeId);

    //카테고리 개수
//    int count() throws Exception;

    //카테고리 전체 삭제
//    int deleteAll();

    //카테고리 삭제
    int delete(String exp);

}

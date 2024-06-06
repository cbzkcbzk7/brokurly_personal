package com.brokurly.entity.categories;

import com.brokurly.dto.categories.CategoryDto;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;


@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    String codeId;
    String exp;

    public CategoryDto makeFullDto(){
        return CategoryDto.builder()
                .codeId(codeId)
                .exp(exp)
                .build();
    }
}

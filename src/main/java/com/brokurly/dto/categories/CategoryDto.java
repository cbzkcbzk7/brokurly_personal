package com.brokurly.dto.categories;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
//@RequiredArgsConstructor // Required : final or @NotNull
//@NoArgsConstructor // Builder가 없었다면
//@AllArgsConstructor // Builder가 있어서
public class CategoryDto {
    String codeId;
    String exp;
}

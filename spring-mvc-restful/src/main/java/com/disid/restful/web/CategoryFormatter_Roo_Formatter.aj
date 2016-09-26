// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.restful.web;

import com.disid.restful.model.Category;
import com.disid.restful.service.api.CategoryService;
import com.disid.restful.web.CategoryFormatter;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.core.convert.ConversionService;
import org.springframework.format.Formatter;
import org.springframework.util.StringUtils;

privileged aspect CategoryFormatter_Roo_Formatter {
    
    declare parents: CategoryFormatter implements Formatter<Category>;
    
    public CategoryService CategoryFormatter.categoryService;
    
    public ConversionService CategoryFormatter.conversionService;
    
    public CategoryFormatter.new(CategoryService categoryService, ConversionService conversionService) {
        this.categoryService = categoryService;
        this.conversionService = conversionService;
    }

    public Category CategoryFormatter.parse(String text, Locale locale) throws ParseException {
        if (text == null || !StringUtils.hasText(text)) {
            return null;
        }
        Long id = conversionService.convert(text, Long.class);
        return categoryService.findOne(id);
    }
    
    public String CategoryFormatter.print(Category category, Locale locale) {
        return category == null ? null : new StringBuilder().append(category.getName()).append(" - ").append(category.getDescription()).toString();
    }
    
}

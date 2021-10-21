package model.service.impl;

import model.bean.Category;
import model.repositories.ICategoryRepository;
import model.repositories.impl.CategoryRepositoryImpl;
import model.service.ICategoryService;

import java.util.List;

public class CategoryServiceImpl implements ICategoryService {
    CategoryRepositoryImpl categoryRepository = new CategoryRepositoryImpl();
    @Override
    public List<Category> getAllCategory() {
        return categoryRepository.getAllCategory();
    }
}

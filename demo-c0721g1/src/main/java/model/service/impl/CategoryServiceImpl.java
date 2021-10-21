package model.service.impl;

import model.bean.Category;
import model.repositories.CategoryRepository;
import model.repositories.impl.CategoryRepositoryImpl;
import model.service.CategoryService;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    CategoryRepository categoryRepository = new CategoryRepositoryImpl();
    @Override
    public List<Category> findAll() {
        return categoryRepository.getAll();
    }
}

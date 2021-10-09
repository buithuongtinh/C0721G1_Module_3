package model.repository.impl;

import model.bean.Product;
import model.repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements IProductRepository {

    static Map<Integer, Product> productMap = new HashMap<>();

    static {
        productMap.put(1,new Product(1,"táo","Úc",77700));
        productMap.put(2,new Product(1,"cam","Việt Nam",66700));
        productMap.put(3,new Product(1,"xoài","Thái",44700));
        productMap.put(4,new Product(1,"ổi","Nhật",99700));
        productMap.put(5,new Product(1,"nho","Mỹ",72200));

    }
    public static int autoIncrementId(){
        int id = 0;
        if (productMap.isEmpty()){
            return 1;
        }else {
            return id =productMap.get(productMap.size() - 1).getId() +1;
        }
    }

    @Override
    public List<Product> display() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void createNew(Product product) {
        productMap.put(autoIncrementId(), product);
    }

    @Override
    public void updateProduct(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public Product showDetailInfo(int id) {
        return productMap.get(id);
    }

    @Override
    public Product searchById(int id) {
        return productMap.get(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> productList = new ArrayList<>();
        for (Product product : productMap.values()) {
            if (product.getName().equals(name)){
                productList.add(product);
            }
        }
        return productList;
    }
}

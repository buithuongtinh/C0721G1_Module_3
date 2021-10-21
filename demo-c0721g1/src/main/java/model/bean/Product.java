package model.bean;

public class Product {
    private int idProduct;
    private String nameProduct;
    private boolean status;
    private double price;
    private int idCategory;
    private String nameCategory;

    public Product(String nameProduct, boolean status, double price, int idCategory) {
        this.nameProduct = nameProduct;
        this.status = status;
        this.price = price;
        this.idCategory = idCategory;
    }

    public Product(int idProduct, String nameProduct, boolean status, double price, int idCategory, String nameCategory) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.status = status;
        this.price = price;
        this.idCategory = idCategory;
        this.nameCategory = nameCategory;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }
}

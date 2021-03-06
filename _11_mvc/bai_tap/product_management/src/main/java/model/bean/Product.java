package model.bean;

public class Product {
    private int id;
    private String name;
    private String maker;
    private double price;

    public Product() {
    }

    public Product(int id, String name, String maker, double price) {
        this.id = id;
        this.name = name;
        this.maker = maker;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMaker() {
        return maker;
    }

    public void setMaker(String maker) {
        this.maker = maker;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}

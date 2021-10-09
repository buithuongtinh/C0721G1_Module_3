public class Product {
    private String nameProduct;
    private String dateOfBirth;
    private String address;
    private String image;

    public Product() {
    }

    public Product(String nameProduct, String dateOfBirth, String address, String image) {
        this.nameProduct = nameProduct;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.image = image;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}

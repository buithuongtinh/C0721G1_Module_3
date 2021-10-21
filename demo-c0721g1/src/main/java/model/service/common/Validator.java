package model.service.common;

public class Validator {
    public static String validateName(String name) {
        String message = null;
        String regex = "([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10})){0,5}$";
        if (!name.matches(regex)) {
            message = "Tên sản phẩm không hợp lệ";
        }
        return message;
    }

    public static String validatePrice(double price) {
        String message = null;
        if (price <= 0) {
            message = "Giá phải là số dương";
        }
        return message;
    }
    public static String validateNumber(String number) {
        String message = null;
        String regex = "^\\d+$";
        if (!number.matches(regex)) {
            message = "Vui lòng nhập số";
        }
        return message;
    }
}

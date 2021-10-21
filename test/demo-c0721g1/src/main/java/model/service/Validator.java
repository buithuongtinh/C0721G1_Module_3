package model.service;

public class Validator {
    public static String validateName (String name) {
        String message = null;
        String regex = "^([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10}|[\\p{Lu}]\\d*[\\p{Lu}]*|\\d*)){0,5}$";
        if (!name.matches(regex)) {
            message = "Tên sản phẩm không hợp lệ. Hãy nhập lại.";
        }
        return message;
    }

    public static String validateColor (String color) {
        String message = null;
        String regex = "^([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10})){0,5}$";
        if (!color.matches(regex)) {
            message = "Màu không hợp lệ. Hãy nhập lại.";
        }
        return message;
    }

    public static String validateDescription (String description) {
        String message = null;
        String regex = "^([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10})){0,5}$";
        if (!description.matches(regex)) {
            message = "Mô tả không hợp lệ. Hãy nhập lại.";
        }
        return message;
    }

    public static String validatePrice (double price) {
        String message = null;
        if (price <= 0) {
            message = "Giá phải là số dương";
        }
        return message;
    }

    public static String validateQuantity(int quantity) {
        String message = null;
        if (quantity <= 0) {
            message = "Số lượng phải là số dương";
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

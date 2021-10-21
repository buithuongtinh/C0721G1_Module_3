package model.service.common;

public class Validate {

    public static String customerCode(String code) {
        String message = null;
        String regexCode = "(KH)[-][\\d]{4}";
        if (!code.matches(regexCode)) {
            message = "Wrong format [(KH)-(XXXX)]. Retry.";
        }
        return message;
    }

    public static String serviceCode(String code) {
        String message = null;
        String regexCode = "(DV)[-][\\d]{4}";
        if (!code.matches(regexCode)) {
            message = "Wrong format [(DV)-(XXXX)]. Retry.";
        }
        return message;
    }

    public static String validateEmail(String email) {
        String message = null;
        String regexCode = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
        if (!email.matches(regexCode)) {
            message = "Wrong format email. Retry.";
        }
        return message;
    }

    public static String validateNumber(int number) {
        String message = null;
        if (number < 0) {
            message = "Not OK. Student point invalid";
        }
        return message;
    }

    public static boolean validateNumber2(String num) {
        String regex = "^\\d$";
        return num.matches(regex);
    }
}

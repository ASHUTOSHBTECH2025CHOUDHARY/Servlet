import java.util.regex.*;

public class UserValidation {

    private static final String USERNAME_REGEX = "^[A-Z][a-zA-Z0-9]*$";

    public static boolean isValidUsername(String username) {
        return username != null && Pattern.matches(USERNAME_REGEX, username);
    }
}
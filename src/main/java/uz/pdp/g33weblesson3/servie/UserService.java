package uz.pdp.g33weblesson3.servie;

import uz.pdp.g33weblesson3.domain.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserService {
    private static final List<User> USERS = new ArrayList<>();

    public User save(String username, String email, String password) {
        if (USERS.stream().anyMatch(u -> email.equals(u.getEmail()))) {
            throw new RuntimeException("Email already register");
        }
        User user = User.builder()
                .username(username)
                .email(email)
                .password(password)
                .build();
        USERS.add(user);
        return user;
    }

    public User getByEmailAndPassword(String email, String password) {
        User user = USERS.stream().filter(u -> u.getEmail().equals(email)).findFirst()
                .orElseThrow(() -> new RuntimeException("Email not found"));

        if (!user.getPassword().equals(password)) {
            throw new RuntimeException("Incorrect password");
        }
        return user;
    }
}

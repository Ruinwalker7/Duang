package me.huding.luobo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private long id;

    private String username;

    private String password;

    private String nickname;

    private String headurl;
}

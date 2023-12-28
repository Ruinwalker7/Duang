package me.huding.luobo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private String id;

    private String nickname;

    private String content;

    private Timestamp cdate;

    private String blogId;

    private int status;

    private String blogName;
}

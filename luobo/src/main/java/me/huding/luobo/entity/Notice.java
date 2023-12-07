package me.huding.luobo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
    private String id;

    private String content;

    private Timestamp start;

    private Timestamp end;

    private boolean visible;

}

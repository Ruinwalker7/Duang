package me.huding.luobo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BlogCategory {
    private String id;

    private String name;

    private Timestamp cdate;

    private int typeID;

    private String keywords;

    private int blogNum;

}

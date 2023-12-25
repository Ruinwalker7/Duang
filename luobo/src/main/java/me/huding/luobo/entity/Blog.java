package me.huding.luobo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Blog {
    private String id;

    private String title;

    private String blogAbstract;

    private String blogAbstractText;

    private String content;

    private int commentNum;

    private int heartNum;

    private int readNum;

    private Timestamp publishTime;

    private String signature;

    private String categoryID;

    private Timestamp lastUpdateTime;

    private String path;

    private String coverURL;

    private int status;

    private String html;

    private String tags;

    private int ShareNum;

    private int lunbo;
}

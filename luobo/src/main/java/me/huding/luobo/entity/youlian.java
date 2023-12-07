package me.huding.luobo.entity;

import com.mysql.cj.util.DnsSrv;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class youlian {
    private String id;

    private String name;

    private String logo;

    private String url;

    private Timestamp cdate;
}

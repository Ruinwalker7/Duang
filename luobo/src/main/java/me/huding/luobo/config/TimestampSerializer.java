package me.huding.luobo.config;

import com.google.gson.JsonSerializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class TimestampSerializer implements JsonSerializer<Timestamp> {
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public JsonElement serialize(Timestamp src, Type typeOfSrc, JsonSerializationContext context) {
        return src == null ? null : new JsonPrimitive(dateFormat.format(src));
    }
}
package me.huding.luobo.utils;


import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
public class Result implements Serializable {
        private int code;
        private String message;
        private Object data;

        public int getCode() {
            return code;
        }

        public Result setCode(int code) {
            this.code = code;
            return this;
        }

        public String getMessage() {
            return message;
        }

        public Result setMessage(String message) {
            this.message = message;
            return this;
        }

        public Object getData() {
            return data;
        }

        public Result setData(Object data) {
            this.data = data;
            return this;
        }
}


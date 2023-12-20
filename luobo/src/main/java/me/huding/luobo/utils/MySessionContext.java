package me.huding.luobo.utils;

import javax.servlet.http.HttpSession;
import java.util.concurrent.ConcurrentHashMap;

public class MySessionContext {
    private static MySessionContext instance;
    private ConcurrentHashMap<String, HttpSession> sessionMap;

    private MySessionContext() {
        sessionMap = new ConcurrentHashMap<String,HttpSession>();
    }

    public static MySessionContext getInstance() {
        if (instance == null) {
            instance = new MySessionContext();
        }
        return instance;
    }

    public synchronized void addSession(HttpSession session) {
        if (session != null) {
            sessionMap.put(session.getId(), session);
        }
    }

    public synchronized void delSession(HttpSession session) {
        if (session != null) {
            sessionMap.remove(session.getId());
        }
    }

    public synchronized HttpSession getSession(String sessionID) {
        if (sessionID == null) {
            return null;
        }
        return sessionMap.get(sessionID);
    }

}

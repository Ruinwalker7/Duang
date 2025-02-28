package me.huding.luobo.config;

public class ResConsts {


	/**
	 * 响应码常量类
	 *
	 */
	public static class Code {
		/**
		 * 请求成功
		 */
		public static final int SUCCESS = 0;
		/**
		 * 请求失败
		 */
		public static final int FAILURE = 1001;
		/**
		 * 静态化失败
		 */
		public static final int STATICS_ERROR = 1002;
		/**
		 * 已存在
		 */
		public static final int EXISTS = 1003;
		/**
		 * 服务器端异常
		 */
		public static final int SERVER_ERROR = 5000;
		/**
		 * OK
		 */
		public static final int OK = 0;
		
		
		public static final int USER_ERROR = 2000;
		
		public static final int PASS_ERROR = 2001;
		
		public static final int CODE_ERROR = 2002;
		
		
		public static final int NO_AUTH = 3000;
	}
	
	/**
	 * 
	 * 响应消息常量类
	 *
	 */
	public static class Msg {
		
		/**
		 * 服务器端异常提示消息
		 */
		public static final String SERVER_ERROR = "服务器端发生异常....";
	}
	

}

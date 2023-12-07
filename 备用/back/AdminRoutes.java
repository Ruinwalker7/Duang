package me.huding.luobo.back;

import com.jfinal.config.Routes;
import com.jfinal.core.Controller;

public class AdminRoutes extends Routes {
	
	public static final String PREFIX = "/admin";
	
	@Override
	public Routes add(String controllerKey, Class<? extends Controller> controllerClass) {
		controllerKey = PREFIX + controllerKey;
		return super.add(controllerKey, controllerClass);
	}

	@Override
	public void config() {
		add("",MainController.class);
		add("/blog",BlogController.class);
		add("/upload",UploadController.class);
		add("/category",CategoryController.class);
		add("/notice",NoticeController.class);
		add("/type",TypeController.class);
		add("/youlian",YoulianController.class);
		add("/donate",DonateController.class);
		add("/tag",TagController.class);
		add("/comment",CommentController.class);
	}

}

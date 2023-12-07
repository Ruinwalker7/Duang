package me.huding.luobo;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;

import me.huding.luobo.back.AdminRoutes;
import me.huding.luobo.front.FrontRoutes;
import me.huding.luobo.interceptor.AuthInterceptor;
import me.huding.luobo.interceptor.CrossDomainInterceptor;
import me.huding.luobo.model._MappingKit;

public class AppConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		me.setDevMode(true);
		me.setViewType(ViewType.JSP);
	}

	@Override
	public void configRoute(Routes me) {
		// 后端路由
		me.add(new AdminRoutes());
		// 前端路由
		me.add(new FrontRoutes());
	}

	@Override
	public void configPlugin(Plugins me) {
		DruidPlugin cp = new DruidPlugin(Parameters.DB_URL,
				Parameters.DB_USERNAME, Parameters.DB_PASSWORD);
		me.add(cp);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);
		_MappingKit.mapping(arp);
		me.add(arp);
	}

	@Override
	public void configInterceptor(Interceptors me) {
		me.add(new CrossDomainInterceptor());
		me.add(new AuthInterceptor());
	}

	@Override
	public void configHandler(Handlers me) {

	}
	
	@Override
	public void configEngine(Engine arg0) {
		// TODO Auto-generated method stub
		
	}

	public static void main(String[] args) {
		JFinal.start("WebRoot", 8080, "/", 5);
	}

}

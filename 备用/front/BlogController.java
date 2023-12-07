package me.huding.luobo.front;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import me.huding.luobo.BaseController;
import me.huding.luobo.ResConsts;
import me.huding.luobo.model.Blog;
import me.huding.luobo.model.Category;
import me.huding.luobo.model.Tags;
import me.huding.luobo.model.Timeline;
import me.huding.luobo.utils.DBUtils;
import me.huding.luobo.utils.DateStyle;
import me.huding.luobo.utils.DateUtils;

public class BlogController extends BaseController {
	
	
	public void index(){
		// 查询数据
		Page<Record> data = Blog.paginate(getPageNum(), getPageSize());
		doRender(data);
	}
	
	
	public void showByCategory(){
		Integer pageNum = getPageNum();
		Integer pageSize = getPageSize();
		String categoryID = getPara("id");
		// 查询数据
		Page<Record> data = null;
		if(categoryID == null || categoryID.trim().length() == 0){
			data = Blog.paginate(pageNum, pageSize);
		} else {
			data = Blog.paginateByCategory(pageNum, pageSize,categoryID);
		}
		doRender(data);
	}
	
	
	public void showByTag(){
		Integer pageNum = getPageNum();
		Integer pageSize = getPageSize();
		String tagID = getPara("id");
		// 查询数据
		Page<Record> data = null;
		if(tagID == null || tagID.trim().length() == 0){
			data = Blog.paginate(pageNum, pageSize);
		} else {
			data = Blog.paginateByTag(pageNum, pageSize,tagID);
		}
		doRender(data);
	}
	
	public void showByQuery(){
		Integer pageNum = getPageNum();
		Integer pageSize = getPageSize();
		String keyword = getPara("keyword");
		// 查询数据
		Page<Record> data = null;
		if(keyword == null || keyword.trim().length() == 0){
			data = Blog.paginate(pageNum, pageSize);
		} else {
			data = Blog.paginateByQuery(pageNum, pageSize,keyword);
		}
		doRender(data);
	}
	
	
	private void doRender(Page<Record> data){
		if(data.getList().size() > 0){
			for(Record record : data.getList()){
				LocalDateTime date = record.get("publishTime");
				if(date != null){
//					String d = DateUtils.DateToString(date, DateStyle.YYYY_MM_DD);
					String d = "1111";

					record.set("publishTime", d);
				}
			}
		}
		// 渲染结果
		render(ResConsts.Code.SUCCESS, null, data);
	}
	
	
	
	
	/**
	 * 显示标签
	 */
	public void category(){
		List<Category> data = Category.show();
		render(ResConsts.Code.SUCCESS, null, data);
	}
	
	public void lunbo() {
		List<Blog> data = Blog.lunbo();
		render(ResConsts.Code.SUCCESS, null, data);
	}
	
	/**
	 * 热门排行
	 */
	public void hotRank(){
		List<Blog> data = Blog.hotRank(5);
		render(ResConsts.Code.SUCCESS, null, data);
	}
	
	/**
	 * 猜你喜欢
	 * 推荐
	 */
	public void recommend(){
		List<Blog> data = Blog.hotRank(15);
		render(ResConsts.Code.SUCCESS, null, data);
	}
	
	
	public void timeline(){
		List<Timeline> data = DBUtils.findAll(Timeline.dao);
		render(ResConsts.Code.SUCCESS, null, data);
	}
	

	public void blogTags() {
		List<Tags> data = Tags.findAll();
		render(ResConsts.Code.SUCCESS, null, data);
	}
	
	
	/**
	 * 增加阅读数, 同时返回博文现有阅读数
	 * 
	 */
	public void openRead(){
		String id = getPara("id");
		if(id == null){
			return;
		}
		Blog blog = Blog.openRead(id);
		int readNum = 0;
		if(blog != null){
			readNum = blog.getReadNum() + 1;
			blog.setReadNum(readNum);
			blog.update();
		}
		render(ResConsts.Code.SUCCESS, null, blog);
	}
	
	
	public void like(){
		String id = getPara("id");
		if(id == null){
			return;
		}
		Blog blog = Blog.findById(id, "id,heartNum");
		int heartNum = 0;
		if(blog != null){
			heartNum = blog.getHeartNum() + 1;
			blog.setHeartNum(heartNum);
			blog.update();
		}
		render(ResConsts.Code.SUCCESS, null, heartNum);
	}
	
	
	

}

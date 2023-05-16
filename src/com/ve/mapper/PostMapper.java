package com.ve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.ve.po.PostModel;

public interface PostMapper {
	@Select("select * from tb_posts where board_id = #{bid} order by pid desc limit #{startPos},#{pageSize}")
	/* post和user的组合查询 */
	@Results({ @Result(column = "user_id", property = "user", one = @One(select = "com.ve.mapper.AccountMapper.selectbyuid")) })
	public List<PostModel> postlist(@Param("bid") int bid,
			@Param("startPos") int startPos, @Param("pageSize") int pageSize);

	@Insert("insert into tb_posts (user_id,board_id,posttitle,posttype) values(#{user_id},#{board_id},#{posttitle},#{posttype})")
	public int newpost(PostModel pmodel);

	@Select("select @@identity")
	// 查询最新生成记录的id
	public int returnid();

	@Select("SELECT COUNT(*) FROM tb_posts where board_id = #{bid}")
	public int getpostCount(int bid);/* 某板块帖子总数 */

	@Select("select * from tb_posts where posttitle like #{search}")
	@Results({ @Result(column = "user_id", property = "user", one = @One(select = "com.ve.mapper.AccountMapper.selectbyuid")) })
	public List<PostModel> searchpost(String search);/* 帖子标题的模糊查询 */
}

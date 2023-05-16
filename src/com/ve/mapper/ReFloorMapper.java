package com.ve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.ve.po.ReFloorModel;

public interface ReFloorMapper {
	@Select("select * from tb_refloors where floor_id in(select fid from tb_floors where post_id =#{pid})")
	@Results({
			@Result(column = "user_id", property = "user", one = @One(select = "com.ve.mapper.AccountMapper.selectbyuid")),
			@Result(column = "reuser_id", property = "reuser", one = @One(select = "com.ve.mapper.AccountMapper.selectbyuid")) })
	public List<ReFloorModel> refloorlist(int pid); /* 组合查询，定位帖子里所有的回复 */

	@Insert("insert into tb_refloors (user_id,reuser_id,floor_id,refloorcontent) values (#{user_id},#{reuser_id},#{floor_id},#{refloorcontent})")
	public int reply(ReFloorModel rfmodel);
}

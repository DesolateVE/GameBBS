package com.ve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.ve.po.FloorModel;

public interface FloorMapper {
	@Select("select * from tb_floors where post_id = #{pid}")
	@Results({ @Result(column = "user_id", property = "user", one = @One(select = "com.ve.mapper.AccountMapper.selectbyuid")) })
	public List<FloorModel> floorlist(int pid); /* 列出楼层 */

	@Insert("insert into tb_floors (user_id,post_id,floornum,floorcontent) values (#{user_id},#{post_id},#{floornum},#{floorcontent})")
	public int postreply(FloorModel fmodel); /* 楼层回复写入数据库 */
}

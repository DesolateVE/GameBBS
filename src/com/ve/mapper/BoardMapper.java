package com.ve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.ve.po.BoardModel;

public interface BoardMapper {
	@Select("select * from tb_boards")
	@Results({ @Result(column = "user_id", property = "user", one = @One(select = "com.ve.mapper.AccountMapper.selectbyuid")) })
	public List<BoardModel> boardlist(); /* 读入板块列表 */

}

package com.ve.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

import com.ve.po.UserModel;

public interface AccountMapper {
	@Select("select * from tb_users where email=#{email} and password=#{password}")
	public UserModel login(UserModel user); /* 登陆验证 */

	@Select("select * from tb_users where email=#{email}")
	public UserModel checkemail(String email); /* 邮箱查重 */

	@Select("select * from tb_users where uid = #{uid}")
	public UserModel selectbyuid(int uid); /* uid选定 */

	@Select("select * from tb_users where username like #{search} or email like #{search} order by experience")
	public List<UserModel> selectbychaxun(@Param("search") String search); /* 模糊查询 */

	@Select("select * from tb_users")
	public List<UserModel> showusers(); /* 显示所有用户 */

	@Insert("insert into tb_users (username,password,email) values (#{username},#{password},#{email})")
	public int insertuser(UserModel user); /* 新注册用户 */

	@Update("update tb_users set username=#{username},sex=#{sex},email=#{email},underwrite=#{underwrite},birthdate=#{birthdate},headphoto=#{headphoto} where uid=#{uid}")
	public int updateuser(UserModel user); /* 修改资料 */

	@Update("update tb_users set password=#{newpassword} where uid = #{uid}")
	public int updatepassword(String newpassword, int uid); /* 修改密码 */

	@Select("select * from tb_users where password=#{oldpassword} and uid=#{uid}")
	public String checkpassword(String oldpassword, int uid); /* 验证密码 */

	@Update("update tb_users set experience=experience+50 where uid = #{uid}")
	public int upgrade(int uid); /* 经验值提升 */
}

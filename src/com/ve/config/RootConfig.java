package com.ve.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.Configuration;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.ve.service.ServiceHook;

/**
 *  相当于spring,需要扫描service层,mapper层,可以配置相应的东西（数据源，会话工厂，事务管理等等）
 *  
 * **/
@org.springframework.context.annotation.Configuration
//相当于spring 扫描service层
@ComponentScan(basePackageClasses={ServiceHook.class})
//启动事务管理
@EnableTransactionManagement
public class RootConfig {
	
	
	//配置数据源
	@Bean
	public DataSource buildDataSource() {
		
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/db_bbs");
		ds.setUsername("root");
		ds.setPassword("123");
		return ds;
	}
	
	//配置log4日志
	@Bean
	public Configuration buildMyBatisConfig() {
		LogFactory.useLog4J2Logging();
		Configuration configuration = new Configuration();
		
		return configuration;
	}
	//配置会话工厂
	@Bean(name="sqlSessionFactory")
	public SqlSessionFactoryBean buildSessionFactory(
			DataSource datasource, Configuration config) {
		
		SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
		factory.setDataSource(datasource);
		factory.setConfiguration(config);
		
		return factory;
	}
	
	//利用会话工厂扫描mapper包（扫描mapper层）
	@Bean
	public MapperScannerConfigurer buildMybatisMapperSacnConfig() {
		MapperScannerConfigurer msc = new MapperScannerConfigurer();
		msc.setSqlSessionFactoryBeanName("sqlSessionFactory");
		msc.setBasePackage("com.ve.mapper");
		return msc;
	}
	
	//开启事务
	@Bean
	public DataSourceTransactionManager transactionManager( 
	        BasicDataSource datasource) {
	    return  new DataSourceTransactionManager(datasource);
	}
}

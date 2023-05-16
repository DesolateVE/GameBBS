package com.ve.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.ve.controller.ControllerHook;

/**
 * webconfig 类似于 springmvc 需要启动webmvc , 扫描想应的包（controller） *
 **/

@Configuration
// 启动Mvc
@EnableWebMvc
// 扫描handler层
@ComponentScan(basePackageClasses = { ControllerHook.class })
public class WebConfig extends WebMvcConfigurerAdapter {

	// 用视图解析器，配置前后缀
	@Bean
	public ViewResolver resolver() {

		InternalResourceViewResolver vr = new InternalResourceViewResolver();
		vr.setPrefix("/WEB-INF/views/");
		vr.setSuffix(".jsp");
        
		return vr;

	}

	// 前端网页静态资源加载
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		super.addResourceHandlers(registry);
		registry.addResourceHandler("/framework/**").addResourceLocations(
				"/framework/");
		registry.addResourceHandler("/resources/**").addResourceLocations(
				"/resources/");
	}

}

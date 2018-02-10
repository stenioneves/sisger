package org.sisger.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/***
 * Classe de configuração  do Spring equivale ao web.xml, contem as configurações do sistema.
 * @author stenio
 *
 */
@EnableWebMvc
@ComponentScan(basePackages="org.sisger.controllers")
public class AppWebConfiguration extends  WebMvcConfigurerAdapter { 
	
/***
 * método de configuração de localização das views e a extensão do arquivo
 * @return resolver
 */
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver(){
	
		InternalResourceViewResolver resolver =
				new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	 
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }
}

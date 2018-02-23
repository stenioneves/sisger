package org.sisger.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.format.datetime.DateFormatterRegistrar;
import org.springframework.format.support.DefaultFormattingConversionService;
import org.springframework.format.support.FormattingConversionService;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/***
 * Classe de configuração do Spring equivale ao web.xml, contem as configurações
 * do sistema.
 * 
 * @author stenio
 *
 */
@EnableWebMvc
@ComponentScan(basePackages = "org.sisger.controllers,org.sisger.daos") // Atenção com os pacotes
public class AppWebConfiguration extends WebMvcConfigurerAdapter {

	/***
	 * método de configuração de localização das views e a extensão do arquivo
	 * 
	 * @return resolver
	 */
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {

		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean // formatação da data.
	public FormattingConversionService mvConversionService() {

		DefaultFormattingConversionService conversionService = new DefaultFormattingConversionService(true);
		DateFormatterRegistrar registrar = new DateFormatterRegistrar();
		registrar.setFormatter(new DateFormatter("yyyy/MM/dd"));
		registrar.registerFormatters(conversionService);
		return conversionService;
	}
}

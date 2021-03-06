package com.example.demo.config;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.example.demo.service.member.AuthOauth2FailureHandlerImpl;
import com.example.demo.service.member.AuthOauth2SuccessHandlerImpl;
import com.example.demo.service.member.AuthSuccessHandlerImpl;
import com.example.demo.service.member.UserDetailsServiceImpl;
import com.example.demo.service.member.UserOAuth2ServiceImpl;

import lombok.AllArgsConstructor;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private UserDetailsServiceImpl memberServiceimpl;
    private UserOAuth2ServiceImpl userOAuth2ServiceImpl;
    private AuthOauth2SuccessHandlerImpl authOauth2SuccessHandlerImpl;
    private AuthSuccessHandlerImpl authSuccessHandlerImpl;
    private AuthOauth2FailureHandlerImpl authOauth2FailureHandlerImpl;
    //private AuthFailureHandlerImpl authFailureHandlerImpl;

	@Autowired
	@Qualifier("dataSource")
	private DataSource dataSource;
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) throws Exception
    {
        // static ??????????????? ?????? ?????? ????????? ?????? ?????? ( = ???????????? )
        web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

    	http.csrf().disable(); // csrf ???????????? //only for test //

		http.authorizeRequests() // ????????? ?????? ??????
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/api/admin/**").hasRole("ADMIN")
                .antMatchers("/**").permitAll()
                .anyRequest().authenticated() //?
            .and() // 403 ???????????? ?????????
                .exceptionHandling()
                .accessDeniedPage("/member/denied")
            .and()
            	.rememberMe()
	  		    .key("kh-final-cookie-key-9386") //????????? ???????????? ?????? ??????????????? ?????? ???(key)???
			    .tokenRepository(persistentTokenRepository()) //DataSource ??????
			    .tokenValiditySeconds(604800) //?????? ?????? ??????(?????????) - ?????????
            .and() // ????????? ??????
            	.formLogin()
            	.usernameParameter("email")
            	.passwordParameter("pwd")
                .loginPage("/member/signin")
                .successHandler(authSuccessHandlerImpl)
//                .failureHandler(authFailureHandlerImpl)
                .permitAll()
            .and() // ???????????? ??????
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/member/signout"))
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
                .deleteCookies("remember-me", "JSESSIONID")//?????? ????????? ??????, Tomcat??? ????????? ?????? ?????? ?????? ??????
            .and()
              .oauth2Login()
              .successHandler(authOauth2SuccessHandlerImpl)
              .failureHandler(authOauth2FailureHandlerImpl)
//              .defaultSuccessUrl("/member")
              .userInfoEndpoint()
              .userService(userOAuth2ServiceImpl)
        ;
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(memberServiceimpl).passwordEncoder(passwordEncoder());
    }
}

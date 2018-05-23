package com.noisyle.demo.mybatis.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.autoconfigure.security.servlet.EndpointRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.noisyle.demo.mybatis.security.SecurityUserDetailsService;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .headers().frameOptions().disable()
            .and()
            .authorizeRequests()
                .antMatchers("/webjars/**", "/static/**", "/", "/h2-console/**", "/login", "/logout", "/favicon.ico", "/api/**").permitAll()
                .requestMatchers(EndpointRequest.toAnyEndpoint()).hasRole("ADMIN")
                .antMatchers("/admin", "/admin/**").hasRole("ADMIN")
                .antMatchers("/**").hasRole("USER")
            .and()
            .formLogin()
                .loginPage("/login").failureUrl("/login?error")
            .and()
            .logout()
                .logoutSuccessUrl("/");
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth, UserDetailsService userDetailsService) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(11));
    }
    
    @Bean
    public UserDetailsService userDetailsService(){
        return new SecurityUserDetailsService();
    }
    
}

package com.example.demo.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Configuration
@Getter
@Setter
@ToString
public class FileConfig {
	@Value("${user.file.upload.dir}")
    private String uploadDir;
}
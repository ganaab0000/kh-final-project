package com.example.demo.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.reactive.AutoConfigureWebTestClient;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.reactive.server.WebTestClient;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;


@SpringBootTest
@AutoConfigureMockMvc
class TestRestControllerTest {
	@Autowired
	private MockMvc mvc;

    @Test
    void exampleTest() throws Exception {

        mvc.perform(get("/"))
        .andDo(print())
        .andExpect(MockMvcResultMatchers.model().size(0))
        .andExpect(status().isOk()).andExpect(content().string(""));
    }
//	@Test
//	void testGetTestItem(@Autowired MockMvc mvc) throws Exception {
////        mvc.perform(get("/")).andExpect(status().isOk())
////        //.andExpect(content().string("Hello World"));
////        ;
//
//        mvc.perform(get("/")).andExpect(status().isOk()).andExpect(content().string("Hello World"));
//
//
//
////        mvc.perform(get("http://localhost:9090/api/string"))
////                .andExpect(status().isOk())
//////                .andExpect(content().json(
//////                    "[{\"address\":\"Seoul\",\"name\":\"Bob zip\",\"id\":1004,\"information\":\"Bob zip in Seoul\"}]")
//////                )
////                ;
//	}

}

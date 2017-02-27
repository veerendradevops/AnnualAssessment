package com.lisi.annaulAssessment.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.lisi.annualassessment.controller.ExemptEmployeeController;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class LoginControllerTest {

	@Autowired
	private WebApplicationContext wac;



	private static MockMvc mockMvc;

	@Before
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	}

	@Test
	public void loginContrllerTest() throws Exception {

		System.out.println("test call");

		
		mockMvc.perform(get("/hrEmployeeExempt").param("clockNum", "5159").param("year", "2016").param("status", ""))
				.andExpect(view().name("exemptEmployee"));

	}

}

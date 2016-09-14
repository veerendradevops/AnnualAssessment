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

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class LoginControllerTest {

	@Autowired
	private WebApplicationContext wac;

	@Autowired
	private ExemptEmployeeController exemptEmployee;

	private static MockMvc mockMvc;

	@Before
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	}

	@Test
	public void loginContrllerTest() throws Exception {

		System.out.println("test call");

		// when(lc.authenticateLDAPUser("pavan",
		// "P@van@lisi","","").thenReturn("true");

		/*
		 * mockMvc.perform(post("/teamMemberPersonalInfo").param("username",
		 * "pavan").param("password", "P@van@lisi"))
		 * .andExpect(view().name("exemptEmployee"));
		 */
		mockMvc.perform(post("/teamMemberPersonalInfo").param("clockNum", "22327"))
				.andExpect(view().name("exemptEmployee"));

	}

}

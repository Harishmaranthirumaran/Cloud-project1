package com.example.cloudservice;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;

@WebMvcTest({HealthController.class, GreetingController.class})
class HealthControllerTest {

  @Autowired
  private MockMvc mockMvc;

  @Test
  void returnsOkHealth() throws Exception {
    mockMvc.perform(get("/healthz"))
        .andExpect(status().isOk())
        .andExpect(content().json("{\"status\":\"ok\"}"));
  }

  @Test
  void returnsGreeting() throws Exception {
    mockMvc.perform(get("/greet/harish"))
        .andExpect(status().isOk())
        .andExpect(content().json("{\"message\":\"hello harish\"}"));
  }
}

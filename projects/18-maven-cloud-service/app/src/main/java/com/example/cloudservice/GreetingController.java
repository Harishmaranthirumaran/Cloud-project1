package com.example.cloudservice;

import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {

  @GetMapping("/greet/{name}")
  public Map<String, String> greet(@PathVariable String name) {
    return Map.of("message", "hello " + name);
  }
}

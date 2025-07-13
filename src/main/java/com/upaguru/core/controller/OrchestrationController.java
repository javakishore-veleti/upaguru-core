package com.upaguru.core.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/orchestrate")
@Tag(name = "Agent Orchestration", description = "Routes AI agent requests")
public class OrchestrationController {

    @Operation(summary = "Route to appropriate AI agent")
    @GetMapping
    public String triggerAgent() {
        return "Agent trigger logic placeholder!";
    }
}

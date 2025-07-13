package com.upaguru.core.controller;

import com.upaguru.core.dto.OrchestrationRequest;
import com.upaguru.core.dto.OrchestrationResponse;
import com.upaguru.core.service.AgentRouterServiceImpl;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/route")
@RequiredArgsConstructor
@Tag(name = "Agent Orchestration", description = "Routes AI agent requests")
public class AgentRouterController {

    private final AgentRouterServiceImpl agentRouterServiceImpl;

    @Operation(summary = "Route to appropriate AI agent")
    @PostMapping
    public OrchestrationResponse routeAgent(@RequestBody OrchestrationRequest request) {
        return agentRouterServiceImpl.route(request);
    }
}

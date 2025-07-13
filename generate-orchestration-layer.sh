#!/bin/bash

BASE_DIR="."
PACKAGE="com.upaguru.core"
PACKAGE_DIR="com/upaguru/core"

echo "Generating AgentRouterService and related classes..."

# === DTOs ===
cat > $BASE_DIR/src/main/java/$PACKAGE_DIR/dto/OrchestrationRequest.java <<EOF
package $PACKAGE.dto;

import lombok.Data;

@Data
public class OrchestrationRequest {
    private String userId;
    private String agentType;     // e.g. "mind", "sense", "copilot"
    private String input;
}
EOF

cat > $BASE_DIR/src/main/java/$PACKAGE_DIR/dto/OrchestrationResponse.java <<EOF
package $PACKAGE.dto;

import lombok.Data;

@Data
public class OrchestrationResponse {
    private String response;
}
EOF

# === WebClient Config ===
cat > $BASE_DIR/src/main/java/$PACKAGE_DIR/config/WebClientConfig.java <<EOF
package $PACKAGE.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;

@Configuration
public class WebClientConfig {
    @Bean
    public WebClient webClient() {
        return WebClient.builder().build();
    }
}
EOF

# === Service ===
cat > $BASE_DIR/src/main/java/$PACKAGE_DIR/service/AgentRouterService.java <<EOF
package $PACKAGE.service;

import $PACKAGE.dto.OrchestrationRequest;
import $PACKAGE.dto.OrchestrationResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

@Service
@RequiredArgsConstructor
public class AgentRouterService {

    private final WebClient webClient;

    public OrchestrationResponse route(OrchestrationRequest request) {
        String endpoint = resolveUrl(request.getAgentType());

        return webClient.post()
                .uri(endpoint)
                .bodyValue(request)
                .retrieve()
                .bodyToMono(OrchestrationResponse.class)
                .block();
    }

    private String resolveUrl(String agentType) {
        return switch (agentType) {
            case "mind" -> "http://localhost:8082/api/mind";
            case "sense" -> "http://localhost:8083/api/sense";
            case "copilot" -> "http://localhost:8084/api/copilot";
            default -> throw new IllegalArgumentException("Unknown agentType: " + agentType);
        };
    }
}
EOF

# === Controller ===
cat > $BASE_DIR/src/main/java/$PACKAGE_DIR/controller/AgentRouterController.java <<EOF
package $PACKAGE.controller;

import $PACKAGE.dto.OrchestrationRequest;
import $PACKAGE.dto.OrchestrationResponse;
import $PACKAGE.service.AgentRouterService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/route")
@RequiredArgsConstructor
public class AgentRouterController {

    private final AgentRouterService agentRouterService;

    @PostMapping
    public OrchestrationResponse routeAgent(@RequestBody OrchestrationRequest request) {
        return agentRouterService.route(request);
    }
}
EOF

echo "✅ All orchestration layer code generated successfully!"

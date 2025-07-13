package com.upaguru.core.service;

import com.upaguru.core.dto.OrchestrationRequest;
import com.upaguru.core.dto.OrchestrationResponse;
import com.upaguru.core.handler.UpaGuruCopilotClient;
import com.upaguru.core.handler.UpaGuruMindClient;
import com.upaguru.core.handler.UpaGuruSenseClient;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

@Service
@RequiredArgsConstructor
public class AgentRouterServiceImpl {

    private final WebClient webClient;

    private final UpaGuruMindClient mindClient;
    private final UpaGuruSenseClient senseClient;
    private final UpaGuruCopilotClient copilotClient;

    public OrchestrationResponse route(OrchestrationRequest request) {
        return switch (request.getAgentType()) {
            case "mind" -> mindClient.callMind(request);
            case "sense" -> senseClient.callSense(request);
            case "copilot" -> copilotClient.callCopilot(request);
            default -> throw new IllegalArgumentException("Unknown agentType: " + request.getAgentType());
        };
    }


}

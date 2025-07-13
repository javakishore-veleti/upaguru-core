package com.upaguru.core.handler;

import com.upaguru.core.dto.OrchestrationRequest;
import com.upaguru.core.dto.OrchestrationResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "copilotClient", url = "${feign.client.config.copilotClient.url}")
public interface UpaGuruCopilotClient {

    @PostMapping("/api/copilot")
    OrchestrationResponse callCopilot(@RequestBody OrchestrationRequest request);
}

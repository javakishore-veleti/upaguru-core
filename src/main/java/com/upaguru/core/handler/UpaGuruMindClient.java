package com.upaguru.core.handler;

import com.upaguru.core.dto.OrchestrationRequest;
import com.upaguru.core.dto.OrchestrationResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "mindClient", url = "${feign.client.config.mindClient.url}")
public interface UpaGuruMindClient {

    @PostMapping("/api/embeddings")
    OrchestrationResponse callMind(@RequestBody OrchestrationRequest request);
}

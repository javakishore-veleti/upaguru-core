package com.upaguru.core.handler;

import com.upaguru.core.dto.OrchestrationRequest;
import com.upaguru.core.dto.OrchestrationResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "senseClient", url = "${feign.client.config.senseClient.url}")
public interface UpaGuruSenseClient {

    @PostMapping("/api/sense")
    OrchestrationResponse callSense(@RequestBody OrchestrationRequest request);
}

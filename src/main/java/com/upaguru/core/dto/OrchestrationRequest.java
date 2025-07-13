package com.upaguru.core.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class OrchestrationRequest {
    private String userId;
    private String agentType;     // e.g. "mind", "sense", "copilot"
    private String input;
}

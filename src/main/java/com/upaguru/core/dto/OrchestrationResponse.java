package com.upaguru.core.dto;

import lombok.Data;

@Data
public class OrchestrationResponse {
    private String response;

    private String output;
    private int tokensUsed;
    private long responseTime;

    private String id;
    private float[] embeddingPreview;
    private String content;
}

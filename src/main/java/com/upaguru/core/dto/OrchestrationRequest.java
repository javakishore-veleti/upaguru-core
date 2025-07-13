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
    private String source;
    private String sourceId;
    private String text;
    private String embeddingType;

    private String persona;           // Role or user type e.g. "principal", "new teacher"
    private String taskType;          // Task like "lesson-plan", "summarize", etc.
    private String prompt;            // Raw input text

    private String topic;             // Topic like "Photosynthesis"
    private String gradeLevel;        // e.g. "7"
    private String format;            // e.g. "bullets", "paragraph"
    private String tone;              // e.g. "friendly", "formal"
    private String additionalContext; // Optional extra info

    private String inputType;

    private String intent;
    private String promptTemplate;
    private String userType;

}

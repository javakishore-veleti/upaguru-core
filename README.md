# upaguru-core
Agent orchestration logic, Central orchestrator (Spring Boot backend), REST APIs to trigger copilots and workflows

### upaguru-core

| #  | Use Case |
|----|----------|
| 1  | Route incoming user requests to the appropriate copilot based on NLP intent. |
| 2  | Agent trigger logic based on event (e.g., lesson plan upload). |
| 3  | Validate payloads from client before routing to copilots. |
| 4  | Enrich payloads with metadata (school, user role). |
| 5  | Audit trail for all inter-service requests. |
| 6  | Centralized error handling and fallback mechanism. |
| 7  | Load balancing across copilots. |
| 8  | Token-based authentication and authorization. |
| 9  | Role-based API access filtering. |
| 10 | API version management. |
| 11 | Integrate OpenTelemetry for API performance. |
| 12 | Retry queue for failed asynchronous calls. |
| 13 | Webhook event broadcasting to copilots. |
| 14 | Admin dashboard endpoint for orchestration metrics. |
| 15 | Multi-tenancy header injection. |
| 16 | Request/Response correlation ID injection. |
| 17 | Time-window circuit breaker for downstream services. |
| 18 | Agent fallback prioritization (which copilot takes over). |
| 19 | Dynamic agent chaining (e.g., lesson + quiz). |
| 20 | Real-time status monitoring of copilots and services. |

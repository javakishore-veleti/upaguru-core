#!/bin/bash

set -e

# Base directory
BASE_DIR="upaguru-core"
SRC_DIR="$BASE_DIR/src/main/java/com/upaguru/core"
RESOURCES_DIR="$BASE_DIR/src/main/resources"

echo "Creating project structure..."
mkdir -p "$SRC_DIR/controller"
mkdir -p "$RESOURCES_DIR"

echo "Creating pom.xml..."
cat > "$BASE_DIR/pom.xml" << 'EOF'
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                             https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.upaguru</groupId>
    <artifactId>upaguru-core</artifactId>
    <version>1.0.0</version>
    <packaging>jar</packaging>
    <name>upaguru-core</name>
    <description>Orchestration layer: APIs, service routing, agent trigger logic</description>

    <properties>
        <java.version>21</java.version>
        <spring.boot.version>3.2.5</spring.boot.version>
        <springdoc.version>2.5.0</springdoc.version>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-webflux</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springdoc</groupId>
            <artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
            <version>${springdoc.version}</version>
        </dependency>
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-databind</artifactId>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.11.0</version>
                <configuration>
                    <source>${java.version}</source>
                    <target>${java.version}</target>
                    <release>${java.version}</release>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
EOF

echo "Creating application class..."
cat > "$SRC_DIR/UpaguruCoreApplication.java" << 'EOF'
package com.upaguru.core;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class UpaguruCoreApplication {
    public static void main(String[] args) {
        SpringApplication.run(UpaguruCoreApplication.class, args);
    }
}
EOF

echo "Creating sample controller..."
cat > "$SRC_DIR/controller/OrchestrationController.java" << 'EOF'
package com.upaguru.core.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/orchestrate")
public class OrchestrationController {

    @GetMapping
    public String triggerAgent() {
        return "Agent trigger logic placeholder!";
    }
}
EOF

echo "Creating application.yml..."
cat > "$RESOURCES_DIR/application.yml" << 'EOF'
server:
  port: 8080

spring:
  application:
    name: upaguru-core

logging:
  level:
    root: INFO
EOF

echo "✅ upaguru-core module created successfully."

# Data Flow Diagram (DFD)

## 1. Introduction

A Data Flow Diagram illustrates how data enters, moves through and leaves the ScamSense KE system. It identifies the processes involved, external entities interacting with the system and data stores used to maintain information.

## 2. Level 0 DFD (Context Diagram)

The context diagram represents ScamSense KE as a single process and shows its interaction with external entities.

```mermaid
flowchart LR
    User[General User]
    Admin[Administrator]
    System((ScamSense KE))
    Threat[External Threat Intelligence Service]

    User -->|Suspicious messages, URLs and advertisements| System
    System -->|Risk assessments, explanations and recommendations| User

    Admin -->|Management requests and updates| System
    System -->|Reports and system information| Admin

    System -->|Domain reputation requests| Threat
    Threat -->|Domain reputation information| System
```

## 3. Level 1 DFD

The Level 1 diagram breaks down the main system process into smaller processes.

```mermaid
flowchart TD
    User[General User]

    P1([1.0 Receive Submission])
    P2([2.0 Validate Input])
    P3([3.0 Analyse Suspicious Content])
    P4([4.0 Generate Risk Assessment])
    P5([5.0 Store Analysis Result])
    P6([6.0 Present Results])

    D1[(User Submissions)]
    D2[(Scam Pattern Database)]
    D3[(Analysis Results)]

    User -->|Message, URL or advertisement| P1
    P1 --> P2
    P2 -->|Valid submission| P3
    P2 -->|Invalid submission| User

    P3 <-->|Known scam patterns| D2
    P3 -->|Analysis indicators| P4
    P4 --> P5
    P5 --> D3
    P1 --> D1
    D1 --> P3
    D3 --> P6
    P6 -->|Risk level, explanation and recommendations| User
```

## 4. Description of Data Flow Processes

### 4.1 Receive Submission

The system receives suspicious messages, URLs or advertisements submitted by users through the web interface.

### 4.2 Validate Input

The system checks the submitted information to ensure it meets the required format and security rules. Invalid or incomplete submissions are rejected with appropriate feedback.

### 4.3 Analyse Suspicious Content

The analysis engine examines the submitted content using scam detection rules, text pattern analysis, URL analysis and other supported techniques.

### 4.4 Generate Risk Assessment

The system evaluates the indicators identified during analysis and generates an appropriate risk classification, accompanied by an explanation.

### 4.5 Store Analysis Result

The system stores relevant submission details and analysis results in the database, subject to data protection and retention requirements.

### 4.6 Present Results

The system displays the risk assessment, identified indicators and safety recommendations to the user.

## 5. Data Stores

- **User Submissions:** Stores relevant information submitted for analysis.
- **Scam Pattern Database:** Contains known scam indicators and detection patterns.
- **Analysis Results:** Stores generated assessments and explanations.

## 6. Summary

The DFD demonstrates how ScamSense KE receives, validates, processes, stores and presents information. It provides a clearer understanding of the movement of data within the proposed system.
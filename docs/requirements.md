# ScamSense KE
## Software Requirements Specification

### 1. Introduction

This document describes the functional and non-functional requirements of ScamSense KE, an AI-assisted digital scam detection and analysis platform.

It defines the expected system behaviour, quality attributes, users and operational constraints that will guide the development process.

### 2. System Users

The proposed system will have the following users:

**2.1 General Users**

Individuals who access the platform to analyse suspicious messages, URLs and advertisements.

Their responsibilities include:
- Submitting suspicious content.
- Viewing analysis results.
- Understanding identified scam indicators.
- Following recommended safety precautions.

**2.2 Administrator**

The administrator will be responsible for managing and maintaining the platform.

Responsibilities include:
- Managing reported suspicious content.
- Monitoring system performance.
- Managing scam pattern records.
- Reviewing detection accuracy.
- Maintaining system security.

### 3. Functional Requirements

Functional requirements describe the specific operations the system must perform.

| ID | Requirement | Description |
|---|---|---|
| FR01 | Message Submission | The system shall allow users to submit suspicious text messages for analysis. |
| FR02 | URL Submission | The system shall allow users to submit suspicious website links. |
| FR03 | Advertisement Analysis | The system shall analyse submitted advertisements for potential fraud indicators. |
| FR04 | Language Analysis | The system shall identify suspicious language patterns, including urgency, threats and unrealistic promises. |
| FR05 | Financial Request Detection | The system shall identify suspicious requests involving payments, processing fees and financial transfers. |
| FR06 | Impersonation Detection | The system shall identify potential attempts to impersonate legitimate organisations or businesses. |
| FR07 | Scam Pattern Matching | The system shall compare submitted content against known scam patterns. |
| FR08 | Risk Assessment | The system shall generate a risk classification based on identified indicators. |
| FR09 | Risk Explanation | The system shall explain the factors contributing to the generated risk assessment. |
| FR10 | Safety Recommendations | The system shall provide recommendations on how users can respond safely. |
| FR11 | Content Reporting | The system shall allow users to report suspicious communications. |
| FR12 | Analysis History | The system shall support the storage and retrieval of analysis records where applicable and permitted. |

### 4. Non-Functional Requirements

Non-functional requirements describe the quality attributes and operational characteristics of the system.

**4.1 Security**
The system shall analyse submitted URLs using safe inspection techniques and shall not automatically navigate to potentially malicious destinations. External URL inspection, where necessary, shall use appropriate isolation and security controls to prevent server-side request forgery (SSRF).

The system shall:
- Validate all submitted data.
- Protect stored information against unauthorised access.
- Implement secure authentication for administrative functions.
- Prevent common web application vulnerabilities.

**4.2 Performance**

The system should:
- Under normal operating conditions, the system should return rule-based text analysis results within five seconds for supported submissions.
- Process multiple user requests efficiently.
- Avoid unnecessary processing operations.

**4.3 Usability**

The system shall:
- Provide a simple and intuitive interface.
- Present analysis results in understandable language.
- Support users without advanced cybersecurity knowledge.

**4.4 Reliability**
The system shall provide explanations for generated risk assessments by identifying the suspicious indicators that contributed to each result.
The system should:
- Produce consistent results for equivalent inputs under the same detection conditions.
- Handle invalid submissions gracefully.
- Provide appropriate error messages when analysis fails.

**4.5 Scalability**

The system should support future increases in:
- Registered users.
- Analysis requests.
- Scam pattern records.
- Detection capabilities.

**4.6 Privacy**

The system shall:
- Minimise the collection of personal information.
- Avoid unnecessary retention of submitted messages.
- Protect sensitive information.
- Handle user-submitted data responsibly.

**4.7 Maintainability**

The application shall use a modular architecture to make future updates, testing and debugging easier.

### 5. System Constraints

The proposed system will operate under the following constraints:

1. Detection accuracy will depend on the quality and diversity of available scam patterns and training data.
2. Some malicious URLs may not be identifiable through static URL analysis alone.
3. Access to external threat intelligence services may depend on API availability and usage limits.
4. Machine learning performance will depend on the availability of sufficiently representative datasets.
5. Internet connectivity will be required for access to the hosted platform.
6. The system must comply with applicable Kenyan data protection requirements.

### 6. Assumptions

The project assumes that:

1. Users can access the platform through an internet-enabled device.
2. Users will voluntarily submit suspicious communications for analysis.
3. Relevant scam indicators can be identified through rule-based techniques and machine learning.
4. External threat intelligence sources may be available for supplementary URL analysis.
5. Users will treat the generated risk assessments as guidance rather than definitive proof of fraud.

### 7. Use Cases

The following use cases describe the main interactions between users and the system.

**Use Case 1: Analyse a Suspicious Message**

Actor: General User.

Process:
1. The user opens the platform.
2. The user selects message analysis.
3. The user submits suspicious text.
4. The system validates the input.
5. The analysis engine examines the message.
6. The system identifies suspicious indicators.
7. The system generates a risk assessment.
8. The user receives an explanation and safety recommendations.

**Use Case 2: Analyse a Suspicious URL**

Actor: General User.

Process:
1. The user selects URL analysis.
2. The user submits a suspicious URL.
3. The system validates and parses the URL.
4. The URL analysis engine examines its characteristics.
5. Available threat intelligence information is checked where applicable.
6. The system generates an assessment.
7. The user receives the results.

**Use Case 3: Manage Scam Patterns**

Actor: Administrator.

Process:
1. The administrator accesses the administrative interface.
2. The administrator reviews scam pattern records.
3. The administrator adds, updates or removes relevant patterns.
4. The system validates and stores the changes.

### 8. Expected System Outputs

The system is expected to generate:

- Risk classifications.
- Identified suspicious indicators.
- Explanations of detected patterns.
- URL analysis results.
- Safety recommendations.
- Analysis reports.

### 9. Project Scope

The initial implementation will prioritise:

1. Text-based scam detection.
2. Suspicious URL analysis.
3. Rule-based scam pattern identification.
4. Risk scoring.
5. Understandable analysis reports.

Advanced machine learning and expanded threat intelligence integration will be introduced progressively.

### 10. Conclusion

This requirements specification establishes the functional expectations and quality standards that will guide the development of ScamSense KE.

It will serve as a reference during system design, implementation, testing and evaluation.
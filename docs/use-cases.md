# ScamSense KE
## Use Case Analysis

### 1. Introduction

This document describes the interactions between ScamSense KE and its external actors. It identifies the main system users, their responsibilities and the activities they can perform.

The purpose is to establish the functional interactions that will guide system design and implementation.

### 2. System Actors

**2.1 General User**

A general user interacts with the platform to analyse suspicious digital communications and receive security recommendations.

**2.2 Administrator**

The administrator manages the platform's detection records, reviews submitted reports and monitors system activities.

**2.3 External Threat Intelligence Service**

An external threat intelligence service may provide supplementary information about known malicious URLs and suspicious domains.

### 3. General User Use Cases

The general user can:

- Submit suspicious text messages.
- Submit suspicious URLs.
- Submit suspicious advertisements.
- Request automated analysis.
- View generated risk assessments.
- View explanations of suspicious indicators.
- Receive safety recommendations.
- Report suspicious content.

### 4. Administrator Use Cases

The administrator can:

- Authenticate into the administrative interface.
- Manage known scam patterns.
- Review suspicious content reports.
- Monitor system activity.
- Maintain detection records.

### 5. External Service Use Cases

The external threat intelligence service may:

- Provide domain reputation information.
- Identify known malicious domains.
- Supply supplementary URL threat indicators.

### 6. Main Use Case Descriptions

**Use Case 1: Analyse Suspicious Message**

Actor: General User.

Precondition: The user has accessed the platform.

Main flow:
1. The user selects message analysis.
2. The user enters suspicious message content.
3. The system validates the submitted content.
4. The analysis engine examines the message.
5. The system identifies suspicious indicators.
6. The system calculates a risk assessment.
7. The system displays the results and recommendations.

Postcondition: The user receives an analysis report.

**Use Case 2: Analyse Suspicious URL**

Actor: General User.

Precondition: The user has accessed the platform.

Main flow:
1. The user selects URL analysis.
2. The user submits a suspicious URL.
3. The system validates the URL format.
4. The system examines its structural characteristics.
5. Available threat intelligence information is consulted where applicable.
6. The system generates a risk assessment.
7. The results are displayed to the user.

Postcondition: The user receives a URL analysis report.

**Use Case 3: Manage Scam Patterns**

Actor: Administrator.

Precondition: The administrator has successfully authenticated.

Main flow:
1. The administrator accesses scam pattern management.
2. The administrator views existing patterns.
3. The administrator adds, updates or removes a pattern.
4. The system validates the changes.
5. The system stores the updated records.

Postcondition: The scam pattern records are updated.

**Use Case 4: Review Suspicious Content Reports**

Actor: Administrator.

Precondition: The administrator has successfully authenticated.

Main flow:
1. The administrator opens the reports section.
2. The system displays submitted reports.
3. The administrator selects a report.
4. The administrator reviews the available information.
5. The administrator records an appropriate review outcome.

Postcondition: The report has been reviewed.

### 7. Conclusion

The identified use cases establish the major interactions required by ScamSense KE.

They provide a foundation for developing the use case diagram, system architecture and subsequent implementation.
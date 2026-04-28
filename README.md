# Nonprofit Financial Risk Index (NFSRI)

A data-driven framework for identifying financially vulnerable nonprofits using IRS Form 990 data. This project demonstrates how publicly available financial data can be transformed into a **scalable early warning system for nonprofit financial health**, combining predictive modeling with interpretable risk signals to support decision-making across the sector.

---

## Overview

Nonprofit organizations play a critical role in delivering essential services across the United States, yet many operate with limited financial buffers and are vulnerable to economic shocks.

The **Nonprofit Financial Risk Index (NFSRI)** was developed to:

- Identify organizations at elevated financial risk  
- Surface early warning signals of financial distress  
- Provide interpretable insights into underlying financial drivers  

**The goal is to move beyond descriptive reporting and create a practical decision-support tool for funders, policymakers, and researchers.**

---

## Tableau Dashboard

[Tableau Public Dashboard Here](https://public.tableau.com/app/profile/precious.o.enahoro/viz/USNonprofitFinancialSustainabilityRiskIndexNFSRI/FinancialRiskConcentration)

The dashboard provides:

- Sector- and size-level risk patterns  
- Risk distribution and trends over time  
- Key financial drivers of risk  
- Organization-level exploration of risk profiles  

**Important Note:**  
*Risk scores represent early warning indicators, not definitive outcomes. They should be used alongside qualitative and contextual information when making decisions.*

---
## Dashboard Preview

![Cover](dashboard/cover_heatmap.png)

![Size Insight](dashboard/size_chart.png)

![Explorer](dashboard_output/Nonprofit - Explorer.png)

---
## Key Findings

-  Smaller nonprofits (<$100K revenue) exhibit significantly higher risk levels  
- Most nonprofits fall into moderate risk categories, with a smaller high-risk segment  
- **Common financial stress signals include:**
  - High expense ratios  
  - Low or negative operating margins  
  - Declining assets  
  - Declining revenue  

---

## Methodology

**Data:**  
[IRS Form 990 data (2007–2024)](https://990data.givingtuesday.org/datamarts/?co-item=basic-fields-679696bc141dbd17de689e0f)

### Step 1: Feature Engineering

Organization-level financial indicators were constructed, including:

- Operating margin  
- Expense ratio  
- Revenue and asset trends  
- Organizational scale (by revenue)  


### Step 2: Modeling

- Machine learning model to predict the likelihood of financial distress  
- Outputs transformed into a **standardized risk index (0–100)**  



### Step 3: Interpretation & Actionable Insights

To improve usability, the model is paired with an interpretable, organization-level layer that translates risk scores into actionable insights.

Each organization is enriched with:

- **Risk tiers** (Low → Very High)  
- **Driver flags** (e.g., high expense ratios, low margins, declining assets or revenue)  
- **Primary risk driver classification**  
- **Number of risk signals triggered**  

In addition, the project includes an **organization-level risk explorer**, enabling users to:

- Identify high-risk nonprofits  
- Understand *why* an organization is at risk  
- Filter by sector, size, and risk level  

Together, these components transform the model into an **early warning system**, supporting targeted investigation and more informed decision-making across the nonprofit sector.

---

## Potential Impact

Financial instability in the nonprofit sector can disrupt the delivery of essential services, particularly in areas such as housing, education, and health.

This project introduces a **scalable, data-driven framework** for identifying financially vulnerable organizations, with potential applications across:

- **Philanthropy and grantmaking**  
  → Enabling funders to proactively identify at-risk organizations and allocate support more effectively  

- **Public policy and oversight**  
  → Supporting agencies in monitoring sector-wide financial health and identifying systemic vulnerabilities  

- **Research and sector analysis**  
  → Providing a structured approach to studying financial resilience across nonprofit organizations  

By combining predictive modeling with interpretable financial signals, the NFSRI demonstrates how publicly available data can be leveraged to improve transparency and strengthen decision-making in the nonprofit ecosystem.

---

## Use Cases

This tool is intended to support:

- **Foundations & grantmakers**  
  → Identify financially vulnerable organizations and prioritize support  

- **Policymakers & agencies**  
  → Monitor systemic risk across the nonprofit sector  

- **Researchers & analysts**  
  → Study financial health and structural challenges in nonprofits  

---

## Future Improvements

1. Incorporate more recent financial data  
2. Expand sector classification coverage  
3. Enhance organization-level tooling and interactivity  

---

## Author Contribution

Designed and developed the full analytical pipeline, including:

- Data processing and feature engineering  
- Predictive modeling and validation  
- Risk scoring framework  
- Interpretation layer and driver flags  
- Tableau dashboard and organization-level explorer  

---

## Contact and Collaboration

- **Author**: Precious Enahoro  
- **GitHub**: @PreciousEnahoro
- **Linkedin**: (https://www.linkedin.com/in/precious-enahoro/)

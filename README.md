# Nonprofit Financial Risk Index (NFSRI)

A data-driven framework for identifying financially vulnerable nonprofits using IRS Form 990 data. This project combines predictive modeling with interpretable risk signals to support decision-making across the nonprofit sector.

## Overview

Nonprofit organizations play a critical role in delivering social services, yet many operate with limited financial buffers. This project develops a Nonprofit Financial Risk Index (NFSRI) to:

- Identify organizations at elevated financial risk
- Surface early warning signals of financial distress
- Provide interpretable insights into underlying risk drivers

**The goal is to move beyond descriptive reporting and create a decision-support tool for funders, policymakers, and researchers.**

## Tableau Dashboard
[Tableau Public Dashboard Here](https://public.tableau.com/app/profile/precious.o.enahoro/viz/USNonprofitFinancialSustainabilityRiskIndexNFSRI/FinancialRiskConcentration)

The dashboard provides:

- Sector and size-level risk patterns
- Risk distribution and trends over time
- Key financial drivers of risk
- Organization-level exploration

***Important Note: Risk scores represent early warning indicators, not definitive outcomes.** They should be used alongside qualitative and contextual information when making decisions.*


## Key Findings
- **Smaller nonprofits (<$100K revenue)** exhibit significantly higher risk levels
- Most nonprofits fall into moderate risk categories, with a smaller high-risk segment
- **Common financial stress signals** include:
    - High expense ratios
    - Low or negative operating margins
    - Declining assets
    - Declining revenue
 
      
## Methodology
#### [Data: IRS Form 990 data (2007–2024)](https://990data.givingtuesday.org/datamarts/?co-item=basic-fields-679696bc141dbd17de689e0f)

### Step 1
*Feature Engineering organization-level financial indicators*
Key variables include:

- Operating margin
- Expense ratio
- Revenue and asset trends
- Organizational scale (by revenue)


### Step 2: Modeling
- Machine learning model to predict the likelihood of financial distress
- Output transformed into a **standardized risk index (0–100)**
  
### Step 3: Interpretation & Actionable Insights

To improve usability, the model is paired with an interpretable, organization-level layer that translates risk scores into actionable insights.

Each organization is enriched with:

- **Risk tiers** (Low → Very High)
- **Driver flags** (e.g., high expense ratios, low margins, declining assets or revenue)
- **Primary risk driver** classification
- **Number of risk signals triggered**

In addition, the project includes an **organization-level risk explorer**, enabling users to:

- Identify high-risk nonprofits
- Understand why an organization is at risk
- Filter by sector, size, and risk level

Together, these components transform the model into **an early warning system**, supporting targeted investigation and more informed decision-making across the nonprofit sector.


## Use Cases

This tool is intended to:
- *Foundations & grantmakers* identify financially vulnerable organizations and prioritize support
- *Policymakers & agencies* monitor systemic risk across the nonprofit sector
- *Researchers & analysts* study financial health and structural challenges in nonprofits


## Future Improvements
1. Incorporate more recent financial data
2. Expand sector classification coverage
3. Enhance organization-level tooling and interactivity

## Contact and Collaboration
- **Author**: Precious Enahoro
- **GitHub**: @PreciousEnahoro
- **Linkedin**: (https://www.linkedin.com/in/precious-enahoro/)

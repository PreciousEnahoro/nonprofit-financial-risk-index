Nonprofit Financial Risk Index (NFSRI)

A data-driven framework for identifying financially vulnerable nonprofits using IRS Form 990 data. This project combines predictive modeling with interpretable risk signals to support decision-making across the nonprofit sector.

Overview

Nonprofit organizations play a critical role in delivering social services, yet many operate with limited financial buffers. This project develops a Nonprofit Financial Risk Index (NFSRI) to:

Identify organizations at elevated financial risk
Surface early warning signals of financial distress
Provide interpretable insights into underlying risk drivers

The goal is to move beyond descriptive reporting and create a decision-support tool for funders, policymakers, and researchers.

Key Findings
Organizational size is the strongest structural driver of financial risk
Smaller nonprofits (<$100K revenue) exhibit significantly higher risk levels
Risk is broadly distributed but concentrated in smaller organizations
Most nonprofits fall into moderate risk categories, with a smaller high-risk segment
Common financial stress signals include:
High expense ratios
Low or negative operating margins
Declining assets
Declining revenue
Methodology
Data
IRS Form 990 data (2007–2024)
Organization-level financial indicators
Feature Engineering

Key variables include:

Operating margin
Expense ratio
Revenue and asset trends
Organizational scale
Modeling
Machine learning model to predict likelihood of financial distress
Output transformed into a standardized risk index (0–100)
Interpretation Layer

To improve usability, the model is paired with:

Risk tiers (Low → Very High)
Driver flags (e.g., high expenses, declining assets)
Primary risk driver classification
Actionable Insights Layer

Beyond aggregate analysis, the project includes an organization-level risk explorer, enabling users to:

Identify high-risk nonprofits
Understand why an organization is at risk
Filter by sector, size, and risk level

Each organization is enriched with:

Risk score and category
Number of risk signals triggered
Primary financial driver of risk

This transforms the model into an early warning system, not just an analytical output.

Dashboard

Interactive Tableau dashboard:
👉 [Insert your Tableau Public link here]

The dashboard provides:

Sector and size-level risk patterns
Risk distribution and trends over time
Key financial drivers of risk
Organization-level exploration
Use Cases

This tool is intended to support:

Foundations & grantmakers
→ Identify financially vulnerable organizations and prioritize support
Policymakers & agencies
→ Monitor systemic risk across the nonprofit sector
Researchers & analysts
→ Study financial health and structural challenges in nonprofits
Important Note

Risk scores represent early warning indicators, not definitive outcomes.
They should be used alongside qualitative and contextual information when making decisions.

Future Improvements
Incorporate more recent financial data
Expand sector classification coverage
Enhance organization-level tooling and interactivity

## Contact and Collaboration
- **Author**: Precious Enahoro
- **GitHub**: @PreciousEnahoro
- **Linkedin**: (https://www.linkedin.com/in/precious-enahoro/)

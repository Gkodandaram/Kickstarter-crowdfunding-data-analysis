# 🚀 Kickstarter Crowdfunding — Data Analysis Project

> A multi-tool data analysis project uncovering the key success factors behind Kickstarter crowdfunding campaigns using Excel, Power BI, SQL, and Tableau.

---

## 📌 Project Overview

With over 366K campaigns and $16 billion raised, Kickstarter is the world's largest crowdfunding platform. This project analyzes campaign data to identify what separates successful projects from failed ones — across categories, countries, funding goals, and time periods.

The same dataset was analyzed consistently across **four industry-standard tools**, allowing a direct comparison of each tool's analytical depth and visualization capabilities.

---

## 🎯 Objectives

- Identify the key factors that drive Kickstarter campaign success
- Analyze campaign outcomes by category, country, goal range, and duration
- Compare analytical and visualization strengths across Excel, Power BI, SQL, and Tableau
- Provide actionable insights for campaign creators and investors

---

## 🔍 Key Findings

| Insight | Detail |
|--------|--------|
| 🏆 **Top Categories** | Product Design, Tabletop Games, and Music have the highest project counts |
| ✅ **Success Rate** | Overall success rate is **38.35%** — only 140K out of 366K campaigns succeeded |
| 💰 **Funding Goals** | Campaigns with goals under **$5K** have the highest success rate (49.67%) |
| 🌍 **Top Countries** | USA leads with 267K projects; UK and Canada follow |
| ⏱️ **Campaign Duration** | Campaigns averaging **80 days** perform best |
| 👥 **Most Backers** | Exploding Kittens had 219K backers — the highest on the platform |
| 💵 **Highest Raised** | The Veronica Mars project raised $2M — top by amount |
| ❌ **Failure Insight** | Australia has the highest failure rate at 56.19% among top countries |

---

## 📸 Dashboard Screenshots


![ALL DATA FILES ]https://drive.google.com/drive/folders/1KST7FXdyG92qF9mPhNq1G9kP3SQBVdJr?usp=drive_link


## 🛠️ Tools & Files

### 📗 Excel (`kickstarter_analysis.xlsx`)
- Data cleaning: removed duplicates, handled missing values, fixed formatting
- Pivot tables and slicers for interactive filtering by Year, Quarter, Month
- Dashboard with outcome breakdown, top projects by backers/amount, and category success rates
- Best for: quick setup, static reports, and mid-size data exploration

### ⚡ Power BI (`kickstarter_analysis.pbix`)
- Connected to the cleaned dataset with DAX measures for dynamic KPIs
- Interactive drill-through, filters, bookmarks, and world map visuals
- Dashboards for success projects, country performance, and creator records
- Best for: real-time tracking, scalable dashboards, investor-level reporting

### 🗄️ SQL (`kickstarter_analysis.sql`)
- Queries for total projects by outcome (failed, successful, cancelled, live, suspended)
- Country-level project count analysis using JOIN across location and project tables
- Category breakdown with total project counts ordered by volume
- Best for: data aggregation, filtering large datasets, backend reporting

### 📈 Tableau (`kickstarter_analysis.twbx`)
- Story-driven dashboards for stakeholder presentations
- Heat maps, tree maps, and success storyboards
- Live filters and dynamic tooltips for interactive exploration
- Best for: visual storytelling, pitch decks, executive presentations

---

## 📂 Repository Structure

```
Kickstarter-Crowdfunding-Analysis/
│
├── 📗 kickstarter_analysis.xlsx          # Excel dashboard & pivot analysis
├── ⚡ kickstarter_analysis.pbix          # Power BI interactive report
├── 🗄️ kickstarter_analysis.sql           # SQL queries for campaign analysis
├── 📈 kickstarter_analysis.twbx          # Tableau workbook & story dashboards
├── 📊 Kickstarter_Crowdfunding.pptx      # Project presentation slides
├── 📁 screenshots/                       # Dashboard screenshots
│   ├── excel_dashboard.png
│   ├── powerbi_dashboard_1.png
│   ├── powerbi_dashboard_2.png
│   ├── sql_query_1.png
│   ├── sql_query_2.png
│   └── sql_query_3.png
└── 📄 README.md                          # Project documentation (this file)
```

---

## 📊 Analytical Workflow

```
Raw Kickstarter Data
    │
    ▼
Data Cleaning & Preparation
(Excel + SQL — remove duplicates, fix nulls, standardize formats)
    │
    ▼
Exploratory Analysis
(SQL — outcome counts, category totals, country breakdowns)
    │
    ▼
Dashboard Visualization
(Excel, Power BI, Tableau — interactive visuals & KPIs)
    │
    ▼
Insight Generation & Recommendations
(Identify success drivers → campaign strategy)
```

---

## 💡 Recommendations for Campaign Creators

1. **Keep goals realistic** — campaigns under $5K succeed at nearly 50%; high targets dramatically reduce chances
2. **Choose the right category** — Tabletop Games (62%), Shorts (56%), and Music (53%) have the highest success rates
3. **Target the US market** — US campaigns dominate in volume and funding; localize content accordingly
4. **Plan for ~80 days** — campaigns lasting around 80 days show the best performance metrics
5. **Build a backer community** — projects with high backer engagement (like Exploding Kittens) far outperform peers
6. **Avoid over-promising** — campaigns with moderate, credible goals build more backer trust

---

## 🚀 How to Use This Project

1. **SQL** — Open `kickstarter_analysis.sql` in MySQL Workbench, DBeaver, or any SQL client and run the queries
2. **Excel** — Open `kickstarter_analysis.xlsx` in Microsoft Excel (2016 or later recommended)
3. **Power BI** — Open `kickstarter_analysis.pbix` in [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free)
4. **Tableau** — Open `kickstarter_analysis.twbx` in [Tableau Public](https://public.tableau.com/) (free) or Tableau Desktop

---

## 📃 License

This project is intended for educational and portfolio purposes.

---

*Built with ❤️ using Excel · Power BI · SQL · Tableau*

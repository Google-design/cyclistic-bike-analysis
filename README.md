# 📌 Portfolio Case Study: Cyclistic Bike-Share Analysis  
## 🚲 Converting Casual Riders to Annual Members

---

## 📘 Overview

### **Objective**  
Analyze how casual riders and annual members use Cyclistic’s bike-sharing service differently and provide data-driven recommendations to support the marketing strategy focused on converting casual riders into annual members.

---

## 🔍 Business Task

Cyclistic, a bike-share program in Chicago, aims to increase revenue by converting more casual riders into annual members. This case study focuses on:

- Understanding how each user group behaves.  
- Identifying patterns and trends in usage.  
- Creating actionable insights for the marketing team.

---

## 🧩 SMART Questions

1. How do trip durations differ between casual and member riders?  
2. What times of day and days of the week see the most activity by rider type?  
3. How frequently do each user group ride?  
4. What stations or trip types are more common for one group versus the other?

---

## 🗃️ Data Source

**Files Used:**

- `Divvy_Trips_2019_Q1.xlsx`  
- `Divvy_Trips_2020_Q1.xlsx`

**Included Fields:**

- Unique trip IDs  
- Start and end timestamps  
- Start and end station names  
- Rider type (casual vs. member)  
- Demographic info (gender, birth year — 2019 only)

---

## 🧼 Data Cleaning & Preparation

**Tools Used:**  
- RStudio  
- BigQuery (SQL-based transformations)  
- Tableau (for dashboards)

**Steps Taken:**

- Imported both datasets and standardized column names  
- Combined data into a single frame after schema unification  
- Cleaned trip duration:
  - Removed entries `<1 minute` or `>24 hours`  
- Created new variables:
  - `ride_length` (in minutes)  
  - `day_of_week`  
  - `hour_of_day`  
  - `season` (derived from month)  
- Removed duplicates and NAs  
- Verified data integrity with exploratory summaries

---

## 📊 Data Analysis

### 1. 🚴‍♂️ Ride Duration

- Casual riders had significantly longer average ride durations  
- Suggests more leisure or tourism use  
- Members had shorter, more frequent rides (commuting or utility)

---

### 2. 📅 Ride Frequency

- Members took **6x more trips** overall than casual riders  
- **Weekday usage** peaked for members (commutes)  
- **Weekend usage** higher for casual riders

---

### 3. 🕒 Time of Day

- Members showed **rush hour usage** (8–9 AM, 5–6 PM)  
- Casual riders had **scattered, midday usage peaks**

---

### 4. 📍 Stations (SQL & Tableau Analysis)

- Casual riders:
  - More likely to start and end at the **same station** (looped rides)  
- Members:
  - Trips were **point-to-point** (commutes or errands)

---

### 5. 🧑 Demographics (2019 only)

- Majority of users were **male**  
- Suggests opportunity for **targeted campaigns** based on gender and usage behavior

---

## 📈 Visualizations

Include screenshots or links to Tableau/GitHub:

- 📦 **Boxplot**: Ride Duration by User Type  
- 📅 **Bar Chart**: Rides by Day of Week  
- 🕒 **Histogram**: Hourly Ride Distribution  
- 📍 **Dashboard** or Station Analysis (via Tableau)

![Average Trip Duration vs. Usertype](visuals\AVERAGE of trip_duration vs. usertype.png)
![Average Duration vs. Day](visuals\average_duration vs. Weekday.png)

[🔗 Tableau Dashboard](https://public.tableau.com/app/profile/fnu.abdullah3101/viz/CyclisticMostPopularStations/Dashboard1)


---

## ✅ Recommendations

1. **Targeted Weekend & Tourist Campaigns**  
   - Offer weekend bundles and tourist discounts  
   - Use in-app and station-based promotions

2. **Commute-Based Incentives for Members**  
   - Add rush hour perks (guaranteed bikes, loyalty rewards)

3. **Seasonal Gear & Promotions**  
   - Provide winter gear bundles or cold-weather perks

4. **Convert High-Usage Casuals**  
   - Identify frequent casual riders  
   - Send upgrade offers or personalized outreach

5. **Station-Based Optimization**  
   - Monitor high-casual-use stations  
   - Optimize bike availability accordingly

---

## 📁 Project Structure

```
Cyclistic-Bike-Share-Analysis/
│
├── data/
│ ├── Divvy_Trips_2019_Q1.xlsx
│ └── Divvy_Trips_2020_Q1.xlsx
│
├── scripts/
│ └── cyclistic_analysis.R
│
├── visuals/
│ ├── ride_duration_boxplot.png
│ ├── hourly_usage_histogram.png
│ └── day_of_week_barplot.png
│
├── tableau/
│ └── link-to-dashboard
│
├── README.md
└── cyclistic_case_study.pdf
```

---

## 🧾 How to Use

- Open `cyclistic_analysis.R` in **RStudio** and run to reproduce the analysis  
- Use the **Tableau dashboard** for interactive visual exploration  
- Read the **README.md** or **case_study.pdf** for a full summary

---

## 🌟 Final Thoughts

This project was a practical example of using real-world behavioral data to inform business decisions. Through segmentation, trend analysis, and geospatial station use, we provide Cyclistic with clear, actionable strategies to increase **membership conversions** and boost **customer lifetime value**.

---
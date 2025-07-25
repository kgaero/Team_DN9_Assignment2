<!-- ───────── START of Prompts by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->

# Detailed Interpretation of 14‑Day Sales Forecast Plot

Below is a day‑by‑day breakdown of the forecasted total daily sales (blue line) with its 95 % prediction interval (shaded band).

| Date       | Day | Forecast (¥) | 95 % CI Lower | 95 % CI Upper |
|------------|-----|--------------|---------------|---------------|
| 2017‑08‑01 | Tue |   877 018    |    801 403    |    952 632    |
| 2017‑08‑02 | Wed |   879 722    |    797 675    |    961 769    |
| 2017‑08‑03 | Thu |   727 332    |    642 977    |    811 686    |
| 2017‑08‑04 | Fri |   842 084    |    754 561    |    929 607    |
| 2017‑08‑05 | Sat | 1 026 835    |    935 806    |  1 117 865    |
| 2017‑08‑06 | Sun | 1 112 701    |  1 018 365    |  1 207 038    |
| 2017‑08‑07 | Mon |   811 950    |    714 472    |    909 429    |
| 2017‑08‑08 | Tue |   693 434    |    592 909    |    793 959    |
| 2017‑08‑09 | Wed |   706 181    |    602 693    |    809 668    |
| 2017‑08‑10 | Thu |   620 289    |    513 921    |    726 657    |
| 2017‑08‑11 | Fri |   781 748    |    672 576    |    890 919    |
| 2017‑08‑12 | Sat |   984 699    |    872 794    |  1 096 604    |
| 2017‑08‑13 | Sun | 1 074 499    |    959 926    |  1 189 073    |
| 2017‑08‑14 | Mon |   801 779    |    684 598    |    918 960    |

---

## 1. Clear Weekly Seasonality

- **Weekend Peaks:**  
  - **Saturdays & Sundays** consistently show the highest forecast values (Aug 5–6 and Aug 12–13).  
  - Sunday, Aug 6 tops out at **1.11 M**, ~44 % above the minimum (Aug 10).

- **Mid‑Week Lows:**  
  - **Thursdays** tend to be the slowest (Aug 3 at ~0.73 M, Aug 10 at ~0.62 M).  
  - The absolute trough on **Thursday, Aug 10** is ~620 k.

- **Monday Bounce‑Back:**  
  - Mondays (Aug 7, 14) recover to ~0.81 M, indicating a post‑weekend rebound.

---

## 2. Forecast Uncertainty & Confidence Bands

- **Growing Error Over Horizon:**  
  - The width of the 95 % interval widens from ±~75 k on Day 1 to ±~117 k on Day 14.  
  - This reflects **increasing uncertainty** the further out we predict.

- **Narrow Relative Bounds:**  
  - Even on Day 14, the CI spans ~230 k on a base of ~800 k → relative uncertainty ~±14 %.  
  - This suggests the model remains **reasonably confident** across the two‑week horizon.

---

## 3. Practical Implications

1. **Staffing & Scheduling:**  
   - **Increase headcount** on Saturdays and Sundays (especially Aug 5–6, 12–13) to handle ~1.1 M in sales.  
   - **Lean staffing** on Thursdays (e.g. Aug 3, 10) when sales dip ~40 % below peak.

2. **Inventory Planning:**  
   - **Push inventory** ahead of weekend peaks to avoid stockouts.  
   - **Scale back promotional orders** mid‑week to minimize overstock.

3. **Promotional Timing:**  
   - **Launch promotions** early in the week (Tue/Wed) to drive volume into slower days.  
   - **Leverage weekends** for high‑impact campaigns when foot traffic and sales are already strong.

---

## 4. Model Assessment

- The **ARIMA_PLUS** model has successfully captured the **weekly cycle** and given **actionable** confidence bounds.  
- Next steps could include:  
  - **Incorporating holiday effects** or external regressors (oil price, weather) for further accuracy.  
  - **Monitoring real‑time performance** by comparing actuals to forecast and retraining as needed.  

---

**Conclusion:**  
The forecast plot reveals a robust weekly pattern—higher weekend demand and mid‑week lulls—along with 
manageable forecast uncertainty. These insights empower optimized staffing, inventory, and promotional strategies aligned to the sales rhythm.

<!-- ───────── END of Prompts by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->
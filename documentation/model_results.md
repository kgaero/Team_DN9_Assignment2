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

<!-- ───────── START of Prompts by Rakesh Prusty (prustyr@purdue.edu) ───────── -->

# Dataflow Pipeline Setup for Sales Data Ingestion
## Model Result and Evaluation by Rakesh Prusty
The sales forecast model was evaluated using `ML.EVALUATE`. The `evaluation_results` DataFrame contains key metrics that indicate the model's performance.

**Evaluation Results:**
```
|   non_seasonal_p |   non_seasonal_d |   non_seasonal_q | has_drift   |   log_likelihood |     AIC |    variance | seasonal_periods    | has_holiday_effect   | has_spikes_and_dips   | has_step_changes   |
|-----------------:|-----------------:|-----------------:|:------------|-----------------:|--------:|------------:|:--------------------|:---------------------|:----------------------|:-------------------|
|                2 |                1 |                1 | True        |         -20032.9 | 40075.8 | 1.49373e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                2 |                1 |                1 | False       |         -20034   | 40075.9 | 1.49565e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                0 |                1 |                3 | True        |         -20033.4 | 40076.9 | 1.4947e+09  | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                0 |                1 |                3 | False       |         -20034.6 | 40077.1 | 1.49675e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                1 |                1 |                2 | True        |         -20034.1 | 40078.3 | 1.49597e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                1 |                1 |                2 | False       |         -20035.4 | 40078.8 | 1.4982e+09  | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                0 |                1 |                2 | True        |         -20035.5 | 40079   | 1.49844e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                0 |                1 |                2 | False       |         -20036.8 | 40079.6 | 1.50077e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                1 |                1 |                1 | True        |         -20037.7 | 40083.5 | 1.50241e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                1 |                1 |                1 | False       |         -20039   | 40084.1 | 1.50475e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                0 |                1 |                1 | True        |         -20048   | 40102.1 | 1.52108e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                0 |                1 |                1 | False       |         -20049   | 40102.1 | 1.52291e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                3 |                1 |                0 | False       |         -20052.2 | 40112.3 | 1.5287e+09  | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                3 |                1 |                0 | True        |         -20051.6 | 40113.2 | 1.52765e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                2 |                1 |                0 | False       |         -20089.6 | 40185.2 | 1.5988e+09  | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                2 |                1 |                0 | True        |         -20089.2 | 40186.4 | 1.59808e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                1 |                1 |                0 | False       |         -20175.2 | 40354.5 | 1.77149e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                1 |                1 |                0 | True        |         -20175   | 40356   | 1.77105e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                0 |                1 |                0 | False       |         -20291.9 | 40585.9 | 2.03706e+09 | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
|                0 |                1 |                0 | True        |         -20291.8 | 40587.7 | 2.0368e+09  | ['WEEKLY' 'YEARLY'] | False                | True                  | True               |
```

**Sales Predictions:**
```
| forecast_timestamp        |   forecast_value |   standard_error |   confidence_level |   prediction_interval_lower_bound |   prediction_interval_upper_bound |   confidence_interval_lower_bound |   confidence_interval_upper_bound |
|:--------------------------|-----------------:|-----------------:|-------------------:|----------------------------------:|----------------------------------:|----------------------------------:|----------------------------------:|
| 2017-08-01 00:00:00+00:00 | 877018           |          38648.8 |               0.95 |                  801403           |                  952632           |                  801403           |                  952632           |
| 2017-08-02 00:00:00+00:00 | 879722           |          41936.4 |               0.95 |                  797675           |                  961769           |                  797675           |                  961769           |
| 2017-08-03 00:00:00+00:00 | 727332           |          43116   |               0.95 |                  642977           |                  811686           |                  642977           |                  811686           |
| 2017-08-04 00:00:00+00:00 | 842084           |          44735.5 |               0.95 |                  754561           |                  929607           |                  754561           |                  929607           |
| 2017-08-05 00:00:00+00:00 |      1.02684e+06 |          46527.8 |               0.95 |                  935806           |                       1.11787e+06 |                  935806           |                       1.11787e+06 |
| 2017-08-06 00:00:00+00:00 |      1.1127e+06  |          48218.1 |               0.95 |                       1.01836e+06 |                       1.20704e+06 |                       1.01836e+06 |                       1.20704e+06 |
| 2017-08-07 00:00:00+00:00 | 811950           |          49824.1 |               0.95 |                  714472           |                  909429           |                  714472           |                  909429           |
| 2017-08-08 00:00:00+00:00 | 693434           |          51381.2 |               0.95 |                  592909           |                  793959           |                  592909           |                  793959           |
| 2017-08-09 00:00:00+00:00 | 706181           |          52895.4 |               0.95 |                  602693           |                  809669           |                  602693           |                  809669           |
| 2017-08-10 00:00:00+00:00 | 620289           |          54367.5 |               0.95 |                  513921           |                  726657           |                  513921           |                  726657           |
| 2017-08-11 00:00:00+00:00 | 781748           |          55800.6 |               0.95 |                  672576           |                  890919           |                  672576           |                  890919           |
| 2017-08-12 00:00:00+00:00 | 984699           |          57197.7 |               0.95 |                  872794           |                       1.0966e+06  |                  872794           |                       1.0966e+06  |
| 2017-08-13 00:00:00+00:00 |      1.0745e+06  |          58561.5 |               0.95 |                  959926           |                       1.18907e+06 |                  959926           |                       1.18907e+06 |
| 2017-08-14 00:00:00+00:00 | 801779           |          59894.3 |               0.95 |                  684598           |                  918960           |                  684598           |                  918960           |
```

## Analysis of Predicted Patterns
The predicted sales exhibit a clear **weekly seasonality**, with sales volume expected to peak on Sundays and be lowest around Thursdays.
As seen in the predicted sales volume data, weekends show a higher overall sales volume compared to weekdays in the forecast period, which aligns with the historical weekly pattern we analyzed earlier.
<!-- ───────── END of Prompts by Rakesh Prusty (prustyr@purdue.edu) ───────── -->

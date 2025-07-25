<!-- ───────── START of Prompts by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->

# My Dataflow Pipeline Documentation

## Pipeline Overview
- **Purpose:** Ingest raw sales transaction data from Cloud Storage, parse and type‑cast each field, and load the cleaned records into BigQuery for downstream analytics.  
- **Source:**  
  `gs://mgmt599_assignment2/kaggle-store-sales/train.csv`  
- **Transformations:**  
  1. Skip the CSV header  
  2. Parse each line with Python’s `csv.reader`  
  3. Convert and map fields:
     - `id` → `INTEGER`  
     - `date` → `DATE` (via `datetime.strptime`)  
     - `store_nbr` → `INTEGER`  
     - `family` → `STRING`  
     - `sales` → `FLOAT`  
     - `onpromotion` → `INTEGER`  
- **Destination:**  
  BigQuery table `mgmt599-kunalghosh:assignment2.sales_data` (loaded with `WRITE_TRUNCATE`)

## Pipeline Configuration
- **Job name:** `beamapp-kgaero-0722084320-194883-pvmsseop`  
- **Region:** `us-central1`  
- **Machine type:** (1 vCPU, 3.75 GB RAM)  
- **Max workers:** 1  

## Data Flow
1. **Read from:**  
   `gs://mgmt599_assignment2/kaggle-store-sales/train.csv`  
2. **Transform:**  
   - Drop header  
   - Parse CSV into list of strings  
   - Map to a dict with properly typed fields (`int`, `float`, `DATE`)  
3. **Write to:**  
   `mgmt599-kunalghosh.assignment2.sales_data` (existing table, `WRITE_TRUNCATE`)

## Lessons Learned
- **Exact path matching:** GCS object paths must match hyphens vs. underscores character‑for‑character.  
- **Null handling:** Blank CSV values will break type conversions—use conditional logic to emit `None` for BigQuery `NULL`.  
- **Local iteration:** Use the `DirectRunner` for quick local tests to avoid Dataflow provisioning delays.  
- **Reusability:** Packaging the pipeline as a Dataflow template would simplify reruns by non‑developers.  

<!-- ───────── END of Prompts by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->
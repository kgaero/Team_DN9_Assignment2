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

<!-- ───────── START of Prompts by Rakesh Prusty (prustyr@purdue.edu) ───────── -->
# Dataflow Pipeline Setup for Sales Data, Store Info and Oil data Ingestion by Rakesh

This document outlines the setup for an Apache Beam pipeline designed to read sales data from a CSV file in Google Cloud Storage, process it, and load it into a BigQuery table.

## Pipeline Overview:

The pipeline performs the following steps:

1.  **Read Data from GCS:** Reads a CSV file (`train.csv`) located in a specified Google Cloud Storage bucket (`gs://mgmt599-rakesh-assignment-1/kaggle-store-sales`). The header row is skipped during reading.
2.  **Parse CSV:** Parses each line of the CSV file into a list of values.
3.  **Transform Record:** Transforms each parsed record into a dictionary with appropriate data types for each field (`id`, `date`, `store_nbr`, `family`, `sales`, `onpromotion`). The `date` string is converted to a `datetime.date` object.
4.  **Write to BigQuery:** Writes the transformed records to a specified BigQuery table (`sales_data`) in the `store_sales_team_data_ninja` dataset within the `mgmt599-rakesh-assignment-1` project.

## Setup Requirements:

1.  **Google Cloud Project:** Ensure you have an active Google Cloud project (`mgmt599-rakesh-assignment-1`).
2.  **Google Cloud Storage Bucket:** A GCS bucket (`gs://mgmt599-rakesh-assignment-1`) is required for storing temporary and staging files for the Dataflow job, as well as the input CSV file (`kaggle-store-sales/train.csv`). Make sure the bucket exists and the input file is uploaded.
3.  **BigQuery Dataset and Table:** A BigQuery dataset (`store_sales_team_data_ninja`) and a table (`sales_data`) must be pre-created before running the pipeline. The `sales_data` table is populated with data from the `train.csv` file in Cloud Storage by this pipeline. The table schema should match the structure of the transformed records (with columns for `id`, `date`, `store_nbr`, `family`, `sales`, and `onpromotion` with appropriate data types). The pipeline is configured with `CREATE_NEVER`, meaning it will not create the table if it doesn't exist, and `WRITE_TRUNCATE`, meaning it will overwrite the table's data if it already exists.
4.  **Dataflow API Enabled:** The Dataflow API must be enabled in your Google Cloud project.
5.  **IAM Permissions:** The service account running the Dataflow job needs appropriate permissions to:
    *   Read from the GCS bucket.
    *   Write to the GCS temporary and staging locations.
    *   Read the BigQuery table schema.
    *   Write data to the BigQuery table (including the ability to truncate the table based on the `WRITE_TRUNCATE` disposition).
6.  **Apache Beam SDK:** The Apache Beam SDK for Python needs to be installed in your environment where you are running the pipeline code (`pip install apache-beam[gcp]`).
7.  **Python Environment:** A Python environment with the necessary libraries (`apache_beam`, `csv`, `datetime`) is required.

## Running the Pipeline:

The pipeline is configured to run on the Dataflow runner. To execute the pipeline, you would typically run the Python script containing this code. The `options` object specifies the project, region, and staging/temporary locations for the Dataflow job.

## Similar Pipeline for store_info and oil data set

The above steps were also performed to load store_info and oil data in big query. 

<!-- ───────── END of Prompts by Rakesh Prusty (prustyr@purdue.edu) ───────── -->

<!-- ───────── START of Prompts by Pavan Meka (pmeka@purdue.edu) ───────── -->

# Dataflow Pipeline: Store Sales Data ETL - Pavan Meka

## Objective
This pipeline processes and cleans sales data from the Kaggle Store Sales dataset stored in a GCS bucket and writes the transformed output to a BigQuery table for further analysis.

---

## Input
- **Source:** Google Cloud Storage (GCS)  
- **Bucket Path:** `gs://mgmt599-pavanmeka-data-lake/kaggle-store-sales/train.csv`  
- **Format:** CSV with header  
- **Columns:**
  - `id`
  - `date`
  - `store_nbr`
  - `family`
  - `sales`
  - `onpromotion`

---

## Transformations
- Skip CSV header.
- Convert and map fields:
  - `id` → INTEGER
  - `date` → DATE (`%Y-%m-%d`)
  - `store_nbr` → INTEGER
  - `family` → STRING
  - `sales` → FLOAT
  - `onpromotion` → INTEGER
- Filter out invalid rows:
  - `sales < 0` (invalid transaction)

---

## Output
- **Destination:** BigQuery  
- **Project:** `mgmt599-pavanmeka-lab1`  
- **Dataset:** `store_sales_team_DN9`  
- **Table:** `sales_data`
---

## Pipeline Configuration
- **Runner:** `DataflowRunner`
- **Region:** `us-central1`
- **Temp Location:** `gs://pavanmeka-lab2-bucket/temp`
- **Staging Location:** `gs://pavanmeka-lab2-bucket/staging`
- **Job Name:** `mgmt599-sales-data-pipeline`
- **Write Disposition:** `WRITE_TRUNCATE`

<!-- ───────── END of Prompts by Pavan Meka (pmeka@purdue.edu) ───────── -->

<!-- ───────── START of Prompts by Sai Nuka (snuka@purdue.edu) ───────── -->

# Dataflow Pipeline: Store Sales Data ETL - Sai Nuka

## Objective
This pipeline is designed to process and clean sales data from the Kaggle Store Sales dataset, which is stored as a CSV file in a Google Cloud Storage (GCS) bucket. The data is read, transformed—by skipping the header, mapping and converting fields to the correct data types, and filtering out invalid transactions—and then loaded into a BigQuery table for further analysis.

---

## Setup
1. **Google Cloud Project:** Use an active Google Cloud project (`mgmt599_sainuka`).
2. **GCS Bucket:** Ensure the bucket (`gs://mgmt599_sainuka`) exists and contains the input CSV file (`kaggle-store-sales/train.csv`) for both staging and temporary Dataflow files.
3. **BigQuery Dataset/Table:** Pre-create the BigQuery dataset (`store_sales_team_data_ninja`) and table (`sales_data`) with the correct schema. The pipeline will overwrite this table's data (`WRITE_TRUNCATE`).
4. **Enable Dataflow API:** Make sure the Dataflow API is enabled in your Google Cloud project.
5. **IAM Permissions:** The service account running Dataflow must be able to read/write to GCS, access the BigQuery schema, and write/truncate data in BigQuery.
6. **Apache Beam SDK:** Install the Apache Beam SDK for Python (`pip install apache-beam[gcp]`).
7. **Python Environment:** Set up a Python environment with the required libraries (`apache_beam`, `csv`, `datetime`).


## Input
- **Source:** Google Cloud Storage (GCS)  
- **Bucket Path:** `gs://mgmt599_sainuka/kaggle-store-sales/train.csv`  
- **Format:** CSV with header  
- **Columns:**
  - `id`
  - `date`
  - `store_nbr`
  - `family`
  - `sales`
  - `onpromotion`

---

## Transformations
- Skip CSV header.
- Convert and map fields:
  - `id` → INTEGER
  - `date` → DATE (`%Y-%m-%d`)
  - `store_nbr` → INTEGER
  - `family` → STRING
  - `sales` → FLOAT
  - `onpromotion` → INTEGER
- Filter out invalid rows:
  - `sales < 0` (invalid transaction)

---

## Output
- **Destination:** BigQuery  
- **Project:** `mgmt-599-sainuka-lab2`  
- **Dataset:** `store_sales_team_data_ninja`  
- **Table:** `sales_data`
---

## Running the Pipeline and Pipeline Configurations:

The pipeline is set up to run using the Dataflow runner. To launch it, you typically execute the Python script that contains the pipeline code. The `options` object is used to define settings like the project, region, and the locations for staging and temporary files required by the Dataflow job.

- **Temp Location:** `gs://mgmt599_sainuka/temp`
- **Staging Location:** `gs://mgmt599_sainuka/staging`

<!-- ───────── END of Prompts by Sai Nuka (snuka@purdue.edu) ───────── -->

<!-- ───────── START of Prompts by Erjon Brucaj (ebrucaj@purdue.edu) ───────── -->

# Dataflow Pipeline Setup — Store Sales Data ETL - Erjon Brucaj

## Objective

This pipeline processes the Kaggle Store Sales dataset by reading both the `train.csv` (sales) and `store_info.csv` files from Cloud Storage, parsing and transforming the data with Apache Beam, and loading them into BigQuery for downstream analysis and modeling.

---

## Input Configuration

**Source:** Google Cloud Storage (GCS)

- **Sales File:** `gs://mgmt599-ebrucaj-data-lake/pipeline_input/train.csv`  
- **Store Info File:** `gs://mgmt599-ebrucaj-data-lake/pipeline_input/store_info.csv`  
- **Format:** CSV (with header row)

### Sales Columns:
- `id`  
- `date`  
- `store_nbr`  
- `family`  
- `sales`  
- `onpromotion`  

### Store Info Columns:
- `store_nbr`  
- `city`  
- `state`  
- `type`  
- `cluster`  

---

## Transformations

- Skip the header row  
- Parse CSV lines using `csv.reader`  
- **Type conversion and cleaning:**
  - `id` → INTEGER  
  - `date` → DATE (`%Y-%m-%d`)  
  - `store_nbr` → INTEGER  
  - `family` → STRING  
  - `sales` → FLOAT  
  - `onpromotion` → INTEGER  
  - `city`, `state`, `type` → STRING  
  - `cluster` → INTEGER  

- **Data filtering:**
  - Remove records where `sales < 0`  
  - Convert empty or malformed fields to `None` (for BigQuery compatibility)  

---

## Output Configuration

**Destination:** BigQuery

- **Project:** `mgmt590-brucaj-assignment-1`  
- **Dataset:** `store_sales_team_DN9`  
- **Tables:**
  - `sales_data`
  - `store_info`
- **Write Disposition:** `WRITE_TRUNCATE` (overwrite table on each run)

---

## Pipeline Configuration

- **Pipeline Type:** Custom Apache Beam Python Script  
- **Script Name:** `dataflow_pipeline.py`  
- **Job Name:** `mgmt599-ebrucaj-pipeline`  
- **Runner:** `DataflowRunner`  
- **Region:** `us-central1`  
- **Machine Type:** Default (`n1-standard-1`)  
- **Max Workers:** 1  
- **Temp Location:** `gs://mgmt599-ebrucaj-data-lake/temp`  
- **Staging Location:** `gs://mgmt599-ebrucaj-data-lake/temp`  

---

## Prerequisites

### APIs to Enable:
- BigQuery API  
- Dataflow API  
- Cloud Storage API  

### IAM Permissions Required:
- Read access to the GCS bucket (`Storage Object Viewer`)  
- Write access to BigQuery (`BigQuery Data Editor`)  
- Execute Dataflow jobs (`Dataflow Admin`, `Dataflow Worker`)  

### BigQuery Table Setup:
- Tables `sales_data` and `store_info` must be created before running the pipeline.  
- Use schema matching the cleaned data structure.

---

## Python Environment Setup

```bash
pip install apache-beam[gcp]



<!-- ───────── END of Prompts by Erjon Brucaj (ebrucaj@purdue.edu) ───────── -->

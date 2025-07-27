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
# Dataflow Pipeline Setup for Sales Data, Store Info and Oil data Ingestion

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

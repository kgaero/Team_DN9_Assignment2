import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam.io.gcp.bigquery import TableReference, BigQueryDisposition
import csv
import datetime

# -----------------------------------------------------------------------------
# 1) Pipeline options
# -----------------------------------------------------------------------------
options = PipelineOptions(
    runner='DataflowRunner',
    project='mgmt599-kunalghosh',
    region='us-central1',
    temp_location='gs://mgmt599_assignment2/temp',
    staging_location='gs://mgmt599_assignment2/staging'
)

# -----------------------------------------------------------------------------
# 2) Entry point for our Beam pipeline
# -----------------------------------------------------------------------------
def run():
    # Reference your pre‑created BigQuery table "oil"
    table_ref = TableReference(
        projectId='mgmt599-kunalghosh',
        datasetId='assignment2',
        tableId='oil'
    )

    with beam.Pipeline(options=options) as pipeline:
        (
            pipeline
            | 'ReadFromGCS' >> beam.io.ReadFromText(
                'gs://mgmt599_assignment2/kaggle-store-sales/oil.csv',
                skip_header_lines=1
              )

            | 'ParseCSV' >> beam.Map(lambda line: next(csv.reader([line])))

            # Handle empty dcoilwtico as NULL
            | 'TransformRecord' >> beam.Map(lambda r: {
                'date':        datetime.datetime.strptime(r[0], '%Y-%m-%d').date(),
                'dcoilwtico':  float(r[1]) if r[1].strip() else None
              })

            | 'WriteToBigQuery' >> beam.io.WriteToBigQuery(
                table=table_ref,
                create_disposition=BigQueryDisposition.CREATE_NEVER,
                write_disposition=BigQueryDisposition.WRITE_TRUNCATE
              )
        )

# -----------------------------------------------------------------------------
# 3) Run the pipeline when invoked as a script
# -----------------------------------------------------------------------------
if __name__ == '__main__':
    run()

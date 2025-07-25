import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam.io.gcp.bigquery import TableReference, BigQueryDisposition
import csv

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
    # Reference an existing BigQuery table (whose schema you’ve pre-created)
    table_ref = TableReference(
        projectId='mgmt599-kunalghosh',
        datasetId='assignment2',
        tableId='store_info'
    )

    with beam.Pipeline(options=options) as pipeline:
        (
            pipeline
            | 'ReadFromGCS' >> beam.io.ReadFromText(
                'gs://mgmt599_assignment2/kaggle-store-sales/stores.csv',
                skip_header_lines=1
              )

            | 'ParseCSV' >> beam.Map(lambda line: next(csv.reader([line])))

            | 'TransformRecord' >> beam.Map(lambda r: {
                'store_nbr': int(r[0]),
                'city':      r[1],
                'state':     r[2],
                'type':      r[3],
                'cluster':   int(r[4])
              })

            | 'WriteToBigQuery' >> beam.io.WriteToBigQuery(
                table=table_ref,
                # Omit `schema=` so Beam fetches the existing schema
                create_disposition=BigQueryDisposition.CREATE_NEVER,
                write_disposition=BigQueryDisposition.WRITE_TRUNCATE
              )
        )

# -----------------------------------------------------------------------------
# 3) Run the pipeline when invoked as a script
# -----------------------------------------------------------------------------
if __name__ == '__main__':
    run()

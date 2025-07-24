import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from awsglue.context import GlueContext
from pyspark.context import SparkContext
from datetime import datetime

args = getResolvedOptions(sys.argv, ["JOB_NAME", "env", "table", "schema", "s3_output_path"])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

now = datetime.now()
year, month, day = now.year, now.month, now.day

jdbc_url = f"jdbc:oracle:thin:@//localhost:1521/XEPDB1"
connection_options = {
    "url": jdbc_url,
    "dbtable": f"{args['schema']}.{args['table']}",
    "user": "orion",
    "password": "SenhaForte123",
    "driver": "oracle.jdbc.driver.OracleDriver"
}

df = spark.read.format("jdbc").options(**connection_options).load()

df = df.withColumn("ano", spark.functions.lit(year)) \
       .withColumn("mes", spark.functions.lit(month)) \
       .withColumn("dia", spark.functions.lit(day))

df.write.mode("overwrite").partitionBy("ano", "mes", "dia") \
    .parquet(args["output_path"])

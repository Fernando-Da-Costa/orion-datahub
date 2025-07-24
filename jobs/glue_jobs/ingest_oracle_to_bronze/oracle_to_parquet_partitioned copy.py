import sys
from pyspark.sql import SparkSession
from pyspark.sql.functions import lit
from datetime import datetime
import os
os.environ["HADOOP_HOME"] = "C:/hadoop"

# Simulando os argumentos (substitua conforme necessário durante o teste local)
args = {
    "JOB_NAME": "oracle_to_parquet_test",
    "env": "dev",
    "table": "empregados",
    "schema": "orion",
    "output_path": "caminho/para/output"
}

# Criando sessão Spark
spark = SparkSession.builder \
    .appName(args["JOB_NAME"]) \
    .config("spark.jars", "file:///C:/drivers/oracle/ojdbc8.jar").getOrCreate()

# Data atual
now = datetime.now()
year, month, day = now.year, now.month, now.day

# Configuração JDBC
jdbc_url = f"jdbc:oracle:thin:@//localhost:1521/XEPDB1"
connection_options = {
    "url": jdbc_url,
    "dbtable": f"{args['schema']}.{args['table']}",
    "user": "orion",
    "password": "SenhaForte123",
    "driver": "oracle.jdbc.driver.OracleDriver"
}

# Leitura dos dados
df = spark.read.format("jdbc").options(**connection_options).load()

# Adicionando colunas de particionamento
df = df.withColumn("ano", lit(year)) \
       .withColumn("mes", lit(month)) \
       .withColumn("dia", lit(day))

df.show()

# Escrita em Parquet particionado
df.write.mode("overwrite").partitionBy("ano", "mes", "dia") \
    .parquet(args["output_path"])

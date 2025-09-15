# orion-datahub

## 🎯 Justificativa

- Nome usado frequentemente em ambientes financeiros como nome-código de produto de dados.
- “Orion” remete à constelação (organização de dados), visão ampla, e robustez.
- “Datahub” representa o centro de inteligência e distribuição de dados corporativos.

---

## 🏛️ Visão do Produto

O **orion-datahub** é a plataforma de dados centralizada do banco, construída sobre a AWS com arquitetura Lakehouse moderna e segregação por camadas Medallion, suportando ingestão, transformação e consumo analítico e operacional de dados com governança e segurança de nível Itaú.

---

## 🧱 Arquitetura Técnica (Nível Itaú)

### 🔹 Camadas Medallion

- **Bronze Layer** – dados brutos, não tratados, auditáveis.
- **Silver Layer** – dados limpos, tratados, integrados.
- **Gold Layer** – dados otimizados para consumo, métricas, KPIs e cubos analíticos.

### 🧩 Componentes Técnicos (AWS)

| Serviço AWS             | Papel no Produto                                 |
|-------------------------|--------------------------------------------------|
| Amazon S3               | Armazenamento das camadas Bronze/Silver/Gold     |
| AWS Glue                | ETL serverless, jobs Spark + Crawlers            |
| AWS Lake Formation      | Catálogo + Governança de dados                   |
| AWS Athena              | Query SQL sobre dados do Data Lake               |
| Amazon Redshift         | Data warehouse para workloads analíticos pesados |
| Lambda / Step Functions | Orquestração e eventos serverless                |
| CloudWatch + Alarms     | Monitoramento e alertas                          |
| Secrets Manager         | Armazenamento seguro de segredos                 |
| EventBridge             | Gatilhos e automação por evento                  |
| IAM + SCP               | Segurança e controle de acesso                   |

---

## 📁 Estrutura do Projeto (Git Repo)

```bash
orion-datahub/
├── terraform/
│   ├── environments/
│   │   ├── dev/
│   │   ├── staging/
│   │   └── prod/
│   ├── modules/
│   │   ├── s3
│   │   ├── glue
│   │   ├── lakeformation
│   │   ├── redshift
│   │   └── iam
│   └── main.tf
├── dags/                     # (Para uso com MWAA ou Dagster)
├── jobs/
│   ├── glue_jobs/
│   └── lambda_jobs/
├── notebooks/                # Exploração analítica
├── docs/
│   └── arquitetura.md
├── scripts/
│   └── onboarding_data.sh
└── README.md
```

# 🔐 Segurança e Governança (Padrão Itaú)

- Governança centralizada via **Lake Formation**
- Controle de acesso por **coluna/linha** e **resource tags**
- Criptografia em **trânsito e repouso** com **KMS**
- Segurança **multi-conta** com **Service Control Policies (SCPs)**
- Infra como código via **Terraform** (módulos reutilizáveis e versionados)

---

# 🔄 Pipelines de Dados

## Ingestão

- Oracle → Glue JDBC → S3 Bronze  
- Kafka → Lambda → S3 Bronze  
- REST APIs → Lambda → S3 Bronze  

## Processamento

- Glue Jobs (PySpark)  
- Step Functions para orquestração complexa  

## Consumo

- Athena e Redshift Spectrum para analistas  
- Redshift para BI (Power BI, Tableau, Looker)  
- Exportações para microsserviços via API Gateway  

---

# 🧪 Ambientes

- **DEV** – testes unitários, dados fictícios, sandbox  
- **STAGING** – igual ao PROD, com dados mascarados  
- **PROD** – dados reais, segurança reforçada, auditoria

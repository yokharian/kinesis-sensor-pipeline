# 🧠 PRD: Kinesis Sensor Pipeline

## tl;dr

Serverless data-processing pipeline using AWS Kinesis to ingest, transform, and deliver electrical sensor data from 500+ industrial IoT devices connected through 50+ Raspberry Pi gateways — reliably handling 95% of sensor events sent every five minutes, with local buffering for network interruptions.

---

## 🎯 Goals

- **Serverless Processing**: Ingest and process sensor data without managing servers (Lambda, Step Functions, Kinesis)
- **Reliable Event Delivery**: Handle 95% of sensor events within the 5-minute reporting window, even during network interruptions
- **Local Buffering**: Raspberry Pi devices buffer data locally in SQLite during connectivity outages and sync on reconnection
- **Infrastructure as Code**: AWS CDK manages all infrastructure for reproducibility and scalability
- **Cost Calculation**: Automatically compute electricity costs from raw sensor measurements using Step Functions

## 👤 User Stories

- As an **operations manager**, I want sensor data processed within minutes so I can monitor factory electricity usage in near real-time
- As a **data engineer**, I want the pipeline to handle network outages gracefully so no sensor data is lost
- As a **DevOps engineer**, I want CDK-defined infrastructure so I can reproduce and scale the pipeline
- As a **business analyst**, I want computed electricity costs per measurement so I can build accurate cost dashboards

## 🔄 Data Flow

```text
1. Industrial IoT sensors take readings every 5 minutes
   ↓
2. Raspberry Pi gateway receives readings from connected sensors
   ↓
3. If online: send data directly to AWS Kinesis Data Streams
   If offline: buffer locally in SQLite, sync on reconnection
   ↓
4. Kinesis Data Firehose batches and delivers raw data to S3 (Data Lake)
   ↓
5. Lambda functions process incoming records:
   - Parse sensor measurements
   - Compute electricity costs using tariff rules
   - Validate and clean data
   ↓
6. Processed data stored in time-series database (InfluxDB / Timestream)
   ↓
7. Step Functions orchestrate ETL jobs for external data integration
   ↓
8. BI tools (Grafana, Power BI via Athena) visualize KPIs and dashboards
```

## 🧱 Core Components

### Edge Layer

- **IoT Sensors**: 500+ electrical measurement devices sending voltage, current, and power readings
- **Raspberry Pi Gateways**: 50+ devices collecting sensor data, running local SQLite buffer
- **Sync Agent**: Detects network restoration and uploads buffered data to Kinesis

### Ingestion Layer

- **Kinesis Data Streams**: Real-time ingestion of sensor events
- **Kinesis Data Firehose**: Batching and delivery to S3 data lake

### Processing Layer

- **Lambda Functions**: Parse, compute costs, validate, and clean sensor data
- **Step Functions**: Orchestrate ETL jobs for external data source integration (client-provided CSVs, etc.)

### Storage Layer

- **S3 Data Lake**: Raw and processed sensor data
- **Time-Series DB**: InfluxDB (later migrated to AWS Timestream) for queryable analytics

### Observability

- **CloudWatch**: Metrics, logs, and alarms
- **Sentry**: Error tracking and alerting

### Infrastructure

- **AWS CDK**: All infrastructure defined as code for reproducible deployments

## 📚 References

- [Architecture Diagram](./diagram.puml)
- Blog post: [Data Processing Pipeline](https://yokharian.dev/posts/iot-electrical-bi-and-kpis-startup)
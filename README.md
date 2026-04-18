# Kinesis Sensor Pipeline

![Architecture](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/yokharian/kinesis-sensor-pipeline/master/diagram.puml)

Serverless pipeline on AWS Kinesis that ingests, processes, and computes electricity costs from 500+ industrial IoT sensors with local buffering for network resilience.

## Tech Stack

- **Cloud**: AWS (CDK, Lambda, Step Functions, Kinesis, Firehose, S3, CloudWatch)
- **IoT Edge**: Raspberry Pi + SQLite local buffer
- **Data Processing**: Python, Pandas
- **Time-Series DB**: InfluxDB / AWS Timestream
- **Observability**: CloudWatch, Sentry

## How It Works

1. Industrial sensors send readings every 5 minutes to Raspberry Pi gateways
2. Gateways push data to AWS Kinesis (or buffer in SQLite if offline)
3. Kinesis Data Firehose batches data and writes to S3
4. Lambda functions parse, validate, and compute electricity costs
5. Step Functions orchestrate ETL jobs for external data sources
6. Processed data stored in time-series DB for dashboards and BI

## Features

- 95% sensor event delivery within 5-minute windows
- Local SQLite buffering on Raspberry Pi during network outages
- Automatic electricity cost calculation per measurement
- CDK-managed infrastructure for reproducible deployments
- S3 data lake with time-series query layer
- CloudWatch + Sentry monitoring


## References

- [PRD](./prd.md)
- Blog post: [Data Processing Pipeline](https://yokharian.dev/posts/iot-electrical-bi-and-kpis-startup)

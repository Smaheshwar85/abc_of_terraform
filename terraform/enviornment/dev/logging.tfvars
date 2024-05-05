project_id = "data-engineering-demo-4132111111111111111"
location = "global"
retention_days = 60
bucket_id = "center_for_allLogs"
description = "center for all logs (Managed by Terraform)"
sink_name = "log_siink"
destination = "logging.googleapis.com/projects/data-engineering-demo-41321111111111111/locations/global/buckets/center_for_allLogs"
filter = "severity >= ERROR"
sink_project = "project-dev-416415555555555"

# Add other logging related variables if needed

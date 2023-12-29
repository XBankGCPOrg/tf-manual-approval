#!/bin/bash

# Set the actual value you want to replace <REPLACEVALUE> with
actual_value="terraform-test"

# Specify the path to your CODEOWNERS file
codeowner_file="./CODEOWNERS"

management_file="workflows/management_pipeline.yaml"

backend_file="../03-gke/backend.tf"

# Create a temporary file
temp_file=$(mktemp)

temp_file_management_pipeline=$(mktemp)

temp_backend=$(mktemp)

sed "s|<REPLACEVALUE>|$actual_value|g" "$codeowner_file" > "$temp_file"
mv "$temp_file" "$codeowner_file"


sed "s|<REPLACEVALUE>|$actual_value|g" "$management_file" > "$temp_file_management_pipeline"
mv "$temp_file_management_pipeline" "$management_file"

sed "s|<REPLACEVALUE>|$actual_value|g" "$backend_file" > "$temp_backend"
mv "$temp_backend" "$backend_file"

echo "Replacement complete."

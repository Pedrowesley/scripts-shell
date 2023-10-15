#!/bin/bash

# AWS environment variables
AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"
AWS_DEFAULT_REGION="$AWS_DEFAULT_REGION"

# S3 bucket name
S3_BUCKET_NAME="bucket-name-here"

# S3 folder name
S3_FOLDER_NAME="folder-name-bucket"

# Checks if the bucket exists
if aws s3api head-bucket --bucket "$S3_BUCKET_NAME" 2>/dev/null; then
  echo "O bucket $S3_BUCKET_NAME existe."

  # Checks if the folder exists
  if aws s3 ls "s3://$S3_BUCKET_NAME/$S3_FOLDER_NAME" 2>/dev/null; then
    echo "A pasta $S3_FOLDER_NAME existe."
  else
    echo "A pasta $S3_FOLDER_NAME não existe. Criando..."
    aws s3api put-object --bucket "$S3_BUCKET_NAME" --key "$S3_FOLDER_NAME/"
  fi

  # Using the AWS CLI to delete all objects in the folder
  aws s3 rm "s3://$S3_BUCKET_NAME/$S3_FOLDER_NAME" --recursive

  # Local directory containing the files you want to upload
  LOCAL_DIRECTORY="./www"

 # Upload files to the desired folder
  aws s3 sync "$LOCAL_DIRECTORY" "s3://$S3_BUCKET_NAME/$S3_FOLDER_NAME"

else
  echo "O bucket $S3_BUCKET_NAME não existe ou ocorreu um erro ao verificar a existência."
fi

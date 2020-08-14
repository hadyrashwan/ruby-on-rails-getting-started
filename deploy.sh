#!/bin/bash

PROJECT_ID=ruby-on-rails-getting-started
APP_NAME=ruby-on-rails

gcloud config set project $PROJECT_ID
gcloud builds submit --tag gcr.io/$PROJECT_ID/$APP_NAME  
gcloud run deploy $APP_NAME --image gcr.io/$PROJECT_ID/$APP_NAME --allow-unauthenticated --platform managed  --memory 1024Mi 
gcloud run services add-iam-policy-binding $APP_NAME --member="allUsers" --role="roles/run.invoker"
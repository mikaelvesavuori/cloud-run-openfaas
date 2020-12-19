export PROJECT_ID="you-project-id"
export IMAGE="cloudrun-openfaas"
export TAG="latest"
export REGION="europe-north1"

# Build OpenFaaS packaging, aka "shrinkwrap" and build and push image to Google Cloud
faas-cli build --shrinkwrap
docker build -t gcr.io/$PROJECT_ID/$IMAGE:$TAG -f './build/cloudrunopenfaas/Dockerfile' './build/cloudrunopenfaas/'
docker push gcr.io/$PROJECT_ID/$IMAGE

# Deploy to Cloud Run
gcloud beta run deploy $IMAGE --region $REGION --image gcr.io/$PROJECT_ID/$IMAGE --platform managed --allow-unauthenticated
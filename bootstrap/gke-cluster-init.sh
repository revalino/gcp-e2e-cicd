# Creates 3 GKE autopilot clusters
# ACTION REQUIRED! Change "project-id-here" value to the project you'll be using
export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
# Test cluster
echo "creating testcluster..."
gcloud container --project "$PROJECT_ID" clusters "testcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
# Staging cluster
echo "creating stagingcluster..."
gcloud container --project "$PROJECT_ID" clusters "stagingcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
# Prod cluster
echo "creating prodcluster..."
gcloud container --project "$PROJECT_ID" clusters  "prodcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
echo "Creating clusters! Check the UI for progress"

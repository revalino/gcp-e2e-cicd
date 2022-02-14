# Creates 3 GKE autopilot clusters
# ACTION REQUIRED! Change "project-id-here" value to the project you'll be using
export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
# Test cluster
echo "creating testcluster..."
gcloud container --project "$PROJECT_ID" clusters create "testcluster" \
--enable-ip-alias --region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --num-nodes=4 --async 
# Staging cluster
echo "creating stagingcluster..."
gcloud container --project "$PROJECT_ID" clusters create "stagingcluster" \
--enable-ip-alias --region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --num-nodes=4 --async 
# Prod cluster
echo "creating prodcluster..."
gcloud container --project "$PROJECT_ID" clusters create "prodcluster" \
--enable-ip-alias --region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --num-nodes=4 --async 
echo "Creating clusters! Check the UI for progress"

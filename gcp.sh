# replace this with your own gcp project id and the name of the service account
# that will be created.
PROJECT_ID=nx-go-playground
MONGO_URI1:=$(gcloud secrets versions access latest --secret=MONGO_URI --project=maya-mussia --user-output-enabled)
#set PROJECT_ID nx-go-playground
NEW_SA_NAME=test-service-account-name
#set NEW_SA_NAME test-service-account-name
# create service account
#echo regular $NEW_SA_NAME
#echo with {} ${NEW_SA_NAME}
echo "mongo url $MONGO_URI1"
helm install kube-prometheus bitnami/kube-prometheus -n prometheus --create-namespace --set installCRDs=true
helm install argo-cd bitnami/argo-cd -n argocd --create-namespace --set installCRDs=true
helm install argo-workflows bitnami/argo-workflows -n workflows --create-namespace --set installCRDs=true
helm install grafana bitnami/grafana -n grafana --create-namespace --set installCRDs=true
# https://cert-manager.io/docs/installation/helm/#option-1-installing-crds-with-kubectl
helm install cert-manager jetstack/cert-manager -n cert-manager --create-namespace --version v1.8.2 --set installCRDs=true
#gh gist view -w
#SA="${NEW_SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"
#gcloud iam service-accounts create $NEW_SA_NAME --project $PROJECT_ID
#
## enable cloud API
#SERVICE="sqladmin.googleapis.com"
#gcloud services enable $SERVICE --project $PROJECT_ID
#
## grant access to cloud API
#ROLE="roles/cloudsql.admin"
#gcloud projects add-iam-policy-binding --role="$ROLE" $PROJECT_ID --member "serviceAccount:$SA"
#
## create service account keyfile
#gcloud iam xdasservice-accounts keys create creds.json --project $PROJECT_ID --iam-account $SA

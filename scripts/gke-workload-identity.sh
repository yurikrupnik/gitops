gcloud iam service-accounts add-iam-policy-binding secret-puller@devops-386509.iam.gserviceaccount.com \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:devops-386509.svc.id.goog[external-secrets/external-secrets]"
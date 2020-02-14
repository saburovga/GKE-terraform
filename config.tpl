apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${cluster_ca_certificate}
    server: https://${endpoint}
  name: gke_${suffix}
contexts:
- context:
    cluster: gke_${suffix}
    user: gke_${suffix}
  name: gke_${suffix}
current-context: gke_${suffix}
kind: Config
preferences: {}
users:
- name: gke_${suffix}
  user:
    auth-provider:
      config:
        cmd-args: config config-helper --format=json
        cmd-path: ${gcloud_path}
        expiry-key: '{.credential.token_expiry}'
        token-key: '{.credential.access_token}'
      name: gcp

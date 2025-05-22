# aws-pod-identity-webhook

This project serves as a Pod Identity Webhook designed to enable authentication into AWS for Kubernetes workloads. It operates within a tightly controlled internal network and is restricted to development use only. The webhook facilitates secure identity handling by mapping Kubernetes service accounts to AWS IAM roles, allowing for seamless and temporary credential access.

- Only accessible within the internal network

- Enforces strict security boundaries

- Used solely for development purposes

- No production data, values, or access are present

- The AWS environment tied to this system is isolated from production

This setup allows teams to safely test AWS-integrated workloads without impacting or exposing production systems.

This project is for internal development use only. No production credentials or sensitive data should ever be committed.

# aws-pod-identity-webhook

This project serves as a Pod Identity Webhook designed to enable authentication into AWS for Kubernetes workloads. It operates within a tightly controlled internal network and is restricted to development use only. The webhook facilitates secure identity handling by mapping Kubernetes service accounts to AWS IAM roles, allowing for seamless and temporary credential access.

- Only accessible within the internal network

- Enforces strict security boundaries

- Used solely for development purposes

- No production data, values, or access are present

- The AWS environment tied to this system is isolated from production

This setup allows teams to safely test AWS-integrated workloads without impacting or exposing production systems.

This project is for internal development use only. No production credentials or sensitive data should ever be committed.

---

Create openid-configuration:

```
kubectl get --raw /.well-known/openid-configuration | jq > .well-known/openid-configuration
```

Add to talos control plane:

```
cluster:
  apiServer:
    extraArgs:
      service-account-issuer: https://raw.githubusercontent.com/infra-code/aws-pod-identity-webhook/${cluster_name}
      service-account-jwks-uri: https://${vip_ip_address}:6443/openid/v1/jwks
```

Update openid-configuration:

```
{
  "issuer": "https://raw.githubusercontent.com/infra-code/aws-pod-identity-webhook/<cluster>",
  "jwks_uri": "https://raw.githubusercontent.com/infra-code/aws-pod-identity-webhook/<cluster>/.well-known/jwks",
  "response_types_supported": [
    "id_token"
  ],
  "subject_types_supported": [
    "public"
  ],
  "id_token_signing_alg_values_supported": [
    "RS256"
  ]
}
```

To update jwks:

```
kubectl get --raw /openid/v1/jwks | jq > .well-known/jwks
```

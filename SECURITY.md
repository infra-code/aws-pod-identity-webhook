# Security Policy

## 🔒 Overview

This project is intended **strictly for internal development use only**. It is used to support authentication into AWS via a Pod Identity Webhook mechanism. The repository may contain configuration and public key data (e.g., JWKS), but **must never include any sensitive or production information**.

## ✅ What This Repository May Contain

- Development-only configuration (e.g., IAM role mappings)
- Publicly safe JSON Web Key Sets (JWKS)
- Non-sensitive, internal-only usage documentation

## ❌ What This Repository Must Never Contain

- AWS access keys, secrets, or credentials
- Any form of production environment configuration
- IAM role ARNs tied to production permissions
- Internal IP addresses, DNS names, or infrastructure details
- Tokens, passwords, or any other sensitive data

## 🔐 Responsible Practices

- Use pre-commit hooks or tools like [git-secrets](https://github.com/awslabs/git-secrets) to prevent committing sensitive data
- Review all changes for potential leaks before merging
- Enable GitHub secret scanning on this repository
- Limit permissions of associated IAM roles to development-only access

## 📢 Reporting a Security Issue

If you believe you have found a vulnerability or security issue in this repository, please report it **privately**. Contact the maintainers directly and do not open a public issue.

---

**Note:** This repository is public for transparency and internal tooling collaboration only. It is not intended for production use or external consumption.

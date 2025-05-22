jwks:
	kubectl get --raw /openid/v1/jwks | jq > .well-known/jwks.json
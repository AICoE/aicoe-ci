# Qeb-Hwt Tekton

1. Setup Tekton Pipeline and Tekton Trigger in cluster.
2. Create the resources for the example:

```bash
oc apply -f serviceaccount.yaml
oc apply -f role.yaml
oc apply -f binding.yaml
oc apply -f triggertemplate.yaml
oc apply -f triggerbinding.yaml
oc apply -f eventlistener.yaml
```

1. Send a payload to the listener at port 8080<br>
  port-forwarded with `oc port-forward $(oc get pod -o=name -l eventlistener=listener) 8080`

```bash
curl -X POST \
  http://localhost:8080 \
  -H 'Content-Type: application/json' \
  -H 'X-Hub-Signature: sha1=2da37dcb9404ff17b714ee7a505c384758ddeb7b' \
  -d '{
    "action": "finished",
    "installation": {
        "id": 6181026
    },
    "repo_url": "https://github.com/pacospace/srcops-testing",
    "check_run_id": 417079839,
    "payload": {
        "analysis_id": "adviser-f1d5d010"
    }
}'
```

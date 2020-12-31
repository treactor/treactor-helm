# Telemetry Reactor Chart

Helm chat for installing the Telemetry Reactor.

Uses helm 3

## Testing local

Create a `values-local.yaml` for testing.

```yaml
treactorGo:
  image:
    # Override this if you want to deploy on your own repo
    repository: gcr.io/treactor/treactor-go
    # Pin to a specific version
    tag: "latest"
  # By default no resource limits are set, override
  resources:
    requests:
      memory: "64Mi"
      cpu: "250m"
    limits:
      memory: "64Mi"
      cpu: "1"

# Enough atoms to react split water.
maxNumber: 10 
```

Execute helm template by providing the local values file.

`helm template --values values-local.yaml . > out.yaml`


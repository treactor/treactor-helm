{{/* vim: set filetype=mustache: */}}

{{- define "agent.containerSecurityContext" -}}
{{- if .securityContext -}}
securityContext:
{{- toYaml .securityContext | nindent 2 }}
{{- else -}}
securityContext:
  allowPrivilegeEscalation: false
  runAsNonRoot: false
  readOnlyRootFilesystem: true
  capabilities:
    drop:
      - all
{{- end -}}
{{- end -}}

{{- define "collector.containerSecurityContext" -}}
{{- if .securityContext -}}
securityContext:
{{- toYaml .securityContext | nindent 2 }}
{{- else -}}
securityContext:
  allowPrivilegeEscalation: false
  runAsNonRoot: false
  readOnlyRootFilesystem: true
  capabilities:
    drop:
      - all
{{- end -}}
{{- end -}}

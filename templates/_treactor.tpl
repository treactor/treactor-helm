{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "treactor.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "treactor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "treactor.resource" -}}
{{- if .resources -}}
resources:
{{- toYaml .resources | nindent 2 }}
{{- end -}}
{{- end -}}


{{- define "treactor.envrefs" -}}
- name: K8S_POD_NAME
  valueFrom:
    fieldRef:
      fieldPath: metadata.name
- name: K8S_NAMESPACE_NAME
  valueFrom:
    fieldRef:
      fieldPath: metadata.namespace
- name: K8S_POD_UID
  valueFrom:
    fieldRef:
      fieldPath: metadata.uid
- name: K8S_NODE_NAME
  valueFrom:
    fieldRef:
      fieldPath: spec.nodeName
- name: HOST_IP
  valueFrom:
    fieldRef:
      fieldPath: status.hostIP
{{- end -}}

{{- define "treactor.podSpec" -}}
{{- with .podSecurityContext }}
securityContext:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .nodeSelector }}
nodeSelector:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .tolerations }}
tolerations:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .affinity }}
affinity:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .imagePullSecrets }}
imagePullSecrets:
{{ toYaml . | indent 2 }}
{{- end }}
{{- end -}}

{{- define "treactor.podSecurityContext" -}}
{{- if .securityContext -}}
securityContext:
{{- toYaml .securityContext | nindent 2 }}
{{- else -}}
{{- end -}}
{{- end -}}

{{- define "treactor.containerSecurityContext" -}}
{{- if .securityContext -}}
securityContext:
{{- toYaml .securityContext | nindent 2 }}
{{- else -}}
securityContext:
  allowPrivilegeEscalation: false
  runAsNonRoot: true
  readOnlyRootFilesystem: true
  capabilities:
    drop:
      - all
{{- end -}}
{{- end -}}

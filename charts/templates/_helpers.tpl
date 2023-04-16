{{- define "apps.appName" -}}
{{ .Release.Name }}
{{- end -}}

{{- define "apps.appNamespace" -}}
{{ .Release.Namespace }}
{{- end -}}

{{- define "apps.probeHealthCheck" -}}
httpGet:
  path: {{ .Values.probeHealthCheck }}
  port: {{ .Values.ports.api.container.port }}
{{- end -}}
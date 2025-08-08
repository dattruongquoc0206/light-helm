{{- define "model-serving.name" -}}
model-serving
{{- end }}

{{- define "model-serving.fullname" -}}
{{ include "model-serving.name" . }}
{{- end }}

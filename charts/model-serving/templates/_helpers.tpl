{{- define "model-serving.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "model-serving.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "model-serving.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{- define "model-serving.chart" -}}
{{- printf "%s-%s" .Chart.Name (.Chart.Version | replace "+" "_") -}}
{{- end }}

{{- define "model-serving.selectorLabels" -}}
app.kubernetes.io/name: {{ include "model-serving.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "model-serving.labels" -}}
helm.sh/chart: {{ include "model-serving.chart" . }}
{{ include "model-serving.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end }}

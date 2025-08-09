{{- define "argocd.name" -}}
argocd
{{- end }}

{{- define "argocd.fullname" -}}
{{ include "argocd.name" . }}
{{- end }}

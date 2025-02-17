variable "gcp_username" {
  description = "El nombre de usuario en Google Cloud Platform (GCP)."
  default     = "anas" 
}

variable "gcp_project" {
  description = "El ID del proyecto en Google Cloud Platform (GCP)."
  default     = "anas-444616" 
}

variable "gcp_bucket_name" {
  description = "El nombre del bucket a crear en Google Storage."
  default     = "imagen_buckets"
}

resource "google_storage_bucket" "image_bucket" {
  name     = var.gcp_bucket_name
  location = "US"
  storage_class = "STANDARD"       

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }
}

resource "google_storage_bucket_object" "image1" {
  name   = "el_enigma_de_la_habitacion_622.jpg"
  bucket = google_storage_bucket.image_bucket.name
  source = "./images/el_enigma_de_la_habitacion_622.jpg"
}

resource "google_storage_bucket_object" "image2" {
  name   = "una_historia_de_espana.jpg"
  bucket = google_storage_bucket.image_bucket.name
  source = "./images/una_historia_de_espana.jpg"
}

resource "google_storage_object_access_control" "image1_access" {
  bucket = google_storage_bucket.image_bucket.name
  object = google_storage_bucket_object.image1.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_object_access_control" "image2_access" {
  bucket = google_storage_bucket.image_bucket.name
  object = google_storage_bucket_object.image2.name
  role   = "READER"
  entity = "allUsers"
}

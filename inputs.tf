variable "bucket_name" {
  type = string
}

variable "hosted_zone" {
  type = string
}

variable "domain_names" {
  type        = list(string)
  description = "List of domain names (e.g., ['example.com', 'www.example.com'])"
}

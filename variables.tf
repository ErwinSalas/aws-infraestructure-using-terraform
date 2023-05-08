variable "lab_name" {
  type        = string
  description = "Nombre del estudiante"
  validation {
    condition     = length(var.lab_name) >= 3
    error_message = "no menor de 3 caractéres"
  }
  default = "ErwinSalas"
}

variable "key_name" {
  type        = string
  description = "Nombre de la llave SSH para conectar con el Bastion host"
  default     = "bastionkey"
}


variable "cidr_block" {
  type        = string
  description = "bloque de IP's para la VPC"
}

variable "public_cidr_block_a" {
  type        = string
  description = "Bloque de IP's para la subnet pública A"
}

variable "public_cidr_block_b" {
  type        = string
  description = "Bloque de IP's para la subnet pública B"
}


variable "private_cidr_block" {
  type        = string
  description = "Bloque de IP's para la subnet privada"
}

variable "public_zone_a" {
  type        = string
  description = "Zona de acceso público A"
}

variable "public_zone_b" {
  type        = string
  description = "Zona de acceso público A"
}

variable "private_zone" {
  type        = string
  description = "Zona de acceso privada"
}

variable "domain" {
  type        = string
  description = "Zona de acceso privada"
  default     = "aws-terralabs.tk"
}

# Arquivo de variáveis para mais organização
variable "ROLE" {
    default = "arn:aws:iam::ROLE"
}

variable "CONTAINER_PORT" {
    default = 8050
}

variable "HOST_PORT" {
    default = 8050
}

variable "IMAGEM" {
    #default = "*******.dkr.ecr.us-east-1.amazonaws.com/repositorio-name:tag"
    default = "ghcr.io/guilhermebrumatti/python_image:latest"
}

variable "VPC_ID" {
    default = "vpc-name"
}

variable "AWS_DEFAULT_REGION" {
    default = "us-east-1"
}

variable "key_name" {
  description = "Name of the SSH key to use for EC2 instances"
}

variable "priv_key" {
    description = "Private key for SSH access"
}

variable "remote_exec_sgs" {
    description = "Security group for remote-exec"
}

variable "remote_exec_subnet" {
    description = "Subnet for remote-exec"
}

variable "nc_ip" {
    description = "IP address for nc listener"
    default = ""
}

# INSTANCE TYPES TO ENABLE/DISABLE
variable "remoteexec_enabled" {
    type = bool
    default = true
}

variable "weak_enabled" {
    type = bool
    default = true
}
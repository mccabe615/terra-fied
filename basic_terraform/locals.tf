#set IP
locals {
  public_ip_data = chomp(data.http.public_ip_data.body)
}
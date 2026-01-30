variable "instances" {
 default = [ "mongodb","redis","mysql","frontend" ]
# default = {
#     mongodb = "t3.micro"
#     redis = "t3.micro"
#     mysql = "t3.small"
#     frontend = "t3.micro"
# }
}
variable "zone_id" {
    default = "Z054321925TDC5TE1HMOZ"
}
variable "domain_name" {
    default = "ashokking.sbs"
}

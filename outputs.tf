output "load_balancer_id" {
  value = "${aws_lb.my_nlb.id}"
}

output "load_balancer_dns_name" {
  value = "${aws_lb.my_nlb.dns_name}"
}

output "load_balancer_zone_id" {
  value = "${aws_lb.my_nlb.zone_id}"
}


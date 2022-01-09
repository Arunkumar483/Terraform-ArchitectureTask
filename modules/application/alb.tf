#alb
#albtg
#alblistener
resource "aws_alb" "applb" {
  name               = "applb"
  internal           = false
  load_balancer_type = "application"
  security_groups =  [var.albsecuritygroup_id]
  subnets         = [var.pubsub1_id,var.pubsub2_id]
 
}
resource "aws_lb_target_group" "applb_tg" {
  name        = "applb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

}
resource "aws_lb_listener" "applb_listener" {
  load_balancer_arn = aws_alb.applb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.applb_tg.arn
  }
}
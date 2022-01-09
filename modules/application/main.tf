#launch config
#autoscaling

data "aws_ami" "linux_latest_ami_image" {
    owners = ["amazon"]
    most_recent = true
    filter {
      name = "name"
      values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }

}

resource "aws_launch_configuration" "launchconfig" {
  image_id      = data.aws_ami.linux_latest_ami_image.id
  instance_type = "t2.micro"
  security_groups = [var.lcsecuritygroup_id]
  lifecycle {
    create_before_destroy = true
  }
  key_name = var.key_name
  user_data = templatefile("phpmysqlcon.sh.tpl",{
    rds_dns     = "${var.rds_dns}",
    db_username = "arunkumar",
    db_password = "arunkumar"})
  
}

resource "aws_autoscaling_group" "autoscalinggroup" {
  name                 = "arunkumarasg"
  launch_configuration = aws_launch_configuration.launchconfig.name
  min_size             = 1
  max_size             = 2
  vpc_zone_identifier = [var.privsub1_id,var.privsub2_id]
  target_group_arns = [aws_lb_target_group.applb_tg.arn]
  lifecycle {
    create_before_destroy = true
  }
 
}

variation from: https://www.aravi.me/blog/nginix-web-server-on-ec2-terraform/

see https://github.com/gruntwork-io/terragrunt/issues/2604 - yiskaneto on Jun 12 2023
for the work around - don't add an sso sesison name whne running aws configure sso

this link is useful too - https://overmind.tech/blog/guide-to-configuring-aws-sso-terraform

rm -rf ~/.aws/sso
clean-tf.sh

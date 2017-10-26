# aws-packer-templates
[![License](http://img.shields.io/:license-mit-blue.svg)](https://github.com/l50/aws-packer-templates/blob/master/LICENSE)

Collection of packer templates for AWS.

## To run:
```
packer build -var 'aws_vpc=vpc-<your vpc>' -var 'aws_subnet=subnet-<your subnet>' -var 'aws_region=<your region>' -var 'ssh_username=<ssh user associated with original AMI>' <packer file>.json
```

### TODO:
- [] Try this out: https://github.com/awslabs/ami-builder-packer

## License
MIT

## Resources
- https://gist.github.com/razorsedge/cc0ce3557fe33089142c210877a74943
- http://site.clairvoyantsoft.com/encrypting-amazon-ec2-boot-volumes-via-packer/
- https://aws.amazon.com/blogs/devops/how-to-create-an-ami-builder-with-aws-codebuild-and-hashicorp-packer/
- https://aws.amazon.com/blogs/devops/how-to-create-an-ami-builder-with-aws-codebuild-and-hashicorp-packer-part-2/
- https://github.com/awslabs/ami-builder-packer

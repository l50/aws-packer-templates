# aws-packer-templates
[![License](http://img.shields.io/:license-mit-blue.svg)](https://github.com/l50/aws-packer-templates/blob/master/LICENSE)

A collection of AWS packer templates that I use.

## Kali
This will build a Kali AMI that is provisioned using my Ansible code found in [this repo](https://github.com/l50/ansible-provision-kali).

## To build the Kali AMI:
This has built and tested with us-west-2. To find the proper Kali source_ami for another region: 
1. Find the Kali AMI through the web UI
2. Create an instance with it
3. Copy the source_ami id from the instance info
4. Feel free to also grab the vpc_id, security_group_id, and the subnet_id you plan to use as well (assuming you used these when building the instance)
5. Put these components in for the variables in ```kali.json```
6. Destroy the instance you built to get this information
7. Build the Kali AMI with Packer: ```packer build kali.json```

### In summary, you need to modify the following in kali.json
  - subnet_id
  - security_group_id
  - vpc_id

### These can be modified depending on what your needs are
  - instance_type
  - region
  - source_ami

## To build the ubuntu AMI:
```packer build -var 'aws_vpc=vpc-<your vpc>' -var 'aws_subnet=subnet-<your subnet>' -var 'aws_region=<your region>' -var 'ssh_username=<ssh user associated with original AMI>' <packer file>.json```

## License
MIT

## Resources
- https://gist.github.com/razorsedge/cc0ce3557fe33089142c210877a74943
- http://site.clairvoyantsoft.com/encrypting-amazon-ec2-boot-volumes-via-packer/
- https://aws.amazon.com/blogs/devops/how-to-create-an-ami-builder-with-aws-codebuild-and-hashicorp-packer/
- https://aws.amazon.com/blogs/devops/how-to-create-an-ami-builder-with-aws-codebuild-and-hashicorp-packer-part-2/
- https://github.com/awslabs/ami-builder-packer


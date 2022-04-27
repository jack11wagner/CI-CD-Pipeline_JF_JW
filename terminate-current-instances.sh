#!/bin/bash
aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query 'Reservations[].Instances[].[InstanceId]' --output text|while read line
do
 echo "terminating the instance with id $line"
 aws ec2 terminate-instances --instance-ids $line
done


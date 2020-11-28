#!/bin/bash

EMAIL=500kg.ggwp@gmail.com

load_balancer_dim="Name=LoadBalancer,Value=loadbalancer/web-elb"
#target_group_dim="Name=TargetGroup,Value=targetgroup/practice-4-target-group/dd7baea246f0d5d2"

TOPIC=$(aws sns create-topic \
            --name healthy_check \
            --output text)

echo "Created SNS Topic"

aws sns subscribe \
        --topic-arn $TOPIC \
        --protocol email \
        --notification-endpoint $EMAIL

echo "Subscribed to SNS Topic with email $EMAIL"

aws cloudwatch put-metric-alarm \
            --alarm-name healthy_check \
            --alarm-description "Healthy Alarm" \
            --namespace AWS/ApplicationELB \
            --dimensions $load_balancer_dim  \
            --period 300 \
            --evaluation-periods 1 \
            --threshold 2 \
            --comparison-operator LessThanThreshold \
            --metric-name HealthyHostCount \
            --alarm-actions $TOPIC \
            --statistic Minimum

echo "Created alarm metric"
#aws lambda create-function --function-name CreateThumbnail \
#--zip-file fileb://function.zip --handler index.handler --runtime nodejs12.x \
#--timeout 10 --memory-size 1024 \
#--role arn:aws:iam::238673549734:role/lambda-s3-role \
#--cli-binary-format raw-in-base64-out


#aws lambda invoke --function-name CreateThumbnail --invocation-type Event \
#--payload file://inputFile.txt outputfile.txt


#aws lambda add-permission --function-name CreateThumbnail --principal s3.amazonaws.com \
#--statement-id s3invoke --action "lambda:InvokeFunction" \
#--source-arn arn:aws:s3:::mylambdalab \
#--source-account 238673549734
#

aws s3 sync /home/vladyslav/IT_STEP_DEV/lambda/lambda-s3/testimage/ s3://mylambdalab/
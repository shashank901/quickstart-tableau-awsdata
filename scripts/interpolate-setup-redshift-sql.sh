AfterConversion=`echo $2 | sed -e 's/\//\\\\\//g'`
ARN=`echo $3 | sed -e 's/\//\\\\\//g'`
sed -e "s/<S3Location>/$AfterConversion/g" -e "s/<IAM_ROLE_ARN>/$ARN/g"  -e "s/<REGION>/$4/g" $1

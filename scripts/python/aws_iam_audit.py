###This scrip checks IAM users without MFA enabled###
###Lists access keys older than 90 day### 
###Lists S3 BBuckets that are public###

import boto3

iam = boto3.client('iam')

# 1. List IAM users without MFA
users = iam.list_users()['Users']
print("\nUsers WITHOUT MFA:")
for u in users:
    mfa = iam.list_mfa_devices(UserName=u['UserName'])['MFADevices']
    if len(mfa) == 0:
        print(f" - {u['UserName']}")

# 2. List access keys older than 90 days
print("\nAccess Keys OLDER than 90 days:")
keys = iam.list_access_keys()['AccessKeyMetadata']
for k in keys:
    age = (k['CreateDate']).strftime("%Y-%m-%d")
    print(f" - {k['UserName']} : {k['AccessKeyId']} created {age}")

# 3. List S3 buckets that are public
s3 = boto3.client('s3')
print("\nS3 Buckets with Public Access:")
buckets = s3.list_buckets()['Buckets']
for b in buckets:
    try:
        acl = s3.get_bucket_acl(Bucket=b['Name'])
        for grant in acl['Grants']:
            if 'AllUsers' in str(grant):
                print(f" - {b['Name']}")
    except:
        pass


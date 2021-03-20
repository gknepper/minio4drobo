# minio4drobo
A script to run Minio on a DroboFS - Not tested but probably works in a Drobo5N also

## Define the:

##### Create all the structure inside the DroboApps directory:
On a DroboFS it's **/mnt/DroboFS/DroboApps/minio**

##### Directory to save the minio at service.sh - The directory must exist!
miniostorage="/mnt/DroboFS/Shares/Public/MinioS3/"

##### accessKey and secretKeysave /etc/config.json service.sh
"accessKey": "whateveryouwant",
"secretKey": "whateveryouwant"

# offline-velero-install

this is for a quick install of velero in a offline vsphere env using minio as a s3 storage bucket.

## pre-req

`docker pull velero/velero:v1.6.0`

`docker pull velero/velero-plugin-for-aws:latest`

install velero bin https://velero.io/docs/v1.6/basic-install/

edit `credentials-velero` and change your creds

## Use

run the `install-velero.sh` script after downloading the velero bin.

run `kubectl get backupstoragelocation default -n velero -o yaml` to verify you are about to edit the correct deployment

run `kubectl edit backupstoragelocation default -n velero -o yaml` and add the below line in the spec.config field (not required if not using a secure s3 endpoint).

```
spec:
  config:
    insecureSkipTLSVerify: "true"
```
to preform a quick backup of a namespace use:
`velero backup create backup-name --include-namespaces my-namespace`
to restore the backup you made use:
`velero restore create --from-backup backup-name`


see https://velero.io/docs/v1.6/ for more uses and information.

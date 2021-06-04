#!/bin/bash
#we used the aws pluigin vs vsphere due to using minio
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:latest \
    --bucket backup \
    --secret-file ./credentials-velero \
    --use-volume-snapshots=false \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.domain:9000 \
    --image velero/velero:v1.6.0
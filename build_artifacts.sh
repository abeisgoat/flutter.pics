#!/usr/bin/env bash
REVISION=$(git rev-parse HEAD)
flutter build apk --debug 
gcloud firebase test android run --device model=Pixel2 --type=game-loop --format=json --no-record-video --results-bucket planet-express --results-dir flutter_bucket/$REVISION --app build/app/outputs/apk/debug/app-debug.apk
gsutil -m acl ch -ru AllUsers:R gs://planet-express/flutter_bucket/$REVISION
echo $REVISION

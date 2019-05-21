#!/usr/bin/env bash

if [[ "$CIRRUS_TAG" == "" ]]; then
  echo "Not a tag. No need to deploy!"
  exit 0
fi

FRAMEWORK_PATH="HotUpdate/$CIRRUS_TAG/iOS"

cd $ENGINE_PATH/src 
rm -rf deploy_repo
git clone https://github.com/FlutterPrograms/EngineRepo.git deploy_repo
cd deploy_repo
git config user.name "HaiJun Gu"
git config user.email "243297288@qq.com"
rm -rf $FRAMEWORK_PATH && mkdir -p $FRAMEWORK_PATH
cp $ENGINE_PATH/.gclient $FRAMEWORK_PATH
# cp -Rf target/ios_debug_all/Flutter.framework HotUpdate/1.0.0/iOS/Flutter.framework
git add --all .
git commit -m "Cirrus CI Auto Builder"
git push --force https://$DEPLOY_TOKEN@github.com/FlutterPrograms/EngineRepo.git master
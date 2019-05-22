#!/usr/bin/env bash

if [[ "$CIRRUS_TAG" == "" ]]; then
  echo "Not a tag. No need to deploy!"
  exit 0
fi

GIT_DEPLOY_REPO="deploy_repo"
GIT_FRAMEWORK_PATH="$GIT_DEPLOY_REPO/EngineDynamic/$CIRRUS_TAG/iOS"

cd $ENGINE_PATH/src
rm -rf deploy_repo
git clone https://github.com/FlutterPrograms/EngineRepo.git $GIT_DEPLOY_REPO
rm -rf $GIT_FRAMEWORK_PATH && mkdir -p $GIT_FRAMEWORK_PATH
cp -Rf target/ios_debug_all/Flutter.framework $GIT_FRAMEWORK_PATH/Flutter.framework

cd $GIT_DEPLOY_REPO
git config user.name "HaiJun Gu"
git config user.email "243297288@qq.com"
git add --all .
git commit -m "Cirrus CI Auto Builder"
git push --force https://$DEPLOY_TOKEN@github.com/FlutterPrograms/EngineRepo.git master

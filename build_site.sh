#!/bin/bash

rm -rf /tmp/incubator-site
gradle jbake
mkdir /tmp/incubator-site
cp -R build/jbake/* /tmp/incubator-site
git checkout asf-site
git clean -f -d
git pull origin asf-site
rm -rf *
cp -a /tmp/incubator-site/* .
git add .
git commit -m "Automatic Site Publish by Buildbot"
git push origin asf-site
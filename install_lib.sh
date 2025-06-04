#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Copyright 2023 Xyna GmbH, Germany
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set -e

MAVEN_RESOLVER_ANT_TASKS_VERSION=""
TARGET_DIR="${HOME}/.ant/lib"
REPO_BASE_URL=https://repo.maven.apache.org/maven2/org/apache/maven/resolver/maven-resolver-ant-tasks
HTTP_CODE_OK=200

usage() {
  echo "Usage: $0"
  echo " -h : print this help"
  echo " -v MAVEN_RESOLVER_ANT_TASKS_VERSION : Version of the maven-resolver-ant-tasks-VERSION-uber.jar"
  echo "                                       See: https://mvnrepository.com/artifact/org.apache.maven.resolver/maven-resolver-ant-tasks"
  echo " -o TARGET_DIR                       : target dir (default value: \${HOME}/.ant/lib"
  exit 1
}

while getopts "v:o:h" option; do
  case "${option}" in
    v)
      MAVEN_RESOLVER_ANT_TASKS_VERSION=${OPTARG}
      ;;
    o)
      TARGET_DIR=${OPTARG}
      ;;
    h)
      usage
      ;;
    *)
      usage
      ;;
  esac
done

if [[ -z ${MAVEN_RESOLVER_ANT_TASKS_VERSION} ]] ; then
  usage
fi
if [[ ! -d ${TARGET_DIR} ]] ; then
  echo "mkdir -p ${TARGET_DIR}"
  mkdir -p ${TARGET_DIR}
fi

URL=${REPO_BASE_URL}/${MAVEN_RESOLVER_ANT_TASKS_VERSION}/maven-resolver-ant-tasks-${MAVEN_RESOLVER_ANT_TASKS_VERSION}-uber.jar
TARGET_FILE=${TARGET_DIR}/maven-resolver-ant-tasks-${MAVEN_RESOLVER_ANT_TASKS_VERSION}-uber.jar

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" ${URL})
if [ "$HTTP_CODE" != "$HTTP_CODE_OK" ]; then 
  echo "Error: HTTP_CODE=${HTTP_CODE}, URL=${URL}"; 
  exit 1
fi

echo "curl -s ${URL} -o ${TARGET_FILE}"
curl -s ${URL} -o ${TARGET_FILE}

echo $MY_ENV_VAR
pwd
LAST_SUCCESSFUL_COMMIT=$(curl -Ss -u "$API_KEY:" "https://circleci.com/api/v1.1/project/github/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME?filter=successful&limit=1" | jq -r '.[0]["vcs_revision"]')
git clone  "$CIRCLE_REPOSITORY_URL" --branch "$CIRCLE_BRANCH" test1
cd test1
git reset --hard $LAST_SUCCESSFUL_COMMIT
echo $LAST_SUCCESSFUL_COMMIT
echo $CIRCLE_SHA1
echo "Thanks"
git diff --name-only $LAST_SUCCESSFUL_COMMIT $CIRCLE_SHA1
python ./scripts/pre_test.py
if [ $? -eq 0 ];
then
    echo "$CMD executed successfully"
else
    echo "$CMD terminated unsuccessfully"
    exit -1
fi

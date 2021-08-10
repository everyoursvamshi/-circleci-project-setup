pwd
python ./scripts/pre_test.py
if [ $? -eq 0 ];
then
    echo "$CMD executed successfully"
else
    echo "$CMD terminated unsuccessfully"
    exit -1
fi

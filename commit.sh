!#/bin/bash

echo "Starting commit in directory....."
echo `pwd`
status=`git add *.e *.ecf`
st=` git commit -m "bug fixes" `
push=`git push origin master`

echo "COMMIT SUCCESSFUL . . . . .  exiting"

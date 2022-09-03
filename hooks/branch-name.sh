protectedBranches="^(master|develop|stage)"
branchName=$(git branch | grep '*' | sed 's/* //')

if [[ "$branchName" =~ $protectedBranches ]]
then
  echo  "\n🚫 Commit directly to $branchName branch is not allowed!\n Please use PR.\n" && exit 1
fi

if [[ $branchName = *[![:ascii:]]* ]]
then
  echo "\n🚫 Branch name should not have any ascii and upper case letters, please rename your branch name.\n" && exit 1
fi

validDevelopBranchRegex='^((bugfix|feature)\/[a-zA-Z0-9\-]+)$'
validStageBranchRegex='^((hotfix|release)\/[a-zA-Z0-9\-]+)$'
validMasterBranchRegex='^((hotfix|release)\/[a-zA-Z0-9\-]+)$'


if [[ $branchName == 'develop' && ! $branchName =~ validDevelopBranchRegex ]]; then
    echo "Wrong branch name, pls use this pattern: $validDevelopBranchRegex for develop.\n" && exit 1
fi
if [[ $branchName == 'stage' && ! $branchName =~ validStageBranchRegex ]]; then
    echo "Wrong branch name, pls use this pattern: $validStageBranchRegex for stage.\n" && exit 1
fi
if [[ $branchName == 'master' && ! $branchName =~ validMasterBranchRegex ]]; then
    echo "Wrong branch name, pls use this pattern: $validMasterBranchRegex for master.\n" && exit 1
fi

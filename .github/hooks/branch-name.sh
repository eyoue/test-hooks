echo  ">>>>> STEP 1: Check commit source\n"

protectedBranches="^(master|develop|stage)"
branchName=$(git branch | grep '*' | sed 's/* //')

if [[ $branchName =~ $protectedBranches ]]
then
  echo  "\n🚫 Commit directly to $branchName branch is not allowed!\n Please use PR.\n" && exit 1
fi

echo  ">>>>> STEP 2: Check branch name\n"

if [[ $branchName = *[![:ascii:]]* ]]
then
  echo "\n🚫 Branch name should not have any ascii and upper case letters, please rename your branch name.\n" && exit 1
fi

validBranchRegex='^((bugfix|hotfix|feature|release)\/[a-zA-Z0-9\-]+)$'


if ! [[ $branchName =~ $validBranchRegex ]]; then
    echo "Wrong branch name: $branchName\nPls use this pattern: $validBranchRegex.\n" && exit 1
fi

echo  ">>>>> END\n"

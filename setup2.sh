/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install python3
brew install wget
brew install git
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
echo 'Python3 has been installed, but can not be aliased to python, since some apps expect python to be aliased to Python2.7'
echo 'Would you like to alias Python3? [y]es or [n]o.'
echo 'source ~/.git-completion.bash' >> ~/.bashrc
read aliaspython
if [[ $aliaspython = 'y' ]]
then
  echo 'What would you like to alias it to?'
  read pythonalias
  echo "alias $pythonalias=\"python3\"" >> ~/.bash_profile
fi
echo 'Would you like to alias git checkout? [y]es or [n]o.'
read aliasgitcheckout
if [[ $aliasgitcheckout = 'y' ]]
then
  echo 'What would you like to alias it to?'
  read gitcheckoutalias
  echo "alias $gitcheckoutalias=\"git checkout\"" >> ~/.bash_profile
  echo "__git_complete $gitcheckoutalias _git_checkout" >> ~/.bashrc
fi
echo 'Would you like to alias git status? [y]es or [n]o.'
read aliasgitstatus
if [[ $aliasgitstatus = 'y' ]]
then
  echo 'What would you like to alias it to?'
  read gitstatusalias
  echo "alias $gitstatusalias=\"git status\"" >> ~/.bash_profile
fi
echo 'Would you like to create a function to push new local branches upstream with the appropriate name automatically when called? [y]es or [n]o.'
read addgpo
if [[ $addgpo = 'y' ]]
then
  echo 'What would you like to name the function?'
  read functionname
  echo "function $functionname() { branch=\$(git rev-parse --abbrev-ref HEAD); git push --set-upstream origin \$branch;}" >> ~/.bashrc
fi
echo 'Would you like to create a function to allow you to commit whatever follows your command call, without quotes? [y]es or [n]o.'
read addcommit
if [[ $addcommit = 'y' ]]
then
  echo 'What would you like to call this function?'
  read functionname
  echo "function $functionname() { git add .; git commit -m \"\$*\";}" >> ~/.bashrc
fi
echo 'Would you like to create a function to git clone whatever is in your clipboard? [y]es or [n]o.'
read addgclone
if [[ $addgclone = 'y' ]]
then
  echo 'What would you like to name it?'
  read functionname
  echo "function $functionname() { git clone \`pbpaste\`;}" >> ~/.bashrc
fi
echo 'Would you like to add a function to create a new branch with the specified name? [y]es or [n]o.'
read addnewbranch
if [[ $addnewbranch = 'y' ]]
then
  echo 'What would you like to name it?'
  read functionname
  echo "function $functionname() { git checkout -b \$1;}" >> ~/.bashrc
fi

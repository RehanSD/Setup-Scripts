/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install python3
brew install wget
brew install git
brew cask install java
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
echo 'Would you like to install Anaconda (y)es or (n)o?'
read anaconda
if [[ $anaconda = 'y' ]]
then
  echo 'Which Anaconda distro do you want to install (i.e. 2 or 3)?'
  read anaconda_distro
  echo 'Which version would you like to install? (i.e 4.4.0, etc.)'
  read a_version
  echo 'Would you like to use the command line installer or graphical installer (c) or (g)'
  read installer_kind
  if [[ $installer_kind = 'c' ]]
  then
    wget https://repo.continuum.io/archive/Anaconda$anaconda_distro-$a_version-MacOSX-x86_64.sh
    echo 'Beginning Anaconda installation'
    bash Anaconda$anaconda_distro-$a_version-MacOSX-x86-64.sh
  else
    wget https://repo.continuum.io/archive/Anaconda$anaconda_distro-$a_version-MacOSX-x86_64.pkg
    echo 'Beginning Anaconda installation - follow the steps of the wizard'
    open Anaconda$anaconda_distro-$a_version-MacOSX-x86_64.pkg
  fi
fi
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
source ~/.bashrc
source ~/.bash_profile

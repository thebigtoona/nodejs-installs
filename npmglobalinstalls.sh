# NPM global packages install script

# Variables
NODEVERSION=`node --version`
BASHPROFILE=~/.bashrc
NODEPATH="/usr/local/lib/node_modules"


# Installs to perform
declare -a INSTALLS=("gulp-cli" "yo" "eslint")
INSTALLSLENGTH=${#INSTALLS[@]}

# Check for node install 
if node --version
then 
	echo "Node is installed, running version:" $NODEVERSION
else 
	echo "ERROR: Install Node First"
	exit 1
fi


# fix permissions issues
# if grep -Fxq "NPM_CONFIG_PREFIX=~/.npm-global" $BASHPROFILE
# then 
# 	echo "NPM configuation is already set, moving on..."
# else  
# 	echo "NPM_CONFIG_PREFIX=~/.npm-global" >> $BASHPROFILE
# fi


# perform installs here
for ((i=1; i<=${INSTALLSLENGTH}; i++));
do
	echo "Installing:" $i " / " ${INSTALLSLENGTH} " : " ${INSTALLS[$i-1]}
	npm i -g ${INSTALLS[$i-1]}
done

echo "Finished!"
exit 0

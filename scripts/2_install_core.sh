#install_core.sh installs packages and gets the code
#and data required for the reference environment.  Configuration
#usually happens later in configure_core.sh unless something 
#depends on it here.

log=~/temp/install.log
echo Started install_core.sh | tee -a $log

echo Installing packages | tee -a $log
	sudo apt-get -y update
	sudo apt-get -y install lxterminal
	sudo apt-get -y install --no-install-recommends dvipng cm-super texlive-latex-extra 
	sudo apt-get -y install --only-upgrade firefox
	# Install Python
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
	bash ~/miniconda.sh -b -p $HOME/miniconda
	export PATH="$PATH:~/miniconda/bin"
	conda init
	conda install -y python==3.7.10
	conda install -c conda-forge -y libblas liblapack sundials fortran-compiler
	conda install -c conda-forge -y notebook
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/home/sbl/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/home/sbl/miniconda/etc/profile.d/conda.sh" ]; then
			. "/home/sbl/miniconda/etc/profile.d/conda.sh"
		else
			export PATH="/home/sbl/miniconda/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<

	# Install BondGraphTools
	yes | pip install BondGraphTools==0.4.2
echo Completed package installation | tee -a $log

echo Completed install_core.sh | tee -a $log
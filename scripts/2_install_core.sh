#install_core.sh installs packages and gets the code
#and data required for the reference environment.  Configuration
#usually happens later in configure_core.sh unless something 
#depends on it here.

#log=/vagrant/temp/install.log
echo Started install_core.sh | tee -a $log

echo Installing packages | tee -a $log
	sudo apt-get -y install build-essential libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev libffi-dev
	sudo apt-get -y install firefox featherpad
	sudo apt-get -y install texlive-latex-extra
	sudo apt-get -y install dvipng
	# Install Python
	cd /usr/src
	sudo wget https://www.python.org/ftp/python/3.7.10/Python-3.7.10.tgz
	sudo tar xzf Python-3.7.10.tgz
	cd Python-3.7.10
	sudo ./configure --enable-optimizations
	sudo make altinstall
	# Install Julia
	cd /usr/src
	sudo wget https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-0.6.4-linux-x86_64.tar.gz
	sudo tar xzf julia-0.6.4-linux-x86_64.tar.gz
	sudo mv julia-9d11f62bcb julia-0.6.4
	export PATH="$PATH:/usr/src/julia-0.6.4/bin"
	sudo echo 'export PATH="$PATH:/usr/src/julia-0.6.4/bin"' >> ~/.bashrc
	# Install and configure BondGraphTools
	yes | python3.7 -m pip install matplotlib==2.2.2 sympy==1.7.1 networkx==2.5 julia==0.1.5 diffeqpy==0.4
	yes | python3.7 -m pip install BondGraphTools==0.3.9
	yes | python3.7 -m pip install --upgrade --force-reinstall numpy==1.20.1
	python3.7 -c "from BondGraphTools.config import config"
	julia -e "using DifferentialEquations"
	# Install Jupyter
	yes | python3.7 -m pip install notebook
echo Completed package installation | tee -a $log

echo Completed install_core.sh | tee -a $log
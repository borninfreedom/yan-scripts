#!/bin/bash


# 作用：此脚本是为了简化Linux（Ubuntu）系统上安装软件和配置系统而做。 
# 脚本中集成了很多软件的安装步骤，用户只需要选择对应的软件，即可以实现自动安装，省时省力。
# 同时，脚本包含了很多的配置选项，直接选择对应的选项即可实现系统的配置。
# 为了更好的体验，不用进入 scripts 文件夹便可以启动该脚本，请将 scripts 文件夹添加到 PATH 路径，在终端执行
# echo "export PATH=$PATH:~/scripts" >> ~/.bashrc
# source ~/.bashrc


# version==0.0.1
# changelog
# author==Yan Wen

# define github  gitee email and username.
# please replace them with your email and username. 
# remenber that \" must do not delet, they are 转义字符

GITHUB_EMAIL="\"z19040042@s.upc.edu.cn\""
GITEE_EMAIL="\"z19040042@s.upc.edu.cn\""

GITHUB_USERNAME="\"borninfreedom\""
GITEE_USERNAME="\"文岩\""


# font color defination,when you use them to control font color,  the echo cmd must be added a '-e' parameter. The detail of color control please visit https://blog.csdn.net/bornfree5511/article/details/107359836
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

#install success
function success {
	# if you want to use colored font display, must add -e parameter.
	echo -e "${BYellow}安装成功！"
}

function config_success {
	# if you want to use colored font display, must add -e parameter.
	echo -e "${BYellow}配置成功！"
}

# this will install proxychains, proxychains is the proxy software that can be make traffic through proxy.
function proxychains {
	echo "将要安装proxychains。"
	cd ~
	sudo apt install -y gcc
	sudo apt install -y git
	sudo apt install -y vim
	git clone https://github.com/rofl0r/proxychains-ng.git
	cd ~/proxychains-ng
	./configure
	sudo make && sudo make install
	sudo cp ./src/proxychains.conf /etc/proxychains.conf
	echo -e "${BRed}请执行 sudo vi /etc/proxychains.conf ，将最后的 socks4 127.0.0.1 9095 改为 socks5 127.0.0.1 1089 ，其中 1089是qv2ray 6.0 版本 socks5 代理默认的开放端口，如果不确定自己的端口号，请查看后再输入。"
}

#install redshift-gtk
function redshift {		# the former of { must have a space
	echo "Install redshift"
	# -y parameter indicates that you auto select yes.
	sudo apt install -y redshift-gtk && echo "${BYellow}安装成功"
	# when you exec a command, shell will return a flag that indicates whether exec successfully. if success ,return 0, otherwise 1 default. you can use 
	# $? to extract the flag. 
	# the role of && is  if $?==0, then exec next cmd.
	# the role of || is, if $?!=0, then exec next cmd.
}

#install terminator
function terminator {
	echo "安装terminator"
	sudo apt install -y terminator && echo "${BYellow}安装成功"
}

#install linux qq
function linuxqq {
	echo -e " 将要安装Linux QQ "
	sudo apt install -y wget && cd ~ && wget http://down.qq.com/qqweb/LinuxQQ_1/linuxqq_2.0.0-b2-1082_amd64.deb && sudo dpkg -i linuxqq*.deb || sudo apt -f install -y && success
}


function wps {
	echo -e "将要安装WPS"
	sudo apt install -y wget && cd ~ && wget https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/9604/wps-office_11.1.0.9604_amd64.deb && sudo dpkg -i wps*.deb || sudo apt -f install -y &&  success
}

function vbox {
	echo -e "将要安装virtual box"
	sudo apt install -y wget && cd ~ && wget https://download.virtualbox.org/virtualbox/6.1.12/virtualbox-6.1_6.1.12-139181~Ubuntu~bionic_amd64.deb && sudo dpkg -i virtualbox*.deb || sudo apt -f install -y &&  success
}

function chrome {
	echo -e "将要安装Google Chrome"
	sudo apt install -y wget && cd ~ && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome*.deb || sudo apt -f install -y &&  success
}

function vscode  {
    echo -e "将要安装VSCode"
    sudo apt install -y wget && cd ~ && wget https://az764295.vo.msecnd.net/stable/17299e413d5590b14ab0340ea477cdd86ff13daf/code_1.47.2-1594837870_amd64.deb && sudo dpkg -i code*.deb || sudo apt -f install -y &&  success
}

function matlab  {
    echo -e "将要安装MATLAB，此版本为正版软件，不提供激活账号和激活码，请用自己的校邮箱进行激活。"
    sudo apt install -y git && cd ~ && git clone https://gitee.com/bornfree5986/software  && cd ~/software/Mat* && sudo ./install &&  success
}


function vmware  {
    echo -e "将要安装VMware Workstation 15.5 pro"
    sudo apt install -y wget && cd ~ && wget https://www.vmware.com/go/getworkstation-linux && chmod a+x VM*.bundle && sudo ./VM*.bundle &&  success
	echo -e "${BRed}序列码："
	echo -e "YG5H2-ANZ0H-M8ERY-TXZZZ-YKRV8"
	echo -e "YG5H2-ANZ0H-M8ERY-TXZZZ-YKRV8"
	echo -e "UG5J2-0ME12-M89WY-NPWXX-WQH88"
	echo -e "UA5DR-2ZD4H-089FY-6YQ5T-YPRX6"
	echo -e "GA590-86Y05-4806Y-X4PEE-ZV8E0"
	echo -e "ZF582-0NW5N-H8D2P-0XZEE-Z22VA"
	echo -e "YA18K-0WY8P-H85DY-L4NZG-X7RAD"

}


function teamviewer {
	echo -e " 将要安装 teamviewer "
	sudo apt install -y wget && cd ~ && wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && sudo dpkg -i teamviewer*.deb || sudo apt -f install -y && success
}


function okular {
	echo -e "将要安装okular，pdf阅读和注释软件。"
	sudo apt update && sudo apt install okular && success
}











function gitproxy {
	read -p "请输入代理socks5代理端口，如1089，默认代理地址是127.0.0.1：" port

	while ! [[ "$port" =~ ^[0-9]+$ ]]
	do
	# -n parameter indicates that do not jump to next line
	echo -e -n "${BRed}仅接受数字："
	read port
	done

	git config --global http.proxy socks5://127.0.0.1:${port} && git config --global https.proxy socks5://127.0.0.1:${port} && config_success
}

function github_config {
	echo -e "${Green}默认的邮箱和用户名为 z19040042@s.upc.edu.cn, borninfreedom, 请编辑此脚本，修改脚本开头的GITHUB_EMAIL和GITHUB_USERNAME 为自己账号的信息，再重新配置此项。${Color_Off}"
	git config user.email ${GITHUB_EMAIL} && git config user.name ${GITHUB_USERNAME} && config_success
}

function gitee_config {
	echo -e "${Green}默认的邮箱和用户名为 z19040042@s.upc.edu.cn, 文岩, 请编辑此脚本，修改脚本开头的GITEE_EMAIL和GITEE_USERNAME 为自己账号的信息，再重新配置此项。${Color_Off}"
	git config user.email ${GITEE_EMAIL} && git config user.name ${GITEE_USERNAME} && config_success
}

function gitpush_store_passwd {
	git config --global credential.helper store && config_success
}



echo " "
# -e parameter enable 转义
echo -e "\t${BGreen}【软件安装】${Color_Off}"
echo " "
echo -e "\t【1】proxychains"
echo -e "\t【2】redshit"
echo -e "\t【3】terminator"
echo -e "\t【4】Linux QQ"
echo -e "\t【5】WPS"
echo -e "\t【6】virtual box (for Ubuntu18.04, 19.04 and 18.10) "
echo -e "\t【7】Google Chrome"
echo -e "\t【8】VSCode"
echo -e "\t【9】MATLAB"
echo -e "\t【10】VMware Workstation 15.5 pro"
echo -e "\t【11】teamviewer"
echo -e "\t【12】okular"


echo "  "
echo ""
echo -e "\t${BGreen}【系统配置】${Color_Off}"
echo " "

echo -e "\t【111】git clone 走代理"
echo -e "\t【222】github commit 设置邮箱和用户名"  # email and username have been defined as const at the start of the shell.
echo -e "\t【333】gitee commit 设置邮箱和用户名"  # email and username have been defined as const at the start of the shell.
echo -e "\t【444】设置 gitpush 记住用户名和密码，此项作用是记住push时的用户名和密码，只输入一次即可"

echo ""
echo ""
# -p parameter for the text output.

echo -e  -n "直接输入${BYellow}数字序号${Color_Off}(Ctrl + C 退出)：" 

read index

echo ""

while ! [[ "$index" =~ ^[0-9]+$ ]]
do
	# -n parameter indicates that do not jump to next line
	echo -e -n "${BRed}请输入数字序号："
	read index
done

case ${index} in
	"1")
		proxychains
		;;
	"2")
		redshift
		;;
	"3")
		terminator
		;;

	"4")
		linuxqq
		;;
	"5")
		wps
		;;
	"6")
		vbox
		;;
	"7")
		chrome
		;;
	"8")
		vscode
		;;
	"9")
		matlab
		;;
	"10")
		vmware
		;;
	"11")
		teamviewer
		;;
	"12")
		okular
		;;



	"111")
		gitproxy
		;;
	"222")
		github_config
		;;
	"333")
		gitee_config
		;;
	"444")
		gitpush_store_passwd
		;;

	*)
		echo "请输入屏幕上指定的序号"
		;;
esac



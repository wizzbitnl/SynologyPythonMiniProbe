## Synology Python Mini Probe
The Python Mini Probe is a PRTG probe which runs on linux systems. This repository contains a modified version to run it on a Synology device.

### Info:

```
/PythonMiniProbe: clone of github.com/PaesslerAG/PythonMiniProbe.git
/scripts: Scripts for installing
	/installer:
		- Installs PythonMiniProbe in a virtualenv
		- Does pip install...
       	- Generates UUID for probe
		- Creates probe.conf with details from install wizard
	/WIZARD_UIFILES: Install wizard
	/INFO: Package metadata and icons (base64)
/dist: Installation files (.spk)
```

### Create Synology package (.spk):

Clone this repo:
```
git clone https://github.com/wizzbitnl/SynologyPythonMiniProbe.git
cd SynologyPythonMiniProbe
git submodule update --init --recursive
```


Run **make.sh**, this script does:

```
Converts App icon (icon350x250.png) to several dimensions and adds it as base64 to INFO.

Creates package metadata:
	INFO.tpl -> INFO
	
Creates tar files:
	/PythonMiniProbe -> package.tgz
    package.tgz scripts WIZARD_UIFILES INFO -> PythonMiniProbe-1.0.0.spk

```
The resulting installation file will be in **dist**

### Installing on the Synology device:

1. In the Package manager, change the **Trust Level** to **Any publisher**
2. Add Synocommunity repository - https://synocommunity.com
3. Install **Python 2.7.x**  from Synocommunity (**not Python 3**)
4. Install SynologyPythonMiniProbe-x.x.x.spk and run it
5. Set Package manager **Trust Level** back to previous setting

6. After installation APPROVE the new probe in PRTG
7. After approving, start the PythonMiniProbe on the Synology device


### Troubleshooting:
```
Set debug to True in:
/usr/local/PythonMiniProbe/miniprobe/probe.conf

Restart probe:
/var/packages/PythonMiniProbe/scripts/start-stop-status stop
/var/packages/PythonMiniProbe/scripts/start-stop-status start

Check logs:
/usr/local/PythonMiniProbe/miniprobe/logs/probe.log
/var/log/synopkg.log
```
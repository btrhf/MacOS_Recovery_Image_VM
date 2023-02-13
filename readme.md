## MacOS VMware Recovery Creator
***

This script allows you to create a virtual hard disk (vmdk) with MacOS recovery in it. Which allows you to install MacOS on your Virtual Machine.

Here in example I am using VMware Workstation 17.

How to create MacOS Virtual Machine with MacOS Recovery Image

[How To Use](#prerequisites)

#### Prerequisites
***

1. Download and install <a href="https://qemu.weilnetz.de/w64/" target="_blank">QEMU</a>.

2. Download and install <a href="https://www.python.org/downloads/" target="_blank">Python</a>.

3. Download Latest version of <a href="https://github.com/acidanthera/OpenCorePkg/releases" target="_blank">OpenCorePkg by acidanthera</a> (Download Latest **OpenCore-x.x.x-RELEASE.zip** file).
![](https://www.dropbox.com/s/0ga3xt9znq7b65n/d1.png?dl=0)

4. Download <a href="http://vu1tur.eu.org/tools/dmg2img-1.6.7-win32.zip" target="_blank">dmg2img</a>.

5. Download Latest version of <a href="https://github.com/DrDonk/unlocker/releases" target="_blank">Unlocker By DrDonk</a> (Download Latest **unlockerxxx.zip** file).
 
6. Create 3 folders like so.
![](https://www.dropbox.com/s/ccva2uw716ro7sr/2.png?dl=0)

7. extract **OpenCorePkg**, **dmg2img** and **Unlocker** into newly created folders.

8. Download my script from release and paste it into the same folder. It should look something link this.
![](https://www.dropbox.com/s/qzv2017fp1l7ops/3.png?dl=0)

#### How to use
***

1. Run the Batch file **GetRecovery.bat**.
![](https://www.dropbox.com/s/9mrhfxhgq24rqje/1.png?dl=0)

2. Enter your system **Intel** or **AMD**.
![](https://www.dropbox.com/s/8taomlxa7vnh3op/2.png?dl=0)

3. Select the version of OS you want.
![](https://www.dropbox.com/s/gfu68pohhxqjrr2/3.png?dl=0)

4. The script will check for availability of **QEMU** and **Python**.
![](https://www.dropbox.com/s/93pfh4irq6n0epe/4.png?dl=0)

5. The script will download necessary files.
![](https://www.dropbox.com/s/aoebscge7u8d9ie/5.png?dl=0)

6. Convert the files for you.
![](https://www.dropbox.com/s/wds2anhv0pc8ppi/6.png?dl=0)

7. And also generate a text file which will be used to edit vmx file while creating a Virtual Machine.
![](https://www.dropbox.com/s/db3drkiypwcskww/7.png?dl=0)

8. And at last **press any key to exit**. 
![](https://www.dropbox.com/s/trvvz0q1jcjwdcn/8.png?dl=0)

9. Recovery file and Text file will be generated in the same folder.
![](https://www.dropbox.com/s/oax2pth0kpribs0/9.png?dl=0)
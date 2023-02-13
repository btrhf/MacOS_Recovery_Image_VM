## MacOS VMware Recovery Creator
***
Author and Developer : Krish Kansara

This script allows you to create a virtual hard disk (vmdk) with MacOS recovery in it. Which allows you to install MacOS on your Virtual Machine.

Here in example I am using VMware Workstation 17.

How to create MacOS Virtual Machine with MacOS Recovery Image

[How To Use](#prerequisites)

#### Prerequisites
***

1. Download and install <a href="https://qemu.weilnetz.de/w64/" target="_blank">QEMU</a>.

2. Download and install <a href="https://www.python.org/downloads/" target="_blank">Python</a>.

3. Download Latest version of <a href="https://github.com/acidanthera/OpenCorePkg/releases" target="_blank">OpenCorePkg by acidanthera</a> (Download Latest **OpenCore-x.x.x-RELEASE.zip** file).

[![d1.png](https://i.postimg.cc/Y09zGcnX/d1.png)](https://postimg.cc/62kvgPNR)

4. Download <a href="http://vu1tur.eu.org/tools/dmg2img-1.6.7-win32.zip" target="_blank">dmg2img</a>.

5. Download Latest version of <a href="https://github.com/DrDonk/unlocker/releases" target="_blank">Unlocker By DrDonk</a> (Download Latest **unlockerxxx.zip** file).
 
6. Create 3 named **dmg2img**, **OpenCore** and **unlocker** folders like so.

[![p1.png](https://i.postimg.cc/zvg3P0Vz/p1.png)](https://postimg.cc/rRq8DG13)

7. extract **OpenCorePkg**, **dmg2img** and **Unlocker** into newly created folders.

8. Download <a href="https://github.com/btrhf/MacOS_Recovery_Image_VM/archive/refs/geads/main.zip">my script</a> from release and paste it into the same folder. It should look something link this.
![](https://www.dropbox.com/s/qzv2017fp1l7ops/3.png?dl=0)

#### How to use
***

1. Run the Batch file **GetRecovery.bat**.

[![n1.png](https://i.postimg.cc/L64srth3/n1.png)](https://postimg.cc/dDXvCT2h)

2. Enter your system **Intel** or **AMD**.

[![n2.png](https://i.postimg.cc/02H9FhT9/n2.png)](https://postimg.cc/7f0vTtPR)

3. Select the version of OS you want.

[![n3.png](https://i.postimg.cc/L67MNLPX/n3.png)](https://postimg.cc/vcWjm13F)

4. The script will check for availability of **QEMU** and **Python**.

[![n4.png](https://i.postimg.cc/QCtRqdx1/n4.png)](https://postimg.cc/JDf6rmXz)

5. The script will download necessary files.

[![n5.png](https://i.postimg.cc/NjhzK4T1/n5.png)](https://postimg.cc/F7ZZq0TR)

6. Convert the files for you.

[![n6.png](https://i.postimg.cc/Y255FMBG/n6.png)](https://postimg.cc/F1xC5tRN)

7. And also generate a text file which will be used to edit vmx file while creating a Virtual Machine.

[![n7.png](https://i.postimg.cc/gj8BsLbw/n7.png)](https://postimg.cc/jnqXd55K)

8. And at last **press any key to exit**. 

[![n8.png](https://i.postimg.cc/Y0HxpXT9/n8.png)](https://postimg.cc/tZB6kzqQ)

9. Recovery file and Text file will be generated in the same folder.

[![n9.png](https://i.postimg.cc/bJXxTCyT/n9.png)](https://postimg.cc/FfZkFxJd)

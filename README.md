# CeSviMa magerit first steps tutorial
## Table of contents
1. [Steps to request access for CeSVima](#steps-to-request-access-for-cesvima)

    1.1. [Go to CeSVima webpage](#step-1---acces-cesvima-webpage)

    1.2. [Access the Form](#step-2---access-the-form)

    1.3. [E-mail received](#step-3---e-mail-received)

2. [Magerit walkthrough](#magerit-walkthrough)

    2.1. [Add magerit to your ssh aliases](#add-magerit-to-your-ssh-aliases-in-sshconfig)

    2.2. [Generate ssh key on your computer](#generate-ssh-key-on-your-computer)

    2.3. [Access the HPC using the ssh magerit command](#now-you-can-access-the-hpc-using-the-ssh-magerit-command)

    2.4. [To list currently loaded modules](#to-list-currently-loaded-modules)

    2.5. [To list all the available modules to install](#to-list-all-the-available-modules-to-install)

    2.6. [To list all available modules of a given framework](#to-list-all-available-modules-of-a-given-framework-run-the-command)

    2.7. [To restart your environment](#to-restart-your-environment)

3. [Launch a test program](#launch-a-test-program)

    3.1. [Clone the following repository](#1-clone-the-following-repository)

    3.2. [Open probe_magerit.sh. You should see the following](#2-open-probe_mageritsh-you-should-see-the-following)

    3.3. [Access the venv using](#3-access-the-venv-using)

    3.4. [Run the following command to install the required dependencies](#4-run-the-following-command-to-install-the-required-dependencies)

    3.5. [Run the following command to run the script](#5-run-the-following-command-to-run-the-script)

    3.6. [Check if the script has been queued](#6-check-if-the-script-has-been-queued)

    3.7. [Check the output of the script](#7-check-the-output-of-the-script)

## Steps to request access for CeSVima

### STEP 1 - Acces CeSVima webpage
Refer to the following [link](https://www.cesvima.upm.es/services/hpc/magerit). Hopefully you will see the following page:
![image 1](src/img/image1.png)


### STEP 2 - Access the Form
Click on the **Solicitud** button.
Fill with all the corresponding information about your supervisor, the department and yourself.
Take into account that for your supervisor information just the email is mandatory and for the address use the one of the university (Av. Complutense, 30. 28040).
The information corresponding to the department is presented below. 
![image 2](src/img/image2.png)
 

**NOTE**:
If you are a PhD student, fill project data with your PhD thesis information(Thesis title, overview of the topic and so on...). 

**NOTE 2**:
Maximum project duration is up to 2 years.
Therefore, select from the current day plus 2 years.

### STEP 3 - E-mail received

After a few days, you will receive an email similar to the one in the figure below with your username and password.
![image 3](src/img/image3.png)

## Magerit walkthrough

Since the given password is difficult to remember, it is possible to modify it following the steps provided in the email attached to previous section.
However, for an easier access without using the password we recommend to perform the following steps (ssh):

### **Add magerit to your ssh aliases** in .ssh/config
![image 4](src/img/image4.png)

### Generate **ssh key on your computer**
Run the following command:
``ssh-keygen``
(**NOTE**: For further information i.e. specify filename or the key algorithm refer to [this tutorial](https://www.ssh.com/academy/ssh/keygen).)

### Now you can **access** the HPC using the ``ssh magerit`` command.
![image 5](src/img/image5.png)
Here you have accessed an interactive node, which is not used for computation, but just to interact with the really powerful nodes.
The folders are shared across nodes.
The following folders are available:

* **Project**: folder with shared data for people within your project (if you belong to any).
In case of being related with your thesis, you will be the only user of it.

* **Scratch**: folder to store temporary files.

* **User**: folder to store personal files.

For more information refer to the [storage documentation](https://docs.cesvima.upm.es/magerit/magerit3/#almacenamiento).

There is 1TB storage for the whole project (/home/`)`

![image 6](src/img/image6.png)

### **To list currently loaded modules:**
```bash
modules list
```
![image 7](src/img/image7.png)

### **To list all the available modules to install:**
```bash
module avail
```
![image 8](src/img/image8.png)



### **To list all available modules of a given framework run the command:**
```bash
 module spider <framework-to-list>
```
Some examples are presented below:
![image 9](src/img/image9.png)

### **To restart your environment**
You may also consider restarting your environment before loading any module. That can be done directly using the following combination of instructions. The **module load** command will be executed after **module purge** which unloads all modules loaded in your environment.

```bash
 module purge & module load <module-to-load>
```

![image 10](src/img/image10.png)

**IMPORTANT NOTE:** There are errors when loading <span style="color:red">**Python3.11**</span> so please avoid using it. For instance, you might not be able to run pip install commands. For now, <span style="color:green">**Python3.10**</span> is the latest stable version available.

As commented, interactive nodes (where our commands will be executed) do not have a GPU associated. Therefore, **nvidia-smi** command will prompt the following:

```bash
nvidia-smi
```

![image 11](src/img/image11.png)

Additionally, it is possible to directly install modules using pip or any other apart from those listed using previous commands. In our case, the remaining install commands will be executed directly in those nodes specified for computation as it will be shown later in [Launch a test program](#launch-a-test-program) section.


However, if you experience problems directly installing a module using pip after loading the corresponding module, you may consider restarting your evironment and loading a different Python version. An exampple of the error you may get is presented below:


![image 12](src/img/image12.png)


## **Launch a test program**



For this section, usage of VSCode for accessing **magerit** is recommended.

### 1. Clone the following repository:
```bash
    git clone 
```
![image 13](src/img/image13.png)

### 2. Open probe\_magerit.sh. You should see the following:

![image 14](src/img/image14.png)


**NOTE:** Slurm is used for launching all the commands that will be sent to the computation nodes. Slurm reads commands in the way presented above, beginning with “#” (i.e. #sbatch). Therefore, although they will appear as comments, they will work.

Before running any code, open a terminal and go to the directory where you have cloned the repository. Create a virtual environment to install the required packages for this demo:

```bash
python -m venv venv
```

![image 15](src/img/image15.png)

**NOTE:** python must have been loaded prior to running this command. You can check it by running [“module list”](#to-list-currently-loaded-modules) command.

The steps presented from this point on will be executed when launching **probe_magerit.sh**. You can try to run them on a terminal on your own but you may not have the required permissions to do so.

### 3. Access the venv using:

```bash
source venv/bin/activate
```

### 4. Run the following command to install the required dependencies:

```bash
pip install -r requirements.txt
```

### 5. Run the following command to run the script:


In order to run python commands, as presented at the end of the script, you should include “srun”. A general example is provided:

```bash
srun python python_file.py --optional_arguments
```

Open **probe\_magerit.py**, you should see the following:

![image 16](src/img/image16.png)

To run the script, execute the following command:

```bash
srun python probe_magerit.py
```

### 6. Check if the script has been queued:

```bash
squeue
```
In the following image, you can see that the script has been queued and is waiting until it can be processed.

![image 17](src/img/image17.png)

Once it enters in the running state, you should see the following:

![image 18](src/img/image18.png)

### 7. Check the output of the script:

Once the script has finished, you can check the output in the file **output.txt**.

```bash
# List directories
ls
# Go to logs directory
cd logs/
# Print the output of the script in the terminal
cat output.out
```

At first you should see all the requirements installation and other information related to different processes carried out by the script.

![image 19](src/img/image19.png)

In the end, you should be able to see the output of the script in the terminal with all the relevant information which should be similar to the following:

![image 20](src/img/image20.png)



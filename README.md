# CeSviMa magerit first steps tutorial

## Steps to request access for CeSVima



Refer to the following [link](https://www.cesvima.upm.es/services/hpc/magerit).



Click on the “Solicitud” button



Fill with all the corresponding information about your supervisor, the department and yourself. Also consider:

For your supervisor information just the email is mandatory and for the address use the one of the university (Av. Complutense, 30. 28040)

The information corresponding to the department is presented below. 











NOTE: Fill project data with your PhD thesis information. (Thesis title, overview of the topic and so on...). 

NOTE 2: Maximum project duration is up to 2 years. Therefore, select from the current day plus 2 years.



E-mail received

After a few days, you will receive an email similar to the one in the figure below with your username and password. 





Guide to use CeSVima













Steps to use cesvima

Since the given password is difficult to remember, it is possible to modify it following the steps provided in the email attached to previous section. However, for an easier access without using the password we recommend to perform the following steps (ssh):

Add ssh key to .ssh/config







Generate ssh key to your computer

Run the following command:

ssh-keygen

NOTE: For further information i.e. specify filename or the key algorithm refer to:





ssh magerit



Here you have accessed an interactive node, which is not used for computation, but just to interact with the really powerful nodes.

The folders are shared across nodes.

Storage docs: 



Project: folder with shared data for people within your project (if you belong to any). In case of being related with your thesis, you will be the only user of it.

Scratch: folder to store temporary files.

V598630: folder to store personal files.





There is 1TB storage for the whole project (/home/`)`





Available modules to install:





To list all available modules of a given framework run the command:

 module spider 

Some examples are presented below:








As commented, interactive nodes do not have a GPU associated. Therefore, nvidia-smi command will show the below prompt. 





Additionally, it is not possible to directly install anything apart from those things listed using module in these nodes. Other installations will be installed in those specified for computation.







Launch a test program



For this section, usage of VSCode for accessing magerit is recommended.

Clone the following repository:

git clone 





Open probe\_magerit.sh. You should see the following:



 

NOTE: Slurm is used for launching all the commands that will be sent to the computation nodes. Slurm reads commands in the way presented above, beginning with “#” (i.e. #sbatch) although they will appear as comments.





Create a virtual environment to install the required packages:

python -m venv venv

NOTE: python must have been loaded prior to run this command. You can check it via running “module list” command.

Access the venv using:

source venv/bin/activate

Run the following command to install the required dependencies:

pip install -r requirements.txt

In order to run python commands, as presented at the end of the script, you should include “srun”. An example is provided:

“srun python python\_file.py --optional\_arguments”

Open probe\_magerit.py and you should see the following:





![Image 1](/mnt/data/output_markdown/image1.png)

![Image 2](/mnt/data/output_markdown/image2.png)

![Image 3](/mnt/data/output_markdown/image3.png)

![Image 4](/mnt/data/output_markdown/image4.png)

![Image 5](/mnt/data/output_markdown/image5.png)

![Image 6](/mnt/data/output_markdown/image6.png)

![Image 7](/mnt/data/output_markdown/image7.png)

![Image 8](/mnt/data/output_markdown/image8.png)

![Image 9](/mnt/data/output_markdown/image9.png)

![Image 10](/mnt/data/output_markdown/image10.png)

![Image 11](/mnt/data/output_markdown/image11.png)

![Image 12](/mnt/data/output_markdown/image12.png)

![Image 13](/mnt/data/output_markdown/image13.png)

![Image 14](/mnt/data/output_markdown/image14.png)

![Image 15](/mnt/data/output_markdown/image15.png)

![Image 16](/mnt/data/output_markdown/image16.png)


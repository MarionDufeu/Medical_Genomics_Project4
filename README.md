# Medical_Genomics_Project4

Welcome to our github repository for Project4 of the medical genomics course at INSA Lyon!

Before using our code, please download :
 
- Kraken datasets on https://drive.google.com/file/d/1QYn5lDWjvhtIWCrwmzDc_1fy8ANrXWz1/view?usp=sharing

- the viral references from the ViFi repository on https://github.com/sara-javadzadeh/ViFi

- the human reference on https://drive.google.com/file/d/1XBZbwgcV1n2AWWAyt2RWfSKKxzssRFBo/view?usp=share_link

Save them all where you clone this github directory.

Then open your terminal, go to your github directory and do 
- docker pull sarajava/fastvifi

For now, you have to change the path where you put your files by hand in the code, and precise what fasta files and what virus you want to do the analysis with

You can run the code now writing:

- nextflow run pipeline_V1.nf

Enjoy!

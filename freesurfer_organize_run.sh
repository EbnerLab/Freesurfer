 
#!/bin/bash

#organizes file directories, prepares files for preprocessing, and then pushes freesurfer job up through slurm
#for use on server with slurm sbatch scripts

#list subjects, give filepaths to raw data and scripts directory from current folders
list=<subjects>
filepath=<filepath_to_subjects folder>
scriptdir=<directory_containing_scripts>
t1path=<filepath_to_and_name_of_T1_nifti>

#loops through list of subject files
for a in $list
do

#creates folders within subject directory to move data
	mkdir ${a}
	mkdir ${a}/${a}

#copies needed data from shared folder to working directory
	cp $filepath/${a}/${t1path} ${a}/${a}
	mv ${a}/${a}/*.nii* ${a}/${a}/T1.nii
	cp $scriptdir/freesurfer_slurm_run.sh ${a}

#edit subject number placeholder in slurm script
	sed -i -e 's/INDV_SUBJECTID/${a}/g' ${a}/freesurfer_slurm_run.sh 

#drops down in to subject folder and starts freesurfer run
 	cd ${a}/
		sbatch freesurfer_slurm_run.sh
	cd ../
 	echo "freesurfer run started for " ${a}
done

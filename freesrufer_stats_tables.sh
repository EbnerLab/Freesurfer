#!/bin/bash

#calls module in supercomputer (Hipergator) terminal
#for local use, comment out this section and use local evirnoment variable definition
module load freesurfer/6.0.0

#defines enviroment variable freesurfer_home and sources setup script to run on local machine
#comment out module load above and uncomment the two lines below for local use, otherwise leave as is for supercomputer (Hipergator) use
#export FREESURFER_HOME=/usr/local/freesurfer
#source $FREESURFER_HOME/SetUpFreeSurfer.sh

#designats current directory as suject directory
export SUBJECTS_DIR=./

#list of subjects to extract
list=<subjects>

#creates test file tables of aseg and aparc statistics and for listed subjects
asegstats2table --subjects $list --skip --tablefile wmparc_stats.txt
asegstats2table --subjects $list --meas volume --skip --tablefile aseg_stats.txt
aparcstats2table --subjects $list --hemi lh --meas volume --skip --tablefile aparc_volume_lh.txt
aparcstats2table --subjects $list --hemi lh --meas thickness --skip --tablefile aparc_thickness_lh.txt
aparcstats2table --subjects $list --hemi lh --meas area --skip --tablefile aparc_area_lh.txt
aparcstats2table --subjects $list --hemi lh --meas meancurv --skip --tablefile aparc_meancurv_lh.txt
aparcstats2table --subjects $list --hemi rh --meas volume --skip --tablefile aparc_volume_rh.txt
aparcstats2table --subjects $list --hemi rh --meas thickness --skip --tablefile aparc_thickness_rh.txt
aparcstats2table --subjects $list --hemi rh --meas area --skip --tablefile aparc_area_rh.txt
aparcstats2table --subjects $list --hemi rh --meas meancurv --skip --tablefile aparc_meancurv_rh.txt
aparcstats2table --hemi lh --subjects $list --parc aparc.a2009s --meas volume --skip -t lh.a2009s.volume.txt
aparcstats2table --hemi lh --subjects $list --parc aparc.a2009s --meas thickness --skip -t lh.a2009s.thickness.txt
aparcstats2table --hemi lh --subjects $list --parc aparc.a2009s --meas area --skip -t lh.a2009s.area.txt
aparcstats2table --hemi lh --subjects $list --parc aparc.a2009s --meas meancurv --skip -t lh.a2009s.meancurv.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.a2009s --meas volume --skip -t rh.a2009s.volume.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.a2009s --meas thickness --skip -t rh.a2009s.thickness.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.a2009s --meas area --skip -t rh.a2009s.area.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.a2009s --meas meancurv --skip -t rh.a2009s.meancurv.txt
aparcstats2table --hemi lh --subjects $list --parc BA --meas volume --skip -t lh.BA.volume.txt
aparcstats2table --hemi lh --subjects $list --parc BA --meas thickness --skip -t lh.BA.thickness.txt
aparcstats2table --hemi lh --subjects $list --parc BA --meas area --skip -t lh.BA.area.txt
aparcstats2table --hemi lh --subjects $list --parc BA --meas meancurv --skip -t lh.BA.meancurv.txt
aparcstats2table --hemi rh --subjects $list --parc BA --meas volume --skip -t rh.BA.volume.txt
aparcstats2table --hemi rh --subjects $list --parc BA --meas thickness --skip -t rh.BA.thickness.txt
aparcstats2table --hemi rh --subjects $list --parc BA --meas area --skip -t rh.BA.area.txt
aparcstats2table --hemi rh --subjects $list --parc BA --meas meancurv --skip -t rh.BA.meancurv.txt
quantifyHippocampalSubfields.sh T1 hippocampal_subfields.txt
quantifyBrainstemStructures.sh brainstem_subfields.txt ./

#converts txt files into csv files
sed 's/ \+/,/g' aseg_stats.txt > aseg_stats.csv
sed 's/ \+/,/g' wmparc_stats.txt > wmparc_stats.csv
sed 's/ \+/,/g' aparc_volume_lh.txt > aparc_volume_lh.csv
sed 's/ \+/,/g' aparc_thickness_lh.txt > aparc_thickness_lh.csv
sed 's/ \+/,/g' aparc_area_lh.txt > aparc_area_lh.csv
sed 's/ \+/,/g' aparc_meancurv_lh.txt > aparc_meancurv_lh.csv
sed 's/ \+/,/g' aparc_volume_rh.txt > aparc_volume_rh.csv
sed 's/ \+/,/g' aparc_thickness_rh.txt > aparc_thickness_rh.csv
sed 's/ \+/,/g' aparc_area_rh.txt > aparc_area_rh.csv
sed 's/ \+/,/g' aparc_meancurv_rh.txt > aparc_meancurv_rh.csv
sed 's/ \+/,/g' lh.a2009s.volume.txt > lh.a2009s.volume.csv
sed 's/ \+/,/g' lh.a2009s.thickness.txt > lh.a2009s.thickness.csv
sed 's/ \+/,/g' lh.a2009s.area.txt > lh.a2009s.area.csv
sed 's/ \+/,/g' lh.a2009s.meancurv.txt > lh.a2009s.meancurv.csv
sed 's/ \+/,/g' rh.a2009s.volume.txt > rh.a2009s.volume.csv
sed 's/ \+/,/g' rh.a2009s.thickness.txt > rh.a2009s.thickness.csv
sed 's/ \+/,/g' rh.a2009s.area.txt > rh.a2009s.area.csv
sed 's/ \+/,/g' rh.a2009s.meancurv.txt > rh.a2009s.meancurv.csv
sed 's/ \+/,/g' lh.BA.volume.txt > lh.BA.volume.csv
sed 's/ \+/,/g' lh.BA.thickness.txt > lh.BA.thickness.csv
sed 's/ \+/,/g' lh.BA.area.txt > lh.BA.area.csv
sed 's/ \+/,/g' lh.BA.meancurv.txt > lh.BA.meancurv.csv
sed 's/ \+/,/g' rh.BA.volume.txt > rh.BA.volume.csv
sed 's/ \+/,/g' rh.BA.thickness.txt > rh.BA.thickness.csv
sed 's/ \+/,/g' rh.BA.area.txt > rh.BA.area.csv
sed 's/ \+/,/g' rh.BA.meancurv.txt > rh.BA.meancurv.csv
sed 's/ \+/,/g' hippocampal_subfields.txt > hippocampal_subfields.csv
sed 's/ \+/,/g' brainstem_subfields.txt > brainstem_subfields.csv

#combine .csv files into single file
OutFileName="freesurfer_stats.csv"
i=0
for filename in ./*.csv; do
 if [ "$filename"  != "$OutFileName" ] ;
 then 
   if [[ $i -eq 0 ]] ; then
      head -1  $filename >   $OutFileName
   fi
   tail -n +2  $filename >>  $OutFileName
   i=$(( $i + 1 ))
 fi
done

#cleans and organizes directory by moving old .txt and .csv files into new directories for storage
mkdir stats_files/
mv *.txt stats_files/
mv lh.*.csv stats_files/
mv rh.*.csv stats_files/
mv a*.csv stats_files/
mv wm*.csv stats_files/
mv *_subfields.csv stats_files/

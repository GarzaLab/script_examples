#!/bin/bash

#####################################

# Conversion of DICOM to NIFTI script for the EPI

#####################################

dcmdir=/media/INP_MRI_Backup/projects/INP/conectome_inp/data/dicom
niidir=/media/INP_MRI_Backup/projects/INP/conectome_inp/data/nifti

for subject in AD_104;


do

echo "**************Converting Subject ${subject}*****************"

dcm2nii -n y -g n -o ${niidir}/fmri ${dcmdir}/${subject#???}/epi/IMG*

mv ${niidir}/fmri/FEEPI32chSHCAPSENSE.nii ${niidir}/fmri/${subject}_fmri.nii

echo "***************Subject ${subject} DONE ****************"

done

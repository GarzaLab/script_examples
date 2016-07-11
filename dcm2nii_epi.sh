#!/bin/bash

#####################################

# Conversion of DICOM to NIFTI script for the EPI

#####################################

dcmdir=/media/INP_MRI_Backup/projects/INP/conectome_inp/data/dicom
niidir=/media/INP_MRI_Backup/projects/INP/conectome_inp/data/nifti

for subject in AD_104 HC_105 HC_106 AD_107 AD_108 AD_109 HC_110 HC_110 HC_112 AD_114 HC_115 AD_116 HC_117 AD_120 HC_122 HC_123 AD_124 HC_125 HC_126 AD_127 AD_128 HC_129 HC_130 AD_131 HC_132 HC_133 HC_134;


do

echo "**************Converting Subject ${subject}*****************"

dcm2nii -n y -g n -o ${niidir}/fmri ${dcmdir}/${subject#???}/epi/IMG*

mv ${niidir}/fmri/FEEPI32chSHCAPSENSE.nii ${niidir}/fmri/${subject}_fmri.nii

echo "***************Subject ${subject} DONE ****************"

done

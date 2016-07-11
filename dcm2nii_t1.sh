#!/bin/bash

#####################################

# Conversion of DICOM to NIFTI script for the T1

#####################################

dcmdir=/media/INP_MRI_Backup/projects/INP/conectome_inp/data/dicom
niidir=/media/INP_MRI_Backup/projects/INP/conectome_inp/data/nifti

#for subject in AD_019 AD_020 HC_021 HC_022 AD_023 AD_024 AD_025 AD_026 AD_027 HC_028 HC_029 AD_030 HC_031 HC_032 HC_033 AD_034 HC_036 HC_037 HC_038 HC_039 AD_040 HC_041 HC_042 AD_043 AD_045 AD_046 AD_047; 

#for subject in AD_043 AD_045 AD_046 AD_047 AD_048 HC_049 HC_051 AD_052 AD_053;

for subject in HC_097 HC_098;

do

echo "**************Converting Subject ${subject}*****************"

dcm2nii -n y -g n -r y -o ${niidir}/t1 ${dcmdir}/${subject#???}/t1/IMG*

rm ${niidir}/t1/sT1W3DTFE32channelSENSE.nii
rm ${niidir}/t1/cosT1W3DTFE32channelSENSE.nii
mv ${niidir}/t1/osT1W3DTFE32channelSENSE.nii ${niidir}/t1/${subject}_t1.nii


echo "***************Subject ${subject} DONE ****************"

done

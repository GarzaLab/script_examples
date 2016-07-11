#!/bin/bash

#####################################

# Conversion of DICOM to NIFTI script for the FM_DTI

#####################################

dcmdir=/media/INP_MRI_Backup/projects/INP/conectome_inp/data/dicom
niidir=/media/INP_MRI_Backup/projects/INP/conectome_inp/data/nifti

#for subject in AD_019 AD_020 HC_021 HC_022 AD_023 AD_024 AD_025 AD_026 AD_027 HC_028 HC_029 AD_030 HC_031 HC_032 HC_033 AD_034 HC_036 HC_037 HC_038 HC_039 AD_040 HC_041 HC_042 AD_043 AD_045 AD_046 AD_047; 

for subject in AD_069 AD_070 AD_071 AD_072 AD_073 AD_074 AD_076 AD_080 AD_081 AD_083 AD_091 AD_092 AD_103 HC_075 HC_077 HC_078 HC_082 HC_084 HC_085 HC_086 HC_087 HC_088 HC_093 HC_094 HC_095 HC_097 HC_098 HC_099 HC_100 HC_101 HC_102;

do

echo "**************Converting Subject ${subject}*****************"

dcm2nii -n y -g y -o ${niidir}/fm_dti ${dcmdir}/${subject#???}/fm_dti/IMG*

mv ${niidir}/fm_dti/FMDTI1362SHELLSPASENSE.nii.gz ${niidir}/fm_dti/${subject}_fm_dti.nii.gz
echo ${subject}_fm_dti.nii.gz
mv ${niidir}/fm_dti/FMDTI1362SHELLSPASENSE.bval ${niidir}/fm_dti/${subject}_fm_dti.bval
mv ${niidir}/fm_dti/FMDTI1362SHELLSPASENSE.bvec ${niidir}/fm_dti/${subject}_fm_dti.bvec


echo "***************Subject ${subject} DONE ****************"

done

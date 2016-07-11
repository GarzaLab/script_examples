#!/bin/bash

#####################################

# Conversion of DICOM to NIFTI script for the DTI

#####################################

dcmdir=/media/INP_MRI_Backup/projects/INP/conectome_inp/data/dicom
niidir=/media/INP_MRI_Backup/projects/INP/conectome_inp/data/nifti

#for subject in AD_008 AD_009 AD_010 AD_011 AD_012 AD_013 AD_014 AD_015 AD_016 AD_017 AD_018 AD_019 AD_020 HC_021 HC_022 AD_023 AD_024 AD_025 AD_026 AD_027 HC_028 HC_029 AD_030 HC_031 HC_032 HC_033 AD_034 AD_035 HC_036 HC_037 HC_038 HC_039 AD_040 HC_041 HC_042 AD_043 HC_044 AD_045 AD_046 AD_047 AD_048 HC_049 HC_050 HC_051 AD_052 AD_053 HC_054;

for subject in AD_056 AD_057 AD_058 AD_060 AD_061 AD_064 AD_066 AD_067 AD_069 AD_070 AD_071 AD_072 AD_073 AD_074 AD_076 AD_080 AD_081 AD_083 AD_091 AD_092 AD_103 HC_055 HC_059 HC_062 HC_063 HC_065 HC_068 HC_075 HC_077 HC_078 HC_082 HC_084 HC_085 HC_086 HC_087 HC_088 HC_093 HC_094 HC_095 HC_097 HC_098 HC_099 HC_100 HC_101 HC_102;

do

echo "**************Converting Subject ${subject}*****************"

dcm2nii -n y -g y -o ${niidir}/dti ${dcmdir}/${subject#???}/dti/IMG*

mv ${niidir}/dti/DTIopt128SENSE.nii.gz ${niidir}/dti/${subject}_dti.nii.gz
mv ${niidir}/dti/DTIopt128SENSE.bval ${niidir}/dti/${subject}_dti.bval
mv ${niidir}/dti/DTIopt128SENSE.bvec ${niidir}/dti/${subject}_dti.bvec

mv ${niidir}/dti/DTI1362SHELLSAPSENSE.nii.gz ${niidir}/dti/${subject}_dti.nii.gz
mv ${niidir}/dti/DTI1362SHELLSAPSENSE.bval ${niidir}/dti/${subject}_dti.bval
mv ${niidir}/dti/DTI1362SHELLSAPSENSE.bvec ${niidir}/dti/${subject}_dti.bvec


echo "***************Subject ${subject} DONE ****************"

done

#!/bin/bash

#####################################

# Field Mapping using Topup

#####################################

niidir=/media/INP_MRI_Backup/projects/INP/conectome_inp/data/nifti

for subject in AD_002 AD_003 AD_006 AD_008 AD_009 AD_010 AD_011 AD_012 AD_013 AD_014 AD_015 AD_016 AD_017 AD_018 AD_019 AD_020 AD_023 AD_024 AD_025 AD_026 AD_027 AD_030 AD_034 AD_035 AD_040 AD_043 AD_045 AD_046 AD_047 AD_048 AD_052 AD_053 AD_056 AD_057 AD_058 AD_060 AD_061 AD_064 AD_066 AD_067 AD_069 AD_070 AD_071 AD_072 AD_073 AD_074 AD_076 AD_080 AD_081 AD_083 AD_091 AD_092 HC_001 HC_004 HC_005 HC_007 HC_021 HC_022 HC_028 HC_029 HC_031 HC_032 HC_033 HC_036 HC_037 HC_038 HC_039 HC_041 HC_042 HC_044 HC_049 HC_050 HC_051 HC_054 HC_055 HC_059 HC_062 HC_063 HC_065 HC_068 HC_075 HC_077 HC_078 HC_082 HC_084 HC_085 HC_086 HC_087 HC_088 HC_093 HC_094 HC_095 HC_096 HC_097 HC_098 HC_099 HC_100 HC_101 HC_102 AD_103;

do

echo "**************Field Map Subject ${subject}*****************"

fslroi ${niidir}/fmri/${subject}_fmri.nii ${niidir}/fieldmap/${subject}_b0_pa 0 2 
fslroi ${niidir}/fm_fmri/${subject}_fmfmri.nii.gz ${niidir}/fieldmap/${subject}_b0_ap 0 2
fslmerge -t ${niidir}/fieldmap/${subject}_b0_both ${niidir}/fieldmap/${subject}_b0_pa ${niidir}/fieldmap/${subject}_b0_ap
rm ${niidir}/fieldmap/${subject}_b0_pa.nii.gz
rm ${niidir}/fieldmap/${subject}_b0_ap.nii.gz

topup --imain=${niidir}/fieldmap/${subject}_b0_both --datain=${niidir}/acq_param.txt --config=b02b0.cnf --out=${niidir}/fieldmap/${subject}_topup

#applytopup --imain=${niidir}/fmri/${subject}_fmri.nii,${niidir}/fm_fmri/${subject}_fmfmri.nii.gz --inindex=1,2 --datain=${niidir}/acq_param.txt --topup=${subject}_topup -out=${subject}_fmri_fm_corr.nii.gz

done

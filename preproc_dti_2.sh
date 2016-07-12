#!/bin/bash

#####################################

# Preprocessing of DTI data

#####################################

rawdir=/media/INP_MRI_Backup/projects/others/cecilie
niidir=/media/INP_MRI_Backup/projects/others/cecilie/data/nii
ppdir=/media/INP_MRI_Backup/projects/others/cecilie/data/preproc/dti

cat ${rawdir}/scripts/list_2.txt| while read i; 

do 

echo "**************PREPROCESSING Subject ${i}*****************"

echo fslroi ${niidir}/dti/${i}_dti ${niidir}/topup/${i}_AP_blip 0 1
fslroi ${niidir}/dti/${i}_dti ${niidir}/topup/${i}_AP_blip 0 1
echo fslroi ${niidir}/blipdown/${i}_bdown ${niidir}/topup/${i}_PA_blip 0 1
fslroi ${niidir}/blipdown/${i}_bdown ${niidir}/topup/${i}_PA_blip 0 1
echo fslmerge -t ${niidir}/topup/${i}_AP_PA_blips ${niidir}/topup/${i}_AP_blip ${niidir}/topup/${i}_PA_blip
fslmerge -t ${niidir}/topup/${i}_AP_PA_blips ${niidir}/topup/${i}_AP_blip ${niidir}/topup/${i}_PA_blip

echo "**************TOPUP Subject ${i}*****************"

topup --imain=${niidir}/topup/${i}_AP_PA_blips --datain=${rawdir}/scripts/acqparams.txt --config=b02b0.cnf --out=${niidir}/topup/${i}_topup --fout=${niidir}/topup/${i}_field -v

echo fslmaths ${niidir}/topup/${i}_AP_blip -Tmean ${niidir}/topup/${i}_AP_blip
fslmaths ${niidir}/topup/${i}_AP_blip -Tmean ${niidir}/topup/${i}_AP_blip
echo bet ${niidir}/topup/${i}_AP_blip ${niidir}/topup/${i}_bet -m -f 0.2 -c 53 49 36 -R
bet ${niidir}/topup/${i}_AP_blip ${niidir}/topup/${i}_bet -m -f 0.2 -c 53 49 36 -R

echo "**************EDDY Subject ${i}*****************"

eddy --imain=${niidir}/dti/${i}_dti --mask=${niidir}/topup/${i}_bet --index=${rawdir}/scripts/index.txt --acqp=${rawdir}/scripts/acqparams.txt --bvecs=${niidir}/dti/${i}_dti.bvec --bvals=${niidir}/dti/${i}_dti.bval --fwhm=0 --topup=${niidir}/topup/${i}_topup --flm=quadratic --out=${niidir}/topup/${i}_eddy_unwarped -v

# Only for subject 0010 and 0024 that did not have any DTIPA.

#eddy_correct ${niidir}/dti/${i}_dti.nii.gz ${niidir}/topup/${i}_eddy 0

echo "**************Finished Subject ${i}*****************"

done





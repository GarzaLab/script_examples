#!/bin/bash

#####################################

# FDT 

#####################################

rawdir=/media/INP_MRI_Backup/projects/others/cecilie
niidir=/media/INP_MRI_Backup/projects/others/cecilie/data/nii
ppdir=/media/INP_MRI_Backup/projects/others/cecilie/data/preproc/dti
anadir=/media/INP_MRI_Backup/projects/others/cecilie/analysis/dti
tbssdir=/media/INP_MRI_Backup/projects/others/cecilie/analysis/tbss

cat ${rawdir}/scripts/list.txt| while read i; 

do 

echo "**************FDT Subject ${i}*****************"

dtifit -k ${ppdir}/${i}_pp.nii.gz -o ${anadir}/${i}_fdt -m ${niidir}/topup/${i}_bet.nii.gz -r ${niidir}/dti/${i}_dti.bvec -b ${niidir}/dti/${i}_dti.bval

echo "**************Finished FDT Subject ${i}*****************"

done

#cp -v ${anadir}/*_fdt_FA.nii.gz ${tbss}/

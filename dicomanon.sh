#!/bin/bash

#######################################################

# SCRIPT FOR DICOM Anonymize

# Written by Eduardo Garza-Villarreal, Instituto Nacional de Psiquiatría, Mexico.

#######################################################

# Must be run inside dicom_anon folder.

root=/media/INP_MRI_Backup/projects/INP/conectome_inp/data
scripts=/media/INP_MRI_Backup/projects/INP/conectome_inp/scripts
cat ${scripts}/list.txt | while read i; 

do 

## Create Directories for Subjects
echo "Creating Subject ${i}"

if [ ! -d ${root}/dicom_anon/${i} ] ; then
mkdir -p ${root}/dicom_anon/${i};
fi

#Create Directories for sequences
echo "Creating Subdirectories for Subject ${i}"

if [ -d ${root}/dicom/${i}/t1 ] ; then
mkdir -p ${root}/dicom_anon/${i}/t1;
fi

if [ -d ${root}/dicom/${i}/dti ] ; then
mkdir -p ${root}/dicom_anon/${i}/dti;
fi

if [ -d ${root}/dicom/${i}/epi ] ; then
mkdir -p ${root}/dicom_anon/${i}/epi;
fi

if [ -d ${root}/dicom/${i}/fm_epi ] ; then
mkdir -p ${root}/dicom_anon/${i}/fm_epi;
fi

if [ -d ${root}/dicom/${i}/fm_dti ] ; then
mkdir -p ${root}/dicom_anon/${i}/fm_dti;
fi

if [ -d ${root}/dicom/${i}/kurtosis_ir ] ; then
mkdir -p ${root}/dicom_anon/${i}/kurtosis_ir;
fi

if [ -d ${root}/dicom/${i}/fm_kurtosis_ir ] ; then
mkdir -p ${root}/dicom_anon/${i}/fm_kurtosis_ir;
fi

if [ -d ${root}/dicom/${i}/kurtosis ] ; then
mkdir -p ${root}/dicom_anon/${i}/kurtosis;
fi

#Run DICOM_ANON

cd /home/egarza/MRI/apps/dicom-anon

echo "Anonymizing Subject ${i}"

if [ -d ${root}/dicom/${i}/t1 ] ; then
python dicom_anon.py ${root}/dicom/${i}/t1 ${root}/dicom_anon/${i}/t1;
fi

if [ -d ${root}/dicom/${i}/epi ] ; then
python dicom_anon.py ${root}/dicom/${i}/epi ${root}/dicom_anon/${i}/epi;
fi

if [ -d ${root}/dicom/${i}/dti ] ; then
python dicom_anon.py ${root}/dicom/${i}/dti ${root}/dicom_anon/${i}/dti;
fi

if [ -d ${root}/dicom/${i}/fm_epi ] ; then
python dicom_anon.py ${root}/dicom/${i}/fm_epi ${root}/dicom_anon/${i}/fm_epi;
fi

if [ -d ${root}/dicom/${i}/fm_dti ] ; then
python dicom_anon.py ${root}/dicom/${i}/fm_dti ${root}/dicom_anon/${i}/fm_dti;
fi

if [ -d ${root}/dicom/${i}/kurtosis_ir ] ; then
python dicom_anon.py ${root}/dicom/${i}/kurtosis_ir ${root}/dicom_anon/${i}/kurtosis_ir;
fi

if [ -d ${root}/dicom/${i}/fm_kurtosis_ir ] ; then
python dicom_anon.py ${root}/dicom/${i}/fm_kurtosis_ir ${root}/dicom_anon/${i}/fm_kurtosis_ir;
fi

if [ -d ${root}/dicom/${i}/kurtosis ] ; then
python dicom_anon.py ${root}/dicom/${i}/kurtosis ${root}/dicom_anon/${i}/kurtosis;
fi

echo "DONE Subject ${i}"

done


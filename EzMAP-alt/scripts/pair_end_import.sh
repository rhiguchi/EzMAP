echo "##### EzMAP ########"
echo "#### Importing Paired-end reads #####"

cd ~/Desktop/EzMAP_Analysis

mkdir EzMAP_Paired_End_Read_Analysis



time qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path Bacteria_manifest \
  --output-path EzMAP_Paired_End_Read_Analysis/paired-end-demux.qza \
  --input-format PairedEndFastqManifestPhred64V2


cd EzMAP_Paired_End_Read_Analysis



time qiime demux summarize \
  --i-data paired-end-demux.qza \
  --o-visualization paired-end-demux.qzv


echo "#### Import success ####"


 
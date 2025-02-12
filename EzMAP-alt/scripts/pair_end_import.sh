echo "##### EzMAP ########"
echo "#### Importing Paired-end reads #####"

cd ~/Desktop/EzMAP_Analysis

mkdir EzMAP_Paired_End_Read_Analysis


infile="$HOME/Desktop/EzMAP_config.txt"

v2=$(head -n 1 "$infile")

v3=$(sed -n '2{p;q;}' "$infile")

echo "$v2"
echo "$v3"

time qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path "$v3" \
  --output-path EzMAP_Paired_End_Read_Analysis/paired-end-demux.qza \
  --input-format PairedEndFastqManifestPhred64V2


cd EzMAP_Paired_End_Read_Analysis



time qiime demux summarize \
  --i-data paired-end-demux.qza \
  --o-visualization paired-end-demux.qzv


echo "#### Import success ####"


 
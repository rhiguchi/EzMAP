echo "##### EzMAP ########"
echo "#### SILVA Taxonomy Classification  #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

mkdir -p Taxonomy/SILVA/qza/Deblur
mkdir -p Taxonomy/SILVA/qzv/Deblur

time qiime feature-classifier classify-sklearn \
  --i-classifier ~/Desktop/EzMAP/src/db/silva-classifier.qza \
  --i-reads Deblur/qza/paired-end-rep-seqs-deblur.qza \
  --o-classification Taxonomy/SILVA/qza/Deblur/paired-end-SILVA-taxonomy-deblur.qza

time qiime metadata tabulate \
  --m-input-file Taxonomy/SILVA/qza/Deblur/paired-end-SILVA-taxonomy-deblur.qza \
  --o-visualization Taxonomy/SILVA/qzv/Deblur/paired-end-SILVA-taxonomy-deblur.qzv

echo "#### done ####"


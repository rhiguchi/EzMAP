echo "##### EzMAP ########"
echo "#### UNITE Taxonomy Classification  #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

mkdir Taxonomy
mkdir Taxonomy/UNITE
mkdir Taxonomy/UNITE/qza/Deblur
mkdir Taxonomy/UNITE/qzv/Deblur

time qiime feature-classifier classify-sklearn \
  --i-classifier ~/Desktop/EzMAP/src/db/UNITE-classifier.qza \
  --i-reads Deblur/qza/paired-end-rep-seqs-deblur.qza \
  --o-classification Taxonomy/UNITE/qza/Deblur/paired-end-UNITE-taxonomy-deblur.qza

time qiime metadata tabulate \
  --m-input-file Taxonomy/UNITE/qza/Deblur/paired-end-UNITE-taxonomy-deblur.qza \
  --o-visualization Taxonomy/UNITE/qzv/Deblur/paired-end-UNITE-taxonomy-deblur.qzv

echo "#### done ####"


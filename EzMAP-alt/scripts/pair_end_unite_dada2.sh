echo "##### EzMAP ########"
echo "#### UNITE Taxonomy Classification  #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

mkdir Taxonomy
mkdir Taxonomy/UNITE
mkdir Taxonomy/UNITE/qza/DADA2
mkdir Taxonomy/UNITE/qzv/DADA2

time qiime feature-classifier classify-sklearn \
  --i-classifier ~/Desktop/EzMAP/src/db/UNITE-classifier.qza \
  --i-reads DADA2/qza/paired-end-rep-seqs-dada2.qza \
  --o-classification Taxonomy/UNITE/qza/DADA2/paired-end-UNITE-taxonomy-dada2.qza

time qiime metadata tabulate \
  --m-input-file Taxonomy/UNITE/qza/DADA2/paired-end-UNITE-taxonomy-dada2.qza \
  --o-visualization Taxonomy/UNITE/qzv/DADA2/paired-end-UNITE-taxonomy-dada2.qzv

echo "#### done ####"

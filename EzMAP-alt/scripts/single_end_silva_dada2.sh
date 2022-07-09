echo "##### EzMAP ########"
echo "#### SILVA Taxonomy Classification  #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Single_End_Read_Analysis

mkdir Taxonomy
mkdir Taxonomy/SILVA
mkdir Taxonomy/SILVA/qza/DADA2
mkdir Taxonomy/SILVA/qzv/DADA2

time qiime feature-classifier classify-sklearn \
  --i-classifier ~/Desktop/EzMAP/src/db/silva-classifier.qza \
  --i-reads DADA2/qza/single-end-rep-seqs-dada2.qza \
  --o-classification Taxonomy/SILVA/qza/DADA2/single-end-SILVA-taxonomy-dada2.qza

time qiime metadata tabulate \
  --m-input-file Taxonomy/SILVA/qza/DADA2/single-end-SILVA-taxonomy-dada2.qza \
  --o-visualization Taxonomy/SILVA/qzv/DADA2/single-end-SILVA-taxonomy-dada2.qzv

echo "#### done ####"

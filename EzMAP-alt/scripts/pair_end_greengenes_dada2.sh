echo "##### EzMAP ########"
echo "#### Greengenes Taxonomy Classification  #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

mkdir -p Taxonomy/Greengenes/qza/DADA2
mkdir -p Taxonomy/Greengenes/qzv/DADA2

time qiime feature-classifier classify-sklearn \
  --i-classifier ~/Desktop/EzMAP/src/db/gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads DADA2/qza/paired-end-rep-seqs-dada2.qza \
  --o-classification Taxonomy/Greengenes/qza/DADA2/paired-end-greengenes-taxonomy-dada2.qza

time qiime metadata tabulate \
  --m-input-file Taxonomy/Greengenes/qza/DADA2/paired-end-greengenes-taxonomy-dada2.qza \
  --o-visualization Taxonomy/Greengenes/qzv/DADA2/paired-end-greengenes-taxonomy-dada2.qzv

echo "#### done ####"

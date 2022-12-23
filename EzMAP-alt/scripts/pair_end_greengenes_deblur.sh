echo "##### EzMAP ########"
echo "#### Greengenes Taxonomy Classification  #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

mkdir Taxonomy
mkdir Taxonomy/Greengenes
mkdir Taxonomy/Greengenes/qza/Deblur
mkdir Taxonomy/Greengenes/qzv/Deblur

time qiime feature-classifier classify-sklearn \
  --i-classifier ~/Desktop/EzMAP/src/db/gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads Deblur/qza/paired-end-rep-seqs-deblur.qza \
  --o-classification Taxonomy/Greengenes/qza/Deblur/paired-end-greengenes-taxonomy-deblur.qza

time qiime metadata tabulate \
  --m-input-file Taxonomy/Greengenes/qza/Deblur/paired-end-greengenes-taxonomy-deblur.qza \
  --o-visualization Taxonomy/Greengenes/qzv/Deblur/paired-end-greengenes-taxonomy-deblur.qzv

echo "#### done ####"


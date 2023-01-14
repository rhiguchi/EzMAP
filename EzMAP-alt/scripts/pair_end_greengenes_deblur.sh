echo "##### EzMAP ########"
echo "#### Greengenes Taxonomy Classification  #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

QZA_OUTPUT="Taxonomy/Greengenes/qza/Deblur"

mkdir -p "$QZA_OUTPUT"
mkdir -p Taxonomy/Greengenes/qzv/Deblur

time qiime feature-classifier classify-sklearn \
  --i-classifier ~/Desktop/EzMAP/src/db/gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads Deblur/qza/paired-end-rep-seqs-deblur.qza \
  --o-classification "$QZA_OUTPUT/paired-end-greengenes-taxonomy-deblur.qza"

time qiime metadata tabulate \
  --m-input-file "$QZA_OUTPUT/paired-end-greengenes-taxonomy-deblur.qza" \
  --o-visualization Taxonomy/Greengenes/qzv/Deblur/paired-end-greengenes-taxonomy-deblur.qzv

echo "#### done ####"


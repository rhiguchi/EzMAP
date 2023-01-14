echo "##### EzMAP ########"
echo "#### Greengenes Taxonomy Classification  #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

QZA_OUTPUT="Taxonomy/Greengenes/qza/Deblur"
QZV_OUTPUT="Taxonomy/Greengenes/qzv/Deblur"

mkdir -p "$QZA_OUTPUT"
mkdir -p "$QZV_OUTPUT"

TAXONOMY_QZA="$QZA_OUTPUT/paired-end-greengenes-taxonomy-deblur.qza"

time qiime feature-classifier classify-sklearn \
  --i-classifier ~/Desktop/EzMAP/src/db/gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads Deblur/qza/paired-end-rep-seqs-deblur.qza \
  --o-classification "$TAXONOMY_QZA"

time qiime metadata tabulate \
  --m-input-file "$TAXONOMY_QZA" \
  --o-visualization "$QZV_OUTPUT/paired-end-greengenes-taxonomy-deblur.qzv"

echo "#### done ####"


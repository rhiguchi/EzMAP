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


echo "#### Exporting ####"

CONFIG_FILE="${HOME}/Desktop/EzMAP_config.txt"
METADATA_FILE=$(sed -n '3p' "$CONFIG_FILE" | tr -d '\n')

EXPORT_OUTPUT="$QZV_OUTPUT/Export"

mkdir -p "$EXPORT_OUTPUT"

qiime tools export \
  --input-path "$TAXONOMY_QZA" \
  --output-path "$EXPORT_OUTPUT"

qiime tools export \
  --input-path Deblur/qza/paired-end-table-deblur.qza \
  --output-path "$EXPORT_OUTPUT"

biom convert \
  -i "$EXPORT_OUTPUT/feature-table.biom" \
  -o "$EXPORT_OUTPUT/feature-table.tsv" \
  --to-tsv

cp "$EXPORT_OUTPUT/feature-table.tsv" feature-table.tsv

biom add-metadata \
  -i "$EXPORT_OUTPUT/feature-table.biom" \
  -o "$EXPORT_OUTPUT/feature-table-with-taxonomy.biom" \
  --observation-metadata-fp $EXPORT_OUTPUT/taxonomy.tsv \
  --observation-header OTUID,taxonomy \
  --sc-separated taxonomy

biom add-metadata \
  -i "$EXPORT_OUTPUT/feature-table-with-taxonomy.biom" \
  -o "$EXPORT_OUTPUT/feature-table-with-taxonomy-meta.biom" \
  --sample-metadata-fp "$METADATA_FILE" \
  --sample-header sample-id,sample-site,cultivar,compartment

cp "$EXPORT_OUTPUT/feature-table-with-taxonomy-meta.biom" table-w-tax-meta.biom

echo "#### done ####"

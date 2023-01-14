echo "##### EzMAP ########"
echo "#### Greengenes Taxonomy Classification  #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

QZA_OUTPUT="Taxonomy/Greengenes/qza/DADA2"

mkdir -p "$QZA_OUTPUT"
mkdir -p Taxonomy/Greengenes/qzv/DADA2

time qiime feature-classifier classify-sklearn \
  --i-classifier ~/Desktop/EzMAP/src/db/gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads DADA2/qza/paired-end-rep-seqs-dada2.qza \
  --o-classification "$QZA_OUTPUT/paired-end-greengenes-taxonomy-dada2.qza"

time qiime metadata tabulate \
  --m-input-file "$QZA_OUTPUT/paired-end-greengenes-taxonomy-dada2.qza" \
  --o-visualization Taxonomy/Greengenes/qzv/DADA2/paired-end-greengenes-taxonomy-dada2.qzv


echo "#### Exporting ####"

mkdir -p Taxonomy/Greengenes/qzv/DADA2/Export

qiime tools export \
  --input-path "$QZA_OUTPUT/paired-end-greengenes-taxonomy-dada2.qza" \
  --output-path Taxonomy/Greengenes/qzv/DADA2/Export

qiime tools export \
  --input-path DADA2/qza/paired-end-table-dada2.qza \
  --output-path Taxonomy/Greengenes/qzv/DADA2/Export

biom add-metadata \
  -i Taxonomy/Greengenes/qzv/DADA2/Export/feature-table.biom \
  -o Taxonomy/Greengenes/qzv/DADA2/Export/feature-table-with-taxonomy.biom \
  --observation-metadata-fp Taxonomy/Greengenes/qzv/DADA2/Export/taxonomy.tsv \
  --observation-header OTUID,taxonomy \
  --sc-separated taxonomy

biom add-metadata \
  -i Taxonomy/Greengenes/qzv/DADA2/Export/feature-table-with-taxonomy.biom \
  -o Taxonomy/Greengenes/qzv/DADA2/Export/feature-table-with-taxonomy-meta.biom \
  --sample-metadata-fp ~/Desktop/EzMAP_Analysis/sample-metadata.tsv \
  --sample-header sample-id,sample-site,cultivar,compartment

cp Taxonomy/Greengenes/qzv/DADA2/Export/feature-table-with-taxonomy-meta.biom table-w-tax-meta.biom


echo "#### done ####"

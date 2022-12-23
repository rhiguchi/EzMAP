echo "##### EzMAP ########"

CONFIG_FILE="${HOME}/Desktop/paired_denoise_config.txt"
TRIM_LEFT_FORWARD=$(sed -n '1p' "$CONFIG_FILE" | tr -d '\n')
TRIM_LEFT_REVERSE=$(sed -n '2p' "$CONFIG_FILE" | tr -d '\n')
TRUNC_LEFT_FORWARD=$(sed -n '3p' "$CONFIG_FILE" | tr -d '\n')
TRUNC_LEFT_REVERSE=$(sed -n '4p' "$CONFIG_FILE" | tr -d '\n')

echo "TRIM_LEFT_FORWARD: $TRIM_LEFT_FORWARD"
echo "TRIM_LEFT_REVERSE: $TRIM_LEFT_REVERSE"
echo "TRUNC_LEFT_FORWARD: $TRUNC_LEFT_FORWARD"
echo "TRUNC_LEFT_REVERSE: $TRUNC_LEFT_REVERSE"

echo "#### DADA2 #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

mkdir DADA2/qza
mkdir DADA2/qzv


time qiime dada2 denoise-paired \
  --i-demultiplexed-seqs paired-end-trimmed-demux.qza \
  --p-trim-left-f "$TRIM_LEFT_FORWARD" \
  --p-trim-left-r "$TRIM_LEFT_REVERSE" \
  --p-trunc-len-f "$TRUNC_LEFT_FORWARD" \
  --p-trunc-len-r "$TRUNC_LEFT_REVERSE" \
  --o-table DADA2/qza/paired-end-table-dada2.qza \
  --o-representative-sequences DADA2/qza/paired-end-rep-seqs-dada2.qza \
  --o-denoising-stats DADA2/qza/paired-end-denoising-stats-dada2.qza


time qiime feature-table summarize \
  --i-table DADA2/qza/paired-end-table-dada2.qza \
  --o-visualization DADA2/qzv/paired-end-table-dada2.qzv \
  --m-sample-metadata-file ~/Desktop/EzMAP_Analysis/sample-metadata.tsv

time qiime feature-table tabulate-seqs \
  --i-data DADA2/qza/paired-end-rep-seqs-dada2.qza \
  --o-visualization DADA2/qzv/paired-end-rep-seqs-dada2.qzv


time qiime metadata tabulate \
  --m-input-file DADA2/qza/paired-end-denoising-stats-dada2.qza \
  --o-visualization DADA2/qzv/paired-end-denoising-stats-dada2.qzv

echo "#### done ####"

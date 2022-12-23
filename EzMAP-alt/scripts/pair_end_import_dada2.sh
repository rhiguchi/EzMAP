echo "##### EzMAP ########"
echo "#### DADA2 #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

mkdir DADA2/qza
mkdir DADA2/qzv


time qiime dada2 denoise-paired \
  --i-demultiplexed-seqs paired-end-trimmed-demux.qza \
  --p-trim-left-f 0 \
  --p-trim-left-r 0 \
  --p-trunc-len-f 220 \
  --p-trunc-len-r 200 \
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

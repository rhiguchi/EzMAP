echo "##### EzMAP ########"
echo "#### Deblur #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

mkdir -p Deblur/qza
mkdir -p Deblur/qzv


time qiime deblur denoise-16S \
  --i-demultiplexed-seqs paired-end-trimmed-demux.qza \
  --p-trim-length 200 \
  --o-table Deblur/qza/paired-end-table-deblur.qza \
  --o-representative-sequences Deblur/qza/paired-end-rep-seqs-deblur.qza \
  --p-sample-stats \
  --o-stats Deblur/qza/paired-end-denoising-stats-deblur.qza


time qiime feature-table summarize \
  --i-table Deblur/qza/paired-end-table-deblur.qza \
  --o-visualization Deblur/qzv/paired-end-table-deblur.qzv \
  --m-sample-metadata-file ~/Desktop/EzMAP_Analysis/sample-metadata.tsv

time qiime feature-table tabulate-seqs \
  --i-data Deblur/qza/paired-end-rep-seqs-deblur.qza \
  --o-visualization Deblur/qzv/paired-end-rep-seqs-deblur.qzv


time qiime deblur visualize-stats \
  --i-deblur-stats Deblur/qza/paired-end-denoising-stats-deblur.qza \
  --o-visualization Deblur/qzv/paired-end-denoising-stats-deblur.qzv

echo "#### done ####"

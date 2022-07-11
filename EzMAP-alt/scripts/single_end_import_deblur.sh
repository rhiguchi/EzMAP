echo "##### EzMAP ########"
echo "#### Deblur #########"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Single_End_Read_Analysis

mkdir Deblur
mkdir Deblur/qza
mkdir Deblur/qzv


time qiime deblur denoise-16S \
  --i-demultiplexed-seqs single-end-trimmed-demux.qza \
  --p-trim-length 200 \
  --o-table Deblur/qza/single-end-table-deblur.qza \
  --o-representative-sequences Deblur/qza/single-end-rep-seqs-deblur.qza \
  --p-sample-stats \
  --o-stats Deblur/qza/single-end-denoising-stats-deblur.qza


time qiime feature-table summarize \
  --i-table Deblur/qza/single-end-table-deblur.qza \
  --o-visualization Deblur/qzv/single-end-table-deblur.qzv \
  --m-sample-metadata-file ~/Desktop/EzMAP_Analysis/sample-metadata.tsv

time qiime feature-table tabulate-seqs \
  --i-data Deblur/qza/single-end-rep-seqs-deblur.qza \
  --o-visualization Deblur/qzv/single-end-rep-seqs-deblur.qzv


time qiime metadata tabulate \
  --i-deblur-stats Deblur/qza/single-end-denoising-stats-deblur.qza \
  --o-visualization Deblur/qzv/single-end-denoising-stats-deblur.qzv

echo "#### done ####"

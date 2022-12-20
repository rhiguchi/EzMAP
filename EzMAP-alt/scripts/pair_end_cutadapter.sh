echo "##### EzMAP ########"
echo "### Single-end reads Cutadaptor in Execution ####"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis


time qiime cutadapt trim-paired \
--i-demultiplexed-sequences paired-end-demux.qza \
--p-front-f CCTACGGGNGGCWGCAG \
--p-front-r GACTACHVGGGTATCTAATCC \
--o-trimmed-sequences paired-end-trimmed-demux.qza \
--verbose > paired_end_cutadapt_log.txt


time qiime demux summarize \
  --i-data paired-end-trimmed-demux.qza \
  --o-visualization paired-end-trimmed-demux.qzv

echo "##### SUCCESS ########"
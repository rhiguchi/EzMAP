echo "##### EzMAP ########"
echo "### Single-end reads Cutadaptor in Execution ####"

PRIMER_FILE="$HOME/Desktop/Paired_primer_config.txt"
PRIMER_FRONT_FORWARD=$(head -n 1 "$PRIMER_FILE")
PRIMER_FRONT_REVERSE=$(head -n 2 "$PRIMER_FILE" | tail -n 1)

echo "PRIMER_FRONT_FORWARD: $PRIMER_FRONT_FORWARD"
echo "PRIMER_FRONT_REVERSE: $PRIMER_FRONT_REVERSE"

cd ~/Desktop/EzMAP_Analysis/EzMAP_Paired_End_Read_Analysis

time qiime cutadapt trim-paired \
--i-demultiplexed-sequences paired-end-demux.qza \
--p-front-f "$PRIMER_FRONT_FORWARD" \
--p-front-r "$PRIMER_FRONT_REVERSE" \
--o-trimmed-sequences paired-end-trimmed-demux.qza \
--p-cores "${QIIME_THREADS:-4}" \
--verbose > paired_end_cutadapt_log.txt


time qiime demux summarize \
  --i-data paired-end-trimmed-demux.qza \
  --o-visualization paired-end-trimmed-demux.qzv

echo "##### SUCCESS ########"
echo "########### EzMAP ##############"
echo "#### Installing QIIME2 #########"

shell_name=$(basename "$SHELL")
install_path="$HOME/miniconda3"

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh \
  && bash ~/miniconda.sh -b -p "$install_path" -u \
  && source "$install_path/bin/activate" \
  && conda init "$shell_name"

conda update conda

conda install wget

wget https://data.qiime2.org/distro/core/qiime2-2021.2-py36-osx-conda.yml

conda remove -n qiime2-2020.2 --all \
  && conda env create -n qiime2-2020.2 --file qiime2-2021.2-py36-osx-conda.yml


wget \
  -O "gg-13-8-99-515-806-nb-classifier.qza" \
  "https://data.qiime2.org/2021.2/common/gg-13-8-99-515-806-nb-classifier.qza"


mv gg-13-8-99-515-806-nb-classifier.qza ~/Desktop/EzMAP/src/db/gg-13-8-99-515-806-nb-classifier.qza

wget \
  -O "silva-classifier.qza" \
"https://data.qiime2.org/2020.11/common/silva-138-99-515-806-nb-classifier.qza"

mv silva-classifier.qza ~/Desktop/EzMAP/src/db/silva-classifier.qza


echo "####  Done #########"



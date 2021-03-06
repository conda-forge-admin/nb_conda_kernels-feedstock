# tests currently don't build properly inside Docker inside CircleCI
if [[ $(uname) == Linux ]]; then
  exit 0
fi

cd "${SRC_DIR}"

conda clean --lock
conda install -y --quiet -n root -c conda-forge notebook
conda install -y --quiet -n _test -c r r-irkernel

"${PREFIX}/bin/npm" install .
"${PREFIX}/bin/npm" run test

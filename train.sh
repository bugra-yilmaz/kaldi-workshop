#!/usr/bin/env bash

train_cmd="utils/run.pl"
decode_cmd="utils/run.pl"

train_yesno=train_yesno
test_base_name=test_yesno

echo "Training acoustic model..."

steps/train_mono.sh --nj 1 --cmd "$train_cmd" \
  --totgauss 400 \
  data/train_yesno data/lang exp/mono0a &>/dev/null

echo "Compiling the graph..."

utils/mkgraph.sh data/lang_test_tg exp/mono0a exp/mono0a/graph_tgpr &>/dev/null

echo "Completed successfully."

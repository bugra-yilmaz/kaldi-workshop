#!/usr/bin/env bash

train_cmd="utils/run.pl"
decode_cmd="utils/run.pl"

train_yesno=train_yesno
test_base_name=test_yesno

echo "Decoding test inputs..."

steps/decode.sh --nj 1 --cmd "$decode_cmd" \
    exp/mono0a/graph_tgpr data/test_yesno exp/mono0a/decode_test_yesno &>/dev/null

echo "Completed successfully."

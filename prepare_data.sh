#!/usr/bin/env bash

train_cmd="utils/run.pl"
decode_cmd="utils/run.pl"

train_yesno=train_yesno
test_base_name=test_yesno

rm -rf data exp mfcc

echo "Preparing data directories..."

local/prepare_data.sh waves_yesno &>/dev/null
local/prepare_dict.sh &>/dev/null
utils/prepare_lang.sh --position-dependent-phones false data/local/dict "<SIL>" data/local/lang data/lang &>/dev/null
local/prepare_lm.sh &>/dev/null

echo "Completed successfully."

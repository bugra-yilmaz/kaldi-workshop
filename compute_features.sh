#!/usr/bin/env bash

train_cmd="utils/run.pl"
decode_cmd="utils/run.pl"

train_yesno=train_yesno
test_base_name=test_yesno

echo "Computing features..."

for x in train_yesno test_yesno; do 
 steps/make_mfcc.sh --nj 1 data/$x exp/make_mfcc/$x mfcc &>/dev/null
 steps/compute_cmvn_stats.sh data/$x exp/make_mfcc/$x mfcc &>/dev/null
 utils/fix_data_dir.sh data/$x &>/dev/null
done

echo "Completed successfully."

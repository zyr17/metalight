#!/usr/bin/bash

### **************** meta_train ********************
## MetaLight
#memo="meta_train"
#python -u meta_train.py --memo ${memo} --algorithm MetaLight --visible_gpu=1 --replay
#echo "metalight: meta_train complete"

## MAML 
#memo="maml_train"
#python meta_train.py --memo ${memo} --algorithm FRAPPlus  --visible_gpu=1 --replay
#echo "maml: meta_train complete"

## Pretrained
#python meta_test.py --memo ${memo} --algorithm FRAPPlus --multi_episodes --run_round 25 --num_process 2 --visible_gpu=1 --replay
#echo "Pre-trained: meta_train complete"

### Put the model trained by MetaLight, MAML and Pretrained into 'model/initial/common/' and Perform meta-test
### **************** meta_test ********************
#memo="meta_test_maml"
#model_type="maml" # maml or pretrained or random
#traffic_group="valid_all" # test_all, valid_all or city_all
#python meta_test.py --memo ${memo} --algorithm FRAPPlus --num_process 2 --pre_train --pre_train_model_name ${model_type}  --run_round 1 --num_process 2 --update_start 0 --test_period 1 --traffic_group ${traffic_group} 
python summary.py --memo ${memo} --type meta_test 

### **************** SOTL ********************
memo="SOTL"
python run_sotl.py --memo ${memo} --traffic_group valid_all
python summary.py --memo ${memo} --type sotl

CUDA_VISIBLE_DEVICES=1,3 swift sft --model_type cogvlm2-19b-chat --dataset coco-en-2-mini\
                                 --tuner_backend peft --sft_type lora --max_length 2048 \
                                 --lora_rank 8 --batch_size 1 \
                                 --save_total_limit 2 --eval_steps 1000 --logging_steps 1000

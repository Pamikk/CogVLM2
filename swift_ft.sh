dataset_path=
CUDA_VISIBLE_DEVICES=1,3 swift sft --model_type cogvlm2-en-19b-chat --dataset $dataset_path/CogVLM-SFT-311K/llava_instruction_multi_conversations_formate\
                                 --tuner_backend peft --sft_type lora --max_length 2048 \
                                 --lora_rank 8 --batch_size 1 --num_train_epochs 5\
                                 --save_total_limit 2 --eval_steps 1000 --logging_steps 1000

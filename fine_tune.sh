cd finetune_demo
deepspeed peft_lora.py --ds_config ds_config.yaml --model_path THUDM/cogvlm2-video-llama3-chat --dataset_path /home/ubuntu//datset/CogVLM-SFT-311K/llava_instruction_multi_conversations_formate --deepspeed --deepspeed_config ds_config.json
#model options see https://huggingface.co/collections/THUDM/cogvlm2-6645f36a29948b67dc4eef75
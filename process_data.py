'''
scripts to convert dataset from cogvlm2 supported to ms-swift supported
'''
import os
root_dir = '..\..\dataset\CogVLM-SFT-311K\CogVLM-SFT-311K\llava_instruction_multi_conversations_formate'
image_dir = os.path.join(root_dir, 'images')
label_dir = os.path.join(root_dir,'labels_en')
filenames = os.listdir(image_dir)
save_path = os.path.join(root_dir, 'label_en.json')
import json
data = []
from numpy import random
random.seed(len(filenames))
for idx,_ in enumerate(filenames):
    img_name = os.path.join(image_dir, filenames[idx])
    label_name = os.path.join(label_dir, filenames[idx].replace('.jpg', '.json'))
    with open(label_name, 'r') as f:
        label_data = json.load(f)

    num_rounds = len(label_data["conversations"]) // 2
    sampled_round_id = random.randint(0, num_rounds + 1)
    item = {}
    item["history"] = [[label_data["conversations"][i * 2]["content"],
                label_data["conversations"][i* 2 + 1]["content"]] for i in range(sampled_round_id)] if sampled_round_id > 0 else []
    item["query"] = label_data["conversations"][sampled_round_id * 2]["content"]
    item["response"] = label_data["conversations"][sampled_round_id * 2 + 1]["content"]
    item["image"] =[img_name]
    data.append(item)
json.dump(data, open(save_path, 'w'))

'''
item template
{"query": "55555", "response": "66666", "images": ["image_path"]}
{"query": "eeeee", "response": "fffff", "history": [], "images": ["image_path"]}
{"query": "EEEEE", "response": "FFFFF", "history": [["query1", "response1"], ["query2", "response2"]], "images": ["image_path"]}
'''
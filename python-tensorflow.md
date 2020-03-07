
setup python virtual environment

```sh
virtualenv --python=/usr/bin/pythonxx venv
source venve/bin/activate
pip install tensorflow==1.5
pip ...
deactivate
```

compile proto buffers

```sh
protoc --python_out=. ./object_detection/protos/*.proto
```

generate tf records

```sh
python generate_tfrecord.py --csv_input=images/train_labels.csv --image_dir=images/train --output_path=train.record
python generate_tfrecord.py --csv_input=images/test_labels.csv --image_dir=images/test --output_path=test.record
```

convert to csv

traing

```sh
python train.py --logtostderr --train_dir=training/ --pipeline_config_path=training/faster_rcnn_inception_v2_pets.config
```

generate inference graph

```sh
python export_inference_graph.py --input_type image_tensor --pipeline_config_path training/faster_rcnn_inception_v2_pets.config --trained_checkpoint_prefix training/model.ckpt-XXXX --output_directory inference_graph
```
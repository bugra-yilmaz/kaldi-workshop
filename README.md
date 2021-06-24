# kaldi-workshop
A brief introduction to Kaldi with a simple speech recognition use case.

### 0. Pull the Kaldi docker image
First, we need the Kaldi docker image for running our example:
```bash
docker pull kaldiasr/kaldi
```

### 1. Download training resources needed for the example
Please download the training resources in your project directory with this [link](https://drive.google.com/file/d/1w6Lb6rGe5a3sTIzL4zszwqMMRKtQK9jm/view?usp=sharing).

### 2. Run the docker image
Now, we need to run the docker image and connect to the container:
```bash
docker run --name kaldi -it kaldiasr/kaldi:latest
```

### 3. Copy the source code and resources
Now that we are in the Kaldi container, first create a directory for our example in ```egs```:
```bash
cd egs
mkdir xomnia && cd xomnia
mkdir yes-no && cd yes-no
```

Then, we need to copy our source code and resources in our example directory. For this, please open a new terminal tab and run:
```bash
docker cp . kaldi:/opt/kaldi/egs/xomnia/yes-no
```

### 4. Execute
First, unzip the training resources:
```bash
unzip -q resources.zip
```

Then, the first step is to preparing your Kaldi data directory with the download resources:
```bash
./prepare_data.sh
```

The next step is to compute MFCC features for the training and test data:
```bash
./compute_features.sh
```

Now, we can train our acoustic model and generate the static decoding graph:
```bash
./train.sh
```

The last step is to decode the test audios with the trained model:
```bash
./decode.sh
```

Lastly, you can display the results of your model for the test set:
```bash
python3 show_results.py
```

### 4. Further reading
- Official Kaldi website: https://kaldi-asr.org
- A good reading for Kaldi: https://www.eleanorchodroff.com/tutorial/kaldi/training-overview.html

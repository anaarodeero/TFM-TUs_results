# TFM-TUs_results
This repository is used to store all the files and results used in my Masters thesis: **Enhancing the Quality of Parallel Corpora through  Classic and Neural Classification**

The very large files from the datasets are stored in [here](https://zenodo.org/record/8021347)

The project is divided into three subfolders:
- Bicleaner
- Bicleaner AI
- OpusFilter

Each of this folder has stored all the input and output files, and the models files.

## Usage
To use any of the models, perform this simple steps:
- Download or clone the repository
- Move to the directory of the model you want to use
- Use the model, depending of the tool:
	- Bicleaner: classify any corpus you like with the metadata file found in the folder with the following command:

    `bicleaner-classify corpus.en-es.raw  corpus.en-es.classified  metadata.yaml `
  
    `bicleaner-ai-classify corpus.en-es.raw  corpus.en-es.classified  metadata.yaml `
  
	- OpusFilter: modify the classify file to take as input the corpus you want to classify and then:

   `opusfilter config-classify.yaml`

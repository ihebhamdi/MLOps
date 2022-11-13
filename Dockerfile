FROM jupyter/scipy-notebook
FROM fedora:34

RUN yum -y install python3-pip \
    pip3 install joblib


USER root

RUN yum update && \
    yum install -y jq \
    mkdir model raw_data processed_data results


ENV RAW_DATA_DIR=/home/jovyan/raw_data
ENV PROCESSED_DATA_DIR=/home/jovyan/processed_data
ENV MODEL_DIR=/home/jovyan/model
ENV RESULTS_DIR=/home/jovyan/results
ENV RAW_DATA_FILE=heart.csv


COPY heart.csv ./raw_data/heart.csv
COPY preprocessing.py ./preprocessing.py
COPY train.py ./train.py
COPY test.py ./test.py

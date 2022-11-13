FROM jupyter/scipy-notebook
FROM fedora:34

RUN yum -y install python3-pip
RUN pip3 install joblib
RUN pip3 install pandas
RUN pip3 install -U scikit-learn scipy matplotlib



USER root

RUN yum -y update
RUN yum install -y jq
RUN mkdir model raw_data processed_data results


ENV RAW_DATA_DIR=/var/lib/jenkins/workspace/MLOps/raw_data
ENV PROCESSED_DATA_DIR=/var/lib/jenkins/workspace/MLOps/processed_data
ENV MODEL_DIR=/var/lib/jenkins/workspace/MLOps/model
ENV RESULTS_DIR=/var/lib/jenkins/workspace/MLOps/results
ENV RAW_DATA_FILE=heart.csv


COPY heart.csv ./raw_data/heart.csv
COPY preprocessing.py ./preprocessing.py
COPY train.py ./train.py
COPY test.py ./test.py

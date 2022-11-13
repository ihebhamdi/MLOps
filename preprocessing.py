import os
import csv
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import pickle


# Set path for the input
RAW_DATA_DIR = os.environ['/home/vagrant/raw_data']
RAW_DATA_FILE = os.environ['/home/vagrant/raw_data/heart.csv']
raw_data_path = os.path.join(RAW_DATA_DIR, 'heart.csv')

# Read dataset
cwd = os.getcwd()
print(cwd)
data = pd.read_csv('/home/vagrant/raw_data/heart.csv', sep=",")

# Drop useless variables
X = data.drop(['target'], axis='columns')
y = data['target'].to_frame()

train, test = train_test_split(data, test_size=0.3, stratify=data['target'])

# Set path to the outputs
PROCESSED_DATA_DIR = os.environ["PROCESSED_DATA_DIR"]
train_path = os.path.join(PROCESSED_DATA_DIR, 'train.csv')
test_path = os.path.join(PROCESSED_DATA_DIR, 'test.csv')

# Save csv
train.to_csv(train_path, index=False)
test.to_csv(test_path,  index=False)
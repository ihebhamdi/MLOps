pipeline {
 
 agent any
     
    stages {
        stage('Getting Project from Git') {
            steps {
                echo 'Project is downloading...'
                git branch:'main', url:'https://github.com/ihebhamdi/MLOps.git'
  
                 }
             }
          stage('Building docker container') {
            steps {
                  sh 'docker rm -f model'
                  sh 'docker build -t heartdisease-model .'
                  sh 'docker run -t -d --name model heartdisease-model'
               }
           }
            stage('Preprocessing stage') {
            steps {
                   sh 'docker container exec model python3 preprocessing.py'
               }
           }
           stage('Training stage') {
            steps {
                    sh 'docker container exec model python3 train.py'
                }
        }
        stage('Test stage') {
              steps {
                    sh 'docker container exec model python3 train.py'
                    sh 'docker container exec model python3 test.py'
                    sh 'docker container exec model cat /home/jovyan/results/train_metadata.json /home/jovyan/results/test_metadata.json' 
                    sh 'docker rm -f model'
                  }
               }
    }
}
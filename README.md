[![CircleCI](https://circleci.com/gh/joshuablr/Udacity-ML-Microservice-deployment.svg?style=svg)](https://circleci.com/gh/joshuablr/Udacity-ML-Microservice-deployment)

https://circleci.com/gh/joshuablr/Udacity-ML-Microservice-deployment.svg?style=svg

## Project Overview

In this project, we have given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. 
we can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). 

### Project Tasks

The project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project the below are the tasks to be completed :
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

## Setup the Environment

* Create a virtualenv and activate it:
```
$ make setup
```
* Install the necessary dependencies:
```
$ make install
```
* Fill and set env variables(docker hub user name and access token) up:
```
$ vi .env
```
### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Deployment options and its Steps
## Standalone deployment
  - To set up the environment
    - `make setup`
  - To install the dependencies 
    - `make install`
  - To run the app
  - `sudo make local`
  - To clean up
    - `ctrl+c`
## Dockerize and test
  - To build an image and run it
    - `./run_docker.sh`
  - To test it 
    - `./make_prediction.sh`
  - To delete the docker deployment
    - `make clean`

## deploy in kubernetes and test
  - Assume that you built an image using `./run_docker.sh`
  - Assume you installed docker desktop with kubernetes enabled 
  - To deploy using script
    - `./run_kubernetes.sh`
  - To deploy using makefile
    - `make kubernetes`
  - To test it 
    - `./make_prediction.sh`
  - To delete the deployment
    - `make clean-kubernetes`


# DevOpsProject
Final Project for CSCI 220

# Table of Contents
* [Overview](#Overview)
* [Setup](#Setup)
* [Technologies Used](#Technologies Used)
* [Background](#Background)

---

# Overview 
- CI/CD is an excellent way to automate testing and deployment for production settings
- This  project represents a CI/CD Pipeline where we use github actions to run tests when 
pull requests are opened and deploy our tested code to production whenever a pull request is merged
- We use two .yml files to do represent actions for CI and CD
- CI/CD introduces automation to the process of app deployment
- The Continuous Integration part refers to the process of integrating new code into shared repositories easily
- This is a solution to having conflicting branches in a repo, if we are constantly testing new pushes/pull requests our code will be functional and ready for production
### Continuous Integration
- Using github actions our yml file specifies any time a pull request is created we want to run tests to check the pull request and make sure our code is still functional
- By specifying the on: [pull request] this represents the trigger for the script to run
- We use an ubuntu image to setup our flask server and run our tests using pytest

### Continuous Deployment
- After our pull request has been properly tested we then want to automate the process of deploying our app with any new changes
- Our deployment is in the form of an aws instance which deploys our original flask server using gunicorn
<mark>TODO</mark>
---

# Setup
Each CI/CD pipeline will be unique but the main steps in creating this pipeline are the following:
1. Create a directory in your github repository labeled ```.github/workflows```
    
   - This is the directory where any actions yaml files will be located... For example in our repository we have 
   two files named ```continuous-integration.yml``` and ```continuous-deployment.yml``` these files have the instructions for each of our automation processes
   - I recommend taking a look at this tutorial for a baseline on Github Actions [Github-Actions-Demo](https://docs.github.com/en/actions/quickstart)

2. Identify what behaviors or actions your CI/CD should be triggered on in a github repository 
   
    - visit this link [Github Workflow Triggers](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows)
    - In the yml file this is what comes after the ```on:``` statement
      - Examples could be ```on: [push, pull_request, pull, fork]```
3. For the CI part of this pipeline you will want to have tests in place for your code
4. For the CD part of this pipeline...<mark>TODO</mark>


---

# Technologies Used
- [Github-Actions-Demo](https://docs.github.com/en/actions/quickstart)
- [Flask Testing](https://flask.palletsprojects.com/en/1.1.x/testing/)
- [Pytest](https://docs.pytest.org/en/7.1.x/)
- [Pytest-Cov](https://pypi.org/project/pytest-cov/)
- [AWS-CLI-Tool](https://aws.amazon.com/cli/)
- [AWS-run-instances](https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html)

# Background
- <mark>TODO</mark>
<!--  launching instance with aws using continuous deployment
aws ec2 run-instances -image-id ami- {find this on aws} use user data -->


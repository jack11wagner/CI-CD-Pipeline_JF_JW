# DevOpsProject
Final Project for CSCI 220

# Table of Contents
* [Overview](#Overview)
* [Setup](#Setup)
* [Technologies Used](#Technologies-Used)
* [Background](#Background)

---

# Overview 
- CI/CD is an excellent way to automate testing and deployment for production settings.
- This  project represents a CI/CD Pipeline where we use github actions to run tests when 
pull requests are opened and deploy our tested code to production whenever a pull request is merged and passes our tests
- We use two .yml files to do represent the workflows for CI and CD
- The Continuous Integration part refers to the process of integrating new code into shared repositories easily by having tests in place to validate new code
- This is a solution to having conflicting branches in a repo, if we are constantly testing new pushes/pull requests our code will be functional and ready for production
- The Continuous Development/Deployment aspect makes this new code readily available in production whenever we merge into the main branch aka production code
- 
### Continuous Integration
- Using github actions our yml file will be triggered any time a pull request is opened, we want to run tests to check the pull request and make sure our code is working properly
- By specifying the on: [pull request] this represents the trigger for the script to run
- If the pull request does not pass the tests our integration requires changes in order for the new commits to be merged
- We use pytest to test the contents of our flask server 
  - Mainly we are looking for the Currency, Last Price, and 1Day Price Change values on the server
  - We make Nomics API calls to get our currency prices
- We also use pytest-cov to make sure our tests properly cover our codebase 
- We also implemented pytest-lint checks for additional tests on any new code to the repository
- One important thing to note is that when making pull requests by default if the new code is able to be merged automatically, regardless of the integration test results you are still able to merge the code
- In order to make pull requests only mergeable after tests have passed there are a few extra steps you have to do in the repository


### Continuous Deployment
- After our pull request has been properly tested we then want to automate the process of deploying our app with our new changes immediately
- Our deployment is in the form of an aws instance which deploys our original flask server using gunicorn
- Using the aws cli we use the run-instances command which deploys our tested and ready for production code as an EC2 instance

- <mark>TODO</mark>
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
3. For the CI part of this pipeline you will want to have tests in place for your code, other options for the CI could be using linting as well as looking at testing coverage
   - In order to make pull requests mergeable **ONLY** after tests have passed there are a few extra steps you have to do in the repository
   - Head to **Settings > Branches** on your repo's homepage
   - You will see branch protection rules, you want to click **Add rule**
   - Now you will see a number of different settings...
   - The first input heading is the branches for which this rule will apply to, if you just type '*' this will refer to all branches future and existing
   - You will want to check off the following ```Require a pull request before merging``` and ```Require status checks to pass before merging```

      - The status check setting requires a specified status check to run in order to verify the pull request still passes the tests.
      - If using the standard integration format for your .yml file you can just specify ```integration``` here
      - Now the CI only allows merging if the code is both automatically mergeable and the tests have passed.
4. For the CD part of this pipeline we decided to use AWS to deploy our production code but there are a number of other otpions out there for continuous deployment
- For AWS in particular we had to configure our AWS cli with credentials from our AWS account before being able to launch instances from our workflow file
- Using Github Secrets is very important to maintaining the privacy of our sensitive Key information
  
   - In order to create a repository secret go to **Settings > Secrets > Actions** and you can create encrypted secrets there to be used in any github actions files
   - In order to access these values here is an example: 
  
     - ```key : ${{ secrets.KEY_SECRET }}```
- <mark>TODO</mark>


---

# Technologies-Used
- [Github-Actions-Demo](https://docs.github.com/en/actions/quickstart)
- [Flask Testing](https://flask.palletsprojects.com/en/1.1.x/testing/)
- [Pytest](https://docs.pytest.org/en/7.1.x/)
- [Pytest-Cov](https://pypi.org/project/pytest-cov/)
- [AWS-CLI-Tool](https://aws.amazon.com/cli/)
- [AWS-run-instances](https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html)

# Background
- [Branch Protection Rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/managing-a-branch-protection-rule)
- [Github Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
- <mark>TODO</mark>
<!--  launching instance with aws using continuous deployment
aws ec2 run-instances -image-id ami- {find this on aws} use user data -->


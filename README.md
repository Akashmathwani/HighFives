# HighFives_UI

User Interface for HighFives.Runs for web, android and ios.

# Environments 
There are two environments as of now. Development and Production. Develop branch will point to develop environment and master will point to production.

# Instructions
Master is always stable so all testing needs to be done before merging anything to master. PRs should be raised against develop and if the PR is merged in develop, a testing needs to be done in develop because we will try to keep all our environments stable.

Please include test cases in all PRs otherwise we'll break if code gets large and big. Before creating a PR please run all test cases and test in web and apps if everything works fine.**Build is only triggered for master branch as of now so please run your test cases, static code analysis in your local before psuhing any branch to remote/origin.**

To create a PR, first create a story on Azure Board and name of PR should start **UI-"storyNumber":NAME_OF_PR.**

## Getting Started

This project is about user interface of highfives and works for all applications like web and cross platform apps by using flutter and dart.

To run **Dev** Environment:
  #### flutter run --target lib/main_dev.dart or flutter run --t lib/main_dev.dart

To run **Prod** Environment:
  #### flutter run --target lib/main_prod.dart or flutter run --t lib/main_prod.dart
  
  
 # Build
 
As soon as any of the pr is merged in master build will start and to see the build running. Go to **Github Actions** at the top and check if everythign is fine.Build is only triggered for master branch as of now. We will try to run it for all branches in future.
 
# Documentation

keep all docs, diagrams in docs folder.

#This is a step by step guide explains how to run the application
It is  terminal-based shell application that helps track students who have not submitted their assignments.  
The app automatically sets up its environment, checks submission statuses, and allows assignment updates interactively.
The app is easy to use,understand and interpret as well as debuging in case of any challenges that may arise

# 1.Clone the Repository

Start by cloning the GitHub repository to your local machine:

git clone https://github.com/Officialvinn/submission_reminder_app_Officialvinn.git
cd submission_reminder_app_Officialvinn

# 2.Create the environment
Run the setup script 
./create_environment.sh

#When promoted enter your name
A folder called submission_reminder_Alvin will be created with all necessary subdirectories and files

# 3.Run the application
Start the application to check which student has not submitted their assignment
./ startup.sh

# 4.Update the Assignment
To change the assignment name and recheck submission statues
./copilot_shell_script.sh

# 5. Git 
This project has 2 working branches
1.Setup-for development and testing
2.Main-for final production-ready code
# Create and switch to feature branch
git checkout -b setup
# Add and commit changes
git add .
git commit -m "Add setup and copilot scripts"
# Push feature branch to GitHub
git push origin setup
# Merge into main branch when ready
git checkout main
git merge feature/setup
git push origin main

#!/usr/bin/env bash

read -p "Enter your name:" name

DIR=submission_reminder_$name
mkdir -p "$DIR/apps"
mkdir -p "$DIR/modules"
mkdir -p "$DIR/assets"
mkdir -p "$DIR/config"

cat > "$DIR/apps/reminder.sh" << 'EOL'
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOL

cat > "$DIR/modules/functions.sh" << 'EOL'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOL

cat > "$DIR/config/config.env" << 'EOL'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2

EOL

cat > "$DIR/assets/submissions.txt" <<EOL
student,assignment,submission status
Chinemerem,Shell Navigation,not submitted
Chiagoziem,Git,submitted
Divine,Shell Navigation,not submitted
Anissa,Shell Basics,submitted
EOL

cat > "$DIR/startup.sh" << 'EOL'
echo "Submission_remider_app..."

source ./config/config.env
source ./modules/functions.sh
bash ./apps/reminder.sh
EOL

chmod +x "$DIR"/*.sh "$DIR"/apps/*.sh "$DIR"/modules/*.sh

echo "Environment created successfully in $DIR"
echo "You can now run the app with: $DIR/startup.sh"


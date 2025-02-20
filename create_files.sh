#!/bin/bash

user_name="Esther"
main_directory="submission_reminder_${user_name}"

echo "Creating necessary files...

cat <<EOL > "$main_directory/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
EOL

cat <<EOL > "$main_directory/config/config.env"
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=3
EOL

cat <<EOL > "$main_directory/modules/functions.sh"
#!/bin/bash

function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    while IFS=, read -r student assignment status; do

        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file")
}
EOL

cat <<EOL > "$main_directory/reminder.sh"
#!/bin/bash

source ./config/config.env
source ./modules/functions.sh

submissions_file="./assets/submissions.txt"

"Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOL

cat <<EOL > "$main_directory/startup.sh"
#!/bin/bash

echo "Starting the Submission Reminder App..."

./reminder.sh
EOL

echo "Files created successfully."

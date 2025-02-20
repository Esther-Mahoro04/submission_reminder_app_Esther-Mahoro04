# Submission Reminder App

This script sets up a "Submission Reminder" app that checks assignment submission statuses and sends reminders for unsubmitted work.

## Usage

1. Clone/download the repo.
2. Make the script executable:
   ```bash
   chmod +x create_environment.sh
   ```
3. Run the script:
   ```bash
   ./create_environment.sh
   ```
   Enter your name when prompted.
4. To start the app, run:
   ```bash
   ./submission_reminder_{yourName}/startup.sh
   ```

## File Descriptions

- **create_environment.sh**: Sets up the app’s directory structure and files.
- **app/reminder.sh**: Main script that checks submission statuses and prints reminders.
- **modules/functions.sh**: Contains functions like `check_submissions` to process submission data.
- **config/config.env**: Stores app configuration, such as the assignment name and remaining days.
- **assets/submissions.txt**: Contains student submission records in CSV format.
- **startup.sh**: Starts the app by running `reminder.sh`.

## What it Does

- Creates necessary folders and files for the app.
- Configures the assignment details.
- Sends reminders for unsubmitted assignments.

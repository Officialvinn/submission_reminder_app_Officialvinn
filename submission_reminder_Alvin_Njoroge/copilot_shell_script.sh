#!/bin/env bash

read -p "Enter your new assignment name:" NEW_ASSIGNMENT

OLD_ASSIGNMENT=$(grep '^ASSIGNMENT=' config/config.env | cut -d'"' -f2)

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$NEW_ASSIGNMENT\"/" config/config.env

echo "Assignment changed from '$OLD_ASSIGNMENT' TO '$NEW_ASSIGNMENT'."
echo "You can relaunch ./startup.sh"

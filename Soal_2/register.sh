#!/bin/bash

log_message()
{
	local type="$1"
	local message="$2"
	local date_time=$(date +"[%d/%m/%y %H:%M:%S]")
	echo "$date_time [$type] $message" >> auth.log
}
echo "Welcome to Registration System"
while true; do
	echo "Enter your email:"
	read user_email

	contains_substring()
	{
		[[ $1 == *"$2"* ]]
	}

	validate_email_format()
	{
		email="$1"
		if [[ "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]
		then
			return 0
		else
			return 1
		fi
	}

	if ! validate_email_format "$user_email"
	then
		log_message "REGISTER FAILED" "ERROR Failed register, the user entered an email with the invalid format: $user_email" 
		echo "Invalid email format. Please enter your email in the correct format."
	elif grep -s -q "^Email: $user_email$" users.txt
	then
		log_message "REGISTER FAILED" "ERROR Failed register, The user enters the registered email: $user_email"
		echo "Email $user_email is already registered. Please use another email for registration."
	else
		break
	fi
done

if contains_substring "$user_email" "admin"
then
	status="Admin"
else
	status="User"
fi

echo "Enter your username:"
read username

echo "Enter a security question:"
read security_question
echo "Enter the answer to your security question:"
read security_answer

while true; do
	read -s -p "Enter a password (minimum 8 characters, at least 1 uppercase letter, 1 lowercase letter, 1 digit, 1 symbol, and not same as username, birhtdate, or name): " password
	echo

	if (( ${#password} < 8 ))
	then
		log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format"
		echo "The password must consist of a minimum of 8 characters."
	elif ! [[ "$password" =~ [A-Z] ]]
	then
		log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format."
		echo "The password must contain at least 1 uppercase letter."
	elif ! [[ "$password" =~ [a-z] ]]
	then
		log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format."
		echo "The password must contain at least 1 lowercase letter."
	elif ! [[ "$password" =~ [0-9] ]]
	then
		log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format."
		echo "The password must contain at least 1 number."
	else
		log_message "REGISTER SUCCESS" "user $username as $status registered succesfully"
		encrypted_password=$(echo -n "$password" | base64)
		break
	fi
done

echo "Email: $email" >> users.txt
echo "Status: $status" >> users.txt
echo "Username: $username" >> users.txt
echo "Security Question: $security_question" >> users.txt
echo "Security Answer: $security_answer" >> users.txt
echo "Password: $encrypted_password" >> users.txt
echo " " >> users.txt

echo "Users registered succesfully!"

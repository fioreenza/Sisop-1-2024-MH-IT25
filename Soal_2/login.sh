#!/bin/bash

log_message()
{
        local type="$1"
        local message="$2"
        local date_time=$(date +"[%d/%m/%y %H:%M:%S]")
        echo "$date_time [$type] $message" >> auth.log
}

echo "Welcome to Login System"
echo "1. Login"
echo "2. Forgot Password"
read choices

case "$choices" in
	"1")
		echo "Welcome to Login System"
		while true; do
			echo "Enter your email:"
			read user_email_login
			user_info_login=$(grep "^Email: $user_email_login" users.txt)

			if [ -z "$user_info_login" ]
			then
				log_message "LOGIN FAILED" "Login attempt failed. Email $user_email_login is not registered."
				echo "Email not registered."
			else
				break
			fi
		done
		status_info=$(grep -A 1 "Email: $user_email_login" users.txt | grep "Status" | cut -d ':' -f 2- | xargs)
		username_info=$(grep -A 2 "Email: $user_email_login" users.txt | grep "Username" | cut -d ':' -f 2- | xargs)

		if [ "User" == "$status_info" ]
		then
			while true; do
				read -s -p "Enter your password: " password_login
				echo
				stored_password_login=$(grep -A 5 "Email: $user_email_login" users.txt | grep "Password" | cut -d ':' -f 2- | xargs)

				if [ "$password_login" == "$stored_password_login" ]
				then
					log_message "LOGIN SUCCESS" "user $username_info has logged succesfully as User"
					echo "Login succesful!"
					echo "You don't have admin privileges. Welcome!"
					break
				else
					log_message "LOGIN FAILED" "Login attempt failed. Password entered does not match for email $user_email_login."
					echo "Incorrect password!"
				fi
			done
		elif [ "Admin" == "$status_info" ]
		then
			while true; do
				read -s -p "Enter your password: " password_login
				echo
				stored_password_login=$(grep -A 5 "Email: $user_email_login" users.txt | grep "Password" | cut -d ':' -f 2- | xargs)

				if [ "$password_login" == "$stored_password_login" ]
				then
					log_message "LOGIN SUCCESS" "user $username_info has logged succesfully as Admin"
					echo "Login succesful!"
					echo "Admin Menu"
					echo "1. Add User"
					echo "2. Edit User"
					echo "3. Delete User"
					echo "4. Logout"
					read choices_admin
					case "$choices_admin" in
						"1")
							while true; do
								echo "Enter your email:"
								read user_email_admin

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
								if ! validate_email_format "$user_email_admin"
								then
									log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info entered an email in the wrong format: $user_email_admin"
									echo "Invalid email format. Please enter your email in the correct format."
								elif grep -s -q "^Email: $user_email_admin$" users.txt
								then
									log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info enters the registered email: $user_email_admin"
									echo "Email $user_email is already registered. Please use another email for registration."
								else
									break
								fi
							done
							if contains_substring "$user_email_admin" "admin"
							then
								add_status_admin="Admin"
							else
								add_status_admin="User"
							fi
							echo "Enter your username:"
							read add_username_admin
							echo "Enter a security question:"
							read add_security_question_admin
							echo "Enter the answer to your security question:"
							read add_security_answer_admin

							while true; do
								read -s -p "Enter a password (minimum 8 characters, at least 1 uppercase letter, 1 lowercase letter, 1 digit, 1 symbol, and not same as username, birthdate, or name): " add_password_admin
							        echo
							        if (( ${#add_password_admin} < 8 ))
							        then
									log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info entered the password in the wrong format"
							                echo "The password must consist of a minimum of 8 characters."
							        elif ! [[ "$add_password_admin" =~ [A-Z] ]]
							        then
									log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info entered the password in the wrong format"
							                echo "The password must contain at least 1 uppercase letter."
							        elif ! [[ "$add_password_admin" =~ [a-z] ]]
							        then
									log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info entered the password in the wrong format"
							                echo "The password must contain at least 1 lowercase letter."
							        elif ! [[ "$add_password_admin" =~ [0-9] ]]
							        then
									log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info entered the password in the wrong format"
							                echo "The password must contain at least 1 number."
							        else
									log_message "REGISTER SUCCESS" "The admin $username_info added user $add_username_admin as $add_status_admin registered succesfully"
							                add_encrypted_password_admin=$(echo -n "$add_password_admin" | base64)
							                break
							        fi
							done
							echo "Email: $user_email_admin" >> users.txt
							echo "Status: $add_status_admin" >> users.txt
							echo "Username: $add_username_admin" >> users.txt
							echo "Security Question: $add_security_question_admin" >> users.txt
							echo "Security Answer: $add_security_answer_admin" >> users.txt
							echo "Password: $add_encrypted_password_admin" >> users.txt
							echo " " >> users.txt

							echo "Users added succesfully!"
						;;
						"2")
							while true; do
								echo "Enter user's email you want to edit:"
								read edit_user_email
								line_number=$(grep -n "Email: $edit_user_email$" users.txt | cut -d ':' -f 1)

								if [ -z "$line_number" ]
                       						then
									log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info enters the unregistered email: $edit_user_email"
				                                	echo "Email not registered."
					                        else
					                                break
					                        fi
							done
							echo "Enter new username:"
							read new_username
							echo "Enter new security question:"
							read new_security_question
							echo "enter new security answer:"
							read new_security_answer
							while true; do
								read -s -p "Enter new password (minimum 8 characters, at least 1 uppercase letter, 1 lowercase letter, 1 digit, 1 symbol, and not same as username, birthdate, or name): " new_password
								echo
								if (( ${#new_password} < 8 ))
							        then
									log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
							                echo "The password must consist of a minimum of 8 characters."
							        elif ! [[ "$new_password" =~ [A-Z] ]]
							        then
									log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
							                echo "The password must contain at least 1 uppercase letter."
							        elif ! [[ "$new_password" =~ [a-z] ]]
							        then
									log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
							                echo "The password must contain at least 1 lowercase letter."
							        elif ! [[ "$new_password" =~ [0-9] ]]
							        then
									log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
							                echo "The password must contain at least 1 number."
							        else
									log_message "REGISTER SUCCESS" "(EDIT USER SUCCESS) the Admin $username_info edited user $edit_user_email information succesfully"
							               new_encrypted_password=$(echo -n "$new_password" | base64)
						                break
							        fi
							done
							sed -i "$(($line_number + 2))s/Username: .*/Username: $new_username/" users.txt
							sed -i "$(($line_number + 3))s/Security Question: .*/Security Question: $new_security_question/" users.txt
							sed -i "$(($line_number + 4))s/Security Answer: .*/Security Answer: $new_security_answer/" users.txt
							sed -i "$(($line_number + 5))s/Password: .*/Password: $new_encrypted_password/" users.txt
							echo "User information updated succesfully!"
						;;
						"3")
							while true; do
								echo "Enter user's email you want to delete:"
								read delete_user_email
								delete_user_info=$(grep "^Email: $delete_user_email" users.txt)

								if [ -z "$delete_user_info" ]
								then
									log_message "USER DELETED FAILED" "The Admin $username_info enters the unregistered email: $delete_user_email"
									echo "Email not registered."
								else
									break
								fi
							done
							sed -i "/Email: $delete_user_email/,+5d" users.txt
							log_message "USER DELETED SUCCESS" "The Admin $username_info deleted user $delete_user_email succesfully"
							echo "User with email $delete_user_email has been deleted."
						;;
						"4")
							log_message "LOGOUT" "The Admin $username_info has logged out"
							echo "Logout succesful!"
							exit 1
						;;
					esac
					break
				else
					log_message "LOGIN FAILED" "ERROR Failed login tttempt on user $username_info with email $user_email_login as Admin entered the wrong password"
					echo "Incorrect password!"
				fi
			done
		fi
	;;
	"2")
		echo "Forgot password?"
		while true; do
			echo "Enter your email:"
			read user_email
			user_info=$(grep "^Email: $user_email$" users.txt)

			if [ -z "$user_info" ]
			then
				log_message "PASSWORD RESET FAILED" "Attempted password reset failed. Email $user_email is not registered"
				echo "Email not registered."
			else
				break
			fi
		done
		security_question=$(grep -A 3 "Email: $user_email" users.txt | grep "Security Question" | cut -d ':' -f 2- | xargs)
		echo "Security Question: $security_question"

		while true; do
			echo "Enter your answer: "
			read security_answer

			stored_answer=$(grep -A 4 "Email: $user_email" users.txt | grep "Security Answer" | cut -d ':' -f 2- | xargs)
			password_hash=$(grep -A 5 "Email: $user_email" users.txt | grep "Password" | cut -d ':' -f 2- | xargs)
			if [ "$security_answer" == "$stored_answer" ]
			then
				log_message "PASSWORD RESET SUCCESS" "Password reset successful for email $user_email"
				echo "Your password is: $password_hash"
				break
			else
				log_message "PASSWORD RESET FAILED" "Password reset attempt failed. Incorrect security answer for email $user_email"
				echo "Incorrect answer!"
			fi
		done
	;;
esac


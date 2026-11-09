from dns_res import dns_resolver

while True:
	### Main Input and Output Prompt
	print("NetScout: Your Local Network Analyzer\n")
	target = input("Enter the Hostname to be resolved >>> ")

	ip_address = dns_resolver(target)
	print(ip_address)

	answer = input("Would you like to try another Hostname? y/n >>> ")

	### List of Valid Answers
	deny = ["no", "n", "nope", "nah"]
	accept = ["yes", "y", "yep", "yeah"]

	### Validation
	if answer.casefold() in deny:
		print("Thank you for using NetScout!")
		break
	elif answer.casefold() in accept:
		print("Continuing Netscout Service...")
	else:
		print("Program failed to terminate. Input must be y/n >>> ")

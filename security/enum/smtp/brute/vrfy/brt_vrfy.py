#! /usr/bin/python

# Brute forces smtp host vrfy command

import sys, socket, getopt, os

def main(argv):
	PORT = 25
	host = ''
	wordlist = ''
	helpstr = 'brt_vrfy -h -t <target host> -w <wordlist>'
	
	if len(sys.argv) != 5:
			print helpstr
			sys.exit(0)
	try:
		opts, args = getopt.getopt(argv,"ht:w:",["target=","wordlist="])
	except getopt.GetoptError:
		print helpstr
		sys.exit(0)
	for opt, arg in opts:
		if opt == '-h':
			print helpstr
			sys.exit()
		elif opt in ("-t", "--target"):
			host = arg
		elif opt in ("-w", "--wordlist"):
			wordlist = arg
	if not (host and wordlist):
		str = ' not specified. Please use -h'
		if not host: 
                	print 'Host' + str
		if not wordlist:
			print 'Wordlist' + str
		sys.exit(0)
	print 'Host set to ', host
	print 'Wordlist set to ', wordlist

        # Create a socket
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	user=''
	try:
		# Connect to the server
		s.connect((host, PORT))
		# Receive the banner
		banner = s.recv(4096)
		#print repr(banner)
		with open(wordlist) as f:
			for user in f:
				user=user.strip()
				if user:
					# Verify a user
					s.sendall('VRFY '+user+'\r\n')
			        	data = s.recv(4096)
			        	print repr(data)
	except:
		print 'file or socket exception :', sys.exc_info()[0]
	finally:
		# Close sockets
		f.close()
		s.close()



if __name__ == "__main__":
	main(sys.argv[1:])


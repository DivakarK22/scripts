from socket import gethostbyname, gethostname
sensu = gethostbyname('sensu')
jenkins = gethostbyname('jenkins')

print(jenkins+sensu)

import zipfile

for i in ['hello.py', 'work.zip', 'welcome.py', 'sample.txt', 'test.zip']:
	try:
		print('{:}        {}'.format(i, zipfile.is_zipfile(i)))
	except IOError as err:
		print('{:}        {}'.format(i, err))

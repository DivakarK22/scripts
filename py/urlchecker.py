import urllib.request


def check_website_status():
    prompt = "Please enter a website URL: "
    while True:
        # asks for URL to check
        # adds in https or http if necessary
        url = "http://sensu:3000"
        try:
            # tries to make a request to the URL that was input
            # uses defined headers that are not a "bot"
            headers = {}
            headers['User-Agent'] = ("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 \
            (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36")
            req = urllib.request.Request(url, headers=headers)
            page = urllib.request.urlopen(req)
            code = str(page.getcode())
            print('The website ' + url + ' has returned a ' + code + ' code')
            break
        except Exception as i:
                break


check_website_status()
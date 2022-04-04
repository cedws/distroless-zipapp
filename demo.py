import requests

def main():
    r = requests.get('https://wttr.in')
    print(r.text)

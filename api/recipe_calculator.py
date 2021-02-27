from urllib.request import urlopen
from bs4 import BeautifulSoup
import requests


def price_scrapping(URL):
    HEADERS = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0",
               "Accept-Encoding": "gzip, deflate",
               "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT": "1"
        , "Connection": "close", "Upgrade-Insecure-Requests": "1"}
    webpage = requests.get(URL, headers=HEADERS)
    soup = BeautifulSoup(webpage.content, "lxml")
    try:
        title = soup.find("span", attrs={"class": 'a-size-medium a-color-price priceBlockBuyingPriceString'})
        return float(title.text[2:])
    except AttributeError:
        return -1;


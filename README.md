46Elks SMS Cache
================

Discontinued in favor of MessageCache:  
https://github.com/hampusn/message-cache  

A really simple service which will store SMS recived from 46Elks. Built with Sinatra.

Github repository: https://github.com/hampusn/elks-sms-cache

### POST

Simulate an 46Elks sms POST to save the message to the cache with cURL. Query parameter `channel` is required.

	curl -X POST -F "to=+46701111111" -F "from=+46702222222" -F "message=Demo text message" 'https://user:pass@elks-sms-cache.example.com/sms?channel=test'

### GET

Simulate a GET request to the cache to get a JSON response with the latest sms with cURL. Query parameter `channel` is required. Optional parameter `n` (integer) can be used to choose the number of sms returned.

    curl 'https://user:pass@elks-sms-cache.example.com/sms?channel=test'

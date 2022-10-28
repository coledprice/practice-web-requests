require "http"
response = HTTP.get("http://anyonecanlearntocode")

p response.parse

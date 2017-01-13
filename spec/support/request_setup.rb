def http_client
  Teamweek::Api::Test::HttpClient.new('Authorization' => "Bearer #{ token }")
end

def token
  "sSGILoaLDq3W75c-RmhBl8vO5iAziCJjVYNOcFMzHn__GersDBI0SJByEXE42RYx9JADAxEQHN6vq-ce0DnI0D3gc2ZXcChymwu2NsGrc32RMbJQo89xIHDKG5nq9P7suU5JkBgFEA2ATGGJeoo_UAAlUUZDdjkWsZh2DVgHTx5xZ5Z1ET87HdcXVn2wHCHcopp8Tu2G6c_VE1f6kunViVTb3vMzW6Wrf5WZr9Wi52-54WCaqNRYoSUUsdYrS0S9DDbadX9egOoT76gPIHLC1LTEJyHcAdE-tQqXsv6p_G38PQPG8x6nzbi9jrgrZSwFzBjkN817dOnuZ2UfmZWoSQ=="
end

def workspace
  230525
end

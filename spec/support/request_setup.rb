def http_client
  Teamweek::Api::Test::HttpClient.new('Authorization' => "Bearer #{ token }")
end

def token
  "pyLIIhspoyjePeAh_M3X6MPJ-KngCn8-w6_-mOaHNF7hRKfhUQ10_Lvb7XAx65TXoZ2OyojYHXZpNxjAqHUsdU402iVxe1FssON6tEzxrT5hJ3YqcMC2l7qQZYWlGiz0m2n-7_qyfu2AADTnaWkUyCxXwD5CVRizArEbSG4NTgilPNEByZCWmkcUgjkhTsNzCrmRGHvu7rEqM12H3b5wivg_BWudmMmPJKPRJe-Vskkr4uIq0OQ6kz400jOYeI7pbBiOfMVrFYj4N6G7xm0bAqsNjii9Y2ma8Eck2C5yOPNrWPQsXNM6SbgSC1QvoDej79P0Wgh5rzxQuMXI9UyIIg=="
end

def client
   Teamweek::Api::Client.new(http_client, workspace)
end

def workspace
  230525
end

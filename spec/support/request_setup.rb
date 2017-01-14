def http_client
  Teamweek::Api::Test::HttpClient.new('Authorization' => "Bearer #{ token }")
end

def token
  "nXqn3Bt4Knud4NIc5yMaMNKEgOHIugO0CGIs69q84P1xobpiZ0msyGX8rssZFowcKNL7oVpxD5EUwgRG4zaBeuvTHCz_2GmasqCoEBpSnnHeTiAog87wq07UXVCo2RD8v3HOJve4RxoZLfnauOAlZtorWcXm2U6v6TmxHgFY2FA6tQg7oW0E-8A6eidvMpv6j1h2bBAlDayyimcSedFxu0G9n4eMrfOvmp4JgWtMyyKGrD8g57IPwReyiCvmkuuT-vTrjY4yApVqR2ud8etrAycmfoHNucxskTHKxisu0tEN8f8p7dy8g4NLBJnRp8WjeQ3xp80cCMscCU6vwebR7A=="
end

def client
   Teamweek::Api::Client.new(http_client, workspace)
end

def workspace
  230525
end

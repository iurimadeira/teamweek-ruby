require 'teamweek-ruby'
require 'teamweek/api/test/http_client'

token = "WQ0MtugXZ4R-Yxp8dy0-l3wxek0gPEHtu0JkNrpRw2Gs0uljWMlyZ3luqKMca9Z0UYS_-N4aN9XKvNvabtf958CqqRFMHFxphryHqQ0tYsBUfubjMMO7eEF0Zy5OZSp4mA2j5ul5T0TZ7qk8ZLRPpLTS7tZFKLHCuukiK1uHryWipITqbl99A_SwRl0_CkYHTsV0Eqg0Zj1xN45k_oL2OF2goR6UjDp3HnA9xunsL4tKaHyLVeK6cdUahe8PknnTEbGjORG2stRXHWInpJ9mro-FJwMy0-NCE1DYSAhkjRc5vqRraaILMU9AZMFNhdFkgTmjF96F9g0I7P4uchuCIw=="
workspace = 230525

http_client = Teamweek::Api::Test::HttpClient.new('Authorization' => "Bearer #{ token }")
puts Teamweek::Api::Client.new(http_client, workspace).fetch_tasks(filter_context: 'timeline').map(&:name)

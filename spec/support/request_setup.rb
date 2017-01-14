def http_client
  Teamweek::Api::Test::HttpClient.new('Authorization' => "Bearer #{ token }")
end

def token
  "Gl0sZQD_0iqNeMqk9MxKAyT3Gm-JJ79ZyCnTxphs7NWxohpRynnydv6B_x1drVN25o6m7dwBWUe7EljvJPlrZmiaW9pZMwQYi7GeayLdwVhNmymlYYX_N2yKgqc6IvtWWxUIIjR5RHrSZNkkKqpsWmZ8zZmcg2Z0depXaaUwB_PhNlW9h4CV4BYdnbgVCk8EKBZGm59U0zIJRs267jeyiRtlM6VvaNpqC7IFCZ971qgb5rH0mmr-fWFpicI2vMA_FS7KMStx-OaDnQeCt5fZZNoLziwEFtpLMdBJrFP5HEvpJWJk60GKuXl2FErcnffa7WlQL9TTARNCNZIjI9RCGA=="
end

def client
   Teamweek::Api::Client.new(http_client, workspace)
end

def workspace
  230525
end

def http_client
  Teamweek::Api::Test::HttpClient.new('Authorization' => "Bearer #{ token }")
end

def token
  "WKTp32hQr1HIC_v9cCG6LyoH_gRcLuBUxB9iC6xgGfoYXNQWnFOqqUC1ROluqtfOWbuUNPAuEiEXyKVT1v9VgIxnmc2WkbbwZs86f-1in8xa2ps0gkgD9jr8bCit33sLqf2SkPQPbhksq2BKuoL1S36GZzMwPUozajwIQ3wx9so2Wb3TOelCsFLyAZHAHDdz_9cPMnXw_hslpjesu-cevtC3_41UbJy_Lh5EBVfVe9o5Bl-IuSOPR7X3XclKi4uFzMxNvPl7pbl2FLpIJZOnb8PDHRQ6C7R-u91kDKv1oblrWamNcIFWMCYcynfGLcMwj1D41IP8Dz6gULdLcTXzZA=="
end

def client
   Teamweek::Api::Client.new(http_client, workspace)
end

def workspace
  230525
end

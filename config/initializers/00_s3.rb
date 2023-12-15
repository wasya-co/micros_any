

if true || Rails.env.development_production?
  ::S3_CREDENTIALS ||= {
    ## user: microsites3_development_s3
    ## 2023-08-16 _vp_
    access_key_id: "AKIA4DHE3QS7WBPACLAB", # aws user microsites3_development_s3
    secret_access_key: "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",
    bucket: "ish-development",
    region: 'us-east-1',

    access_key_id_ses: "AKIA4DHE3QS72VJ2I6XV",
    secret_access_key_ses: "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",
    bucket_ses: 'ish-ses',
    region_ses: 'us-east-1',
  }

else
  # ::S3_CREDENTIALS ||= {
  #   access_key_id: "AKIA4DHE3QS7WAKGKTJX", # aws user piousbox3
  #   secret_access_key: "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",
  #   bucket: "ish-production-1",
  #   bucket_ses: 'ish-ses',
  #   region: 'us-east-1',
  # }


end
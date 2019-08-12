CarrierWave.configure do |config|
  config.storage    = :fog
  config.aws_bucket = ENV["AWS_BUCKET"]
  config.aws_acl    = "public_read"

  config.aws_credentials = {
    access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
    secret_access_key: ENV["AWS_SECRET_KEY"],        # required
    region:            ENV["AWS_REGION"]
  }
end
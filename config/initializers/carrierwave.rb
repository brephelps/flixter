CarrierWave.configure do |config|
  if Rails.env.development?
    config.cache_dir = '/home/vagrant/uploads_tmp/tmp/uploads'
    config.root = '/home/vagrant/uploads_tmp/tmp'
  end

  config.fog_provider = 'fog/aws'                        # required
  config.fog_public = false
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
    aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required
  }
  config.fog_directory  = ENV["AWS_BUCKET"]              # required
end
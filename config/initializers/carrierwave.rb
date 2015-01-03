CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      ENV['S3_ACCESS_KEY_ID'],
    aws_secret_access_key:  ENV['S3_SECRET_ACCESS_KEY'],
  }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test?
    config.storage           = :file
    config.enable_processing = false
    config.root              = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  config.cache_dir        = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on Heroku
  config.fog_directory    = ENV['S3_BUCKET']
end

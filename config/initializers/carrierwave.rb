if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                        # required
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']
    }
    config.fog_directory  = "infractores-ba-#{Rails.env}"
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end

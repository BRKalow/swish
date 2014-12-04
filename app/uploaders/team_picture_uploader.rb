# encoding: utf-8

class TeamPictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}_#{mounted_as}"
  end

  def filename
    "#{secure_token(10)}.#{file.extension}" if original_filename.present?
  end

  def default_url
    ActionController::Base.helpers.asset_path('fallback/' + [version_name, 'default.png'].compact.join('_'))
  end

  process resize_to_fit: [100, 100]

  version :small do
    process resize_to_fit: [50, 50]
  end

  version :medium do
    process resize_to_fit: [80, 80]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  protected

  def secure_token(length = 16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(
      var,
      SecureRandom.hex(length / 2)
    )
  end
end

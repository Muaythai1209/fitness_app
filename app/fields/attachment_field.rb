require 'administrate/field/base'
require 'utils/converter'

class AttachmentField < Administrate::Field::Base
  include Rails.application.routes.url_helpers

  def attached?
    data.attached?
  end

  def custom_url?
    options[:custom_url]
  end

  def custom_download_path
    options.fetch(:custom_download_path)&.call(@resource)
  end

  def doc_keeper
    data.record
  end

  def attachment_file_name
    attached? ? data.filename : nil
  end
end

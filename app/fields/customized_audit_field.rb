require 'administrate/field/base'
require 'utils/converter'

class CustomizedAuditField < Administrate::Field::Base
  def to_s
    @resource.user_id.present? ? @resource.user.full_name : @resource.username
  end
end

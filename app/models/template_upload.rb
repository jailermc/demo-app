class TemplateUpload < ActiveRecord::Base
  has_one_attached :avatar
end

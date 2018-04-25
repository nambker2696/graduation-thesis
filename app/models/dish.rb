class Dish < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  include Searchable
end

class Dish < ApplicationRecord
    mount_uploader :image, ImageUploader
end

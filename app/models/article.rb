class Article < ApplicationRecord
  has_many_attached :photos
  acts_as_list
end

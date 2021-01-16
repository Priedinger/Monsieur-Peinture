class Article < ApplicationRecord
  has_many_attached :photos
  has_rich_text :content
  acts_as_list
end

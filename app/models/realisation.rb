class Realisation < ApplicationRecord
  has_many_attached :photos
  has_many_attached :newphotos

  acts_as_list
end

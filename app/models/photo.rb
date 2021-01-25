class Photo < ApplicationRecord
  has_many_attached :photos
  belongs_to :realisation, optional: true

  acts_as_list

end

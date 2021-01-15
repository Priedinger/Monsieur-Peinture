class Verbatim < ApplicationRecord
  has_one_attached :photo
  acts_as_list
end

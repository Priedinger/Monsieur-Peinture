class Realisation < ApplicationRecord
  has_many :photos

  acts_as_list
end

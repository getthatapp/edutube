class Link < ApplicationRecord
<<<<<<< HEAD
  acts_as_taggable
  belongs_to :user
=======

  acts_as_taggable
  belongs_to :user

>>>>>>> 5ee1d34cf7739c9312ae55a6503bfa2d2c7b2098
  validates :title, :link, presence: true
end
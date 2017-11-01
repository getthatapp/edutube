class Link < ApplicationRecord
  acts_as_taggable
  belongs_to :user

  validates :title, :link, presence: true
end
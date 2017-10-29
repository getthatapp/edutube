class Link < ApplicationRecord
  belongs_to :user
  validates :title, :link, presence: true
end
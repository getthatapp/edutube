class Link < ApplicationRecord
  validates :title, :link, presence: true
end
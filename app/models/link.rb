class Link < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_many :tags

  validates :title, :link, :tag_list, presence: true
end
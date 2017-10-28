class Link < ApplicationController
  validates :title, :link, presence: true
end
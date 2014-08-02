class Venue < ActiveRecord::Base
include ScraperMethods
  has_many :shows
end

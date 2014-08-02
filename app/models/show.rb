class Show < ActiveRecord::Base
include ScraperMethods
  has_many :comedians
  belongs_to :venue
end

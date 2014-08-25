class Movie < ActiveRecord::Base
  validates :name, :presence => true
  validates :year, :presence => true, :numericality => true
end
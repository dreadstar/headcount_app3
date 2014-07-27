class Location < ActiveRecord::Base
	has_many :rooms
	has_many :doors

	accepts_nested_attributes_for :rooms, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :doors, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
end

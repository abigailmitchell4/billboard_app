class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs, 
                                :reject_if => lambda { |a| a[:content].blank? }, 
                                :allow_destroy => true
                                
end

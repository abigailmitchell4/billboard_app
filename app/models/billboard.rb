class Billboard < ApplicationRecord
  has_many :songs #dependent: :destroy
  # belongs_to :artist, optional: :true
  accepts_nested_attributes_for :songs, 
                                :reject_if => lambda { |a| a[:content].blank? }, 
                                :allow_destroy => true
end

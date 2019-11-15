class Song < ApplicationRecord
  belongs_to :artist, required: true
  belongs_to :billboard, optional: true
end

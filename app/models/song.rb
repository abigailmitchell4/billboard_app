class Song < ApplicationRecord
  belongs_to :artist, class_name: "Song", required: true
  belongs_to :billboard, class_name: "Song", optional: true
end

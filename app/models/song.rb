class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album
end

class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :user # composer
  accepts_nested_attributes_for :user
end

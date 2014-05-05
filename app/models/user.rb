class User < ActiveRecord::Base
  has_one :profile
  has_many :songs

  def title
    "#{first_name} #{last_name}"
  end
end

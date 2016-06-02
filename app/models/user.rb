class User < ActiveRecord::Base
  has_many :albums #, :artists, :songs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

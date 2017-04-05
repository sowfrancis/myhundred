require 'elasticsearch/model'

class User < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  searchkick word_start: [:first_name]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :songs
  has_many :comments

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :movies

  mount_uploader :avatar, AvatarUploader

  User.import

  def fullname
    "#{first_name} #{last_name}"
  end
end

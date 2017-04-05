require 'elasticsearch/model'

class Song < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  searchkick word_start: [:name]

  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments

  Song.import

end

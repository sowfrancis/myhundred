require 'elasticsearch/model'

class Movie < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  searchkick word_start: [:title]
  belongs_to :user
end

class SongForm < Rectify::Form
  attribute :user_id, Integer
  attribute :name, String
  attribute :image, String
  attribute :link_music, String
  attribute :description, String

end
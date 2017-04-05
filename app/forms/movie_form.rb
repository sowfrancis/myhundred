class MovieForm < Rectify::Form
  attribute :user_id, Integer
  attribute :title,  String
  attribute :movie_img, String
end
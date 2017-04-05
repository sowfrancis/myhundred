module AutocompleteJquery

  def autocomplete_jq
    @songs = Song.search(params[:query],
                              fields: [:name, :image],
                              match: :word_start,
                              limit: 10
                              ).map{|song| {name: song.name, value: song.id, image: song.image.url}}
    @users = User.search(params[:query],
      fields: [:first_name, :avatar],
      match: :word_start,
      limit: 10).map {|user| {name: user.fullname, value: user.id, image: user.avatar.url}}
    @movies = Movie.search(params[:query], fields: [:title],
                            match: :word_start, limit: 10).map{|movie| {name: movie.title,
                                                                value: movie.id, image: movie.movie_img} }
    @results = @songs + @users + @movies
    render json: @results
  end

end
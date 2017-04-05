module SimpleSearch
  def searching
    if params[:q]
      @results = Song.search(params[:q],
                            index_name: [Song.searchkick_index.name,
                                        User.searchkick_index.name,
                                        Movie.searchkick_index.name
                                      ]
                            )
    else
      @songs = Song.all
    end
  end
end
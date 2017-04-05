class MoviesController < ApplicationController
  include SimpleSearch

  def index
    searching
    @movies = current_user.movies
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params_movie)
    fetch_data(@movie)
    if @movie.save
      redirect_to movies_path
    else
      rendirect_to new_song_path
    end
  end

  def autocomplete
    @movies = Tmdb::Search.movie(params[:query])
    @results = @movies.results.map{|movie| {title: movie.title, poster: img_api(movie), id: movie.id}}
    render json: @results
  end

  private

  def img_api(movie)
    config = Tmdb::Configuration.get
    base_url = config["images"].base_url
    size = config["images"].logo_sizes[0]
    "#{base_url}#{size}#{movie.poster_path}"
  end

  def img_api_size(movie)
    config = Tmdb::Configuration.get
    base_url = config["images"].base_url
    size = config["images"].logo_sizes[2]
    "#{base_url}#{size}#{movie.poster_path}"
  end

  def fetch_data(form)
    movie_search = Tmdb::Search.movie(form.title)
    movie = movie_search.results[0]
    form.title = movie.title
    form.movie_img = img_api_size(movie)
  end

  def params_movie
    params.require(:movie).permit(:title, :movie_img, :user_id, :story)
  end
end

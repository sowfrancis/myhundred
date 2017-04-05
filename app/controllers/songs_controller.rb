class SongsController < ApplicationController
  include SimpleSearch
  include AutocompleteJquery

  def index
    searching
    @song = Song.last
  end

  def new
    @song = Song.new
    @movie = Movie.new
  end

  def show
    @song = Song.find(params[:id])
    @comment = @song.comments.new
    @comments = Comment.all
  end

  def create
    @form = SongForm.from_params(params).with_context(user: current_user)

    CreateSong.call(@form, current_user) do
      on(:ok) {redirect_to songs_path, notice: "congrat"}
      on(:invalid) {redirect_to new_song_path, notice: "try again"}
    end
  end

  # def update
  #   @form = Song.find(params[:id])

  #   UpdateSong.call(@form, current_user) do
  #     on(:ok) {redirect_to song_path(@form), notice: "update done"}
  #     on(:invalid) {redirect_to edit_song_path, notice: "try again"}
  #   end
  # end

  def edit
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to user_path(current_user)
  end

  def autocomplete
    autocomplete_jq
  end
end

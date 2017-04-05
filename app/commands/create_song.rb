class CreateSong < Rectify::Command

  def initialize(form, current_user)
    @form = form
    @current_user = current_user
  end

  def call
    return broadcast(:invalid) if form.invalid?

    transaction do
      create_song
    end

    broadcast(:ok)
  end

  private

  attr_reader :form
  attr_reader :current_user

  def create_song
    @form = @current_user.songs.create(songs_attributes)
  end

  def songs_attributes
    {name: @form.name, description: @form.description, user_id: @form.user_id,
    image: @form.image,link_music: @form.link_music}
  end
end
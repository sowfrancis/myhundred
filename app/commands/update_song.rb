class UpdateSong < Rectify::Command

  def initialize(form, current_user)
    @form = form
    @current_user = current_user
  end

  def call
    return broadcast(:invalid) if form.invalid?

    transaction do
      update_song
    end

    broadcast(:ok)
  end

  private

  attr_reader :form
  attr_reader :current_user

  def update_song
    @form.update_attributes(songs_attributes)
  end

  def songs_attributes
    attribute = {name: @form.name, description: @form.description, user_id: @form.user_id,
    image: @form.image,link_music: @form.link_music}
  end
end
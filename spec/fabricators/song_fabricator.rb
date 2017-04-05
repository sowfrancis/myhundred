Fabricator(:song) do
  image {
    ActionDispatch::Http::UploadedFile.new(
      :tempfile => File.new(Rails.root.join('app', 'assets', 'images', 'ionic.png')),
      :type => 'image/png',
      :filename => File.basename(File.new(Rails.root.join('app', 'assets', 'images', 'ionic.png')))
    )
  }
  name "bala"
  description "music make me loose control"
end

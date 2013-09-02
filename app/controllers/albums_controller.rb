class AlbumsController < ActionController::Base

  def new
    @album = Album.new(:songs => [Song.new, Song.new])
    @form = Forms::AlbumForm.new(@album)
  end
end

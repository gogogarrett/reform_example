class AlbumsController < ActionController::Base

  def new
    album = Album.new(:songs => [Song.new, Song.new])
    @form = Forms::AlbumForm.new(album)
  end

  def create
    album = Album.new(:songs => [Song.new, Song.new])
    @form = Forms::AlbumForm.new(album)

    if @form.validate(params["album"])
      @form.save
    end

    render action: :new
  end

  def update
    album = Album.find(params[:id])

    @form = Forms::AlbumForm.new(album)

    if @form.validate(params["album"])
      @form.save
    end

    render action: :new
  end
end

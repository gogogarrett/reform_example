class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    # Build a random amount of songs
    album = Album.new
    (1+rand(7)).ceil.times do
      album.songs.build
    end
    @form = Forms::AlbumForm.new(album)
  end

  def edit
    album = Album.find(params[:id])
    @form = Forms::AlbumForm.new(album)
  end

  def create
    album = Album.new
    # Build a Song object for each song that was submitted from the form
    params[:album][:songs_attributes].size.times do
      album.songs.build
    end
    @form = Forms::AlbumForm.new(album)

    if @form.validate(params["album"])
      @form.save
      redirect_to album_path(album)
    else
      render :new
    end
  end

  def update
    album = Album.find(params[:id])
    @form = Forms::AlbumForm.new(album)

    if @form.validate(params["album"])
      @form.save
      redirect_to album_path(album)
    else
      render :edit
    end
  end

end

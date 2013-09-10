class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    album = Album.new

    (1+rand(7)).ceil.times do |i|
      album.songs.build
    end

    @form = Forms::AlbumForm.new(album)
  end

  def edit
    album = Album.find(params[:id])
    @form = Forms::AlbumForm.new(album)
  end

  def create
    album = Album.new(:songs => [Song.new, Song.new])
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

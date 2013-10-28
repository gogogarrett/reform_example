class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    album = Album.new
    @form = Forms::AlbumForm.new(album)
  end

  def edit
    album = Album.find(params[:id])
    @form = Forms::AlbumForm.new(album)
  end

  def create
    album = Album.new
    # dynamically added songs workaround
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
    # dynamically added songs workaround
    (params[:album][:songs_attributes].size - album.songs.size).times do
       album.songs.build
    end

    @form = Forms::AlbumForm.new(album)

    if @form.validate(params["album"])
      @form.save
      redirect_to album_path(album)
    else
      render :edit
    end
  end
end
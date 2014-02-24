class AlbumsController < ApplicationController
  respond_to :js, :html
  before_action :create_form, except: [:index]

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def create
    album = execute_album_workflow
    album ? respond_with(album) : render(:new)
  end

  def update
    album = execute_album_workflow
    album ? respond_with(album) : render(:edit)
  end

  private

  def execute_album_workflow
    Workflows::AlbumWorkflow.new(@form, params[:album]).process
  end

  def album
    @album ||= album_from_params.tap { |album| append_missing_songs(album) }
  end
  helper_method :album

  def album_from_params
    album = Album.find(params[:id]) if params[:id]
    album || Album.new
  end

  # dynamically added songs workaround
  def append_missing_songs(album)
    return unless params[:album] && params[:album][:songs_attributes]

    params_songs_count = params[:album][:songs_attributes].size
    album_songs_count = album.songs ? album.songs.size : 0

    (params_songs_count - album_songs_count).abs.times { album.songs.build }
  end

  def create_form
    @form = Forms::AlbumForm.new(album)
  end
end

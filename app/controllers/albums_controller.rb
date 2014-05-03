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
    @album ||= album_from_params
  end
  helper_method :album

  def album_from_params
    album = Album.find(params[:id]) if params[:id]
    album || Album.new
  end

  def create_form
    @form = Forms::AlbumForm.new(album)
  end
end

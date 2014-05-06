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
    execute_album_workflow(:new)
  end

  def update
    execute_album_workflow(:edit)
  end

  private

  def execute_album_workflow(action)
    album = Workflows::AlbumWorkflow.new(@form, params[:album]).process
    album ? respond_with(album) : render(action)
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

class ArtistsController < ApplicationController
  respond_to :js, :html
  before_action :create_new_form
  # before_action :create_edit_form, only: [:edit, :update]

  def index
    @artists = Artist.all
  end

  def show
  end

  private
  def artist
    @artist ||= Artist.find(params[:id])
  rescue
    aa = Artist.new
    aa.songs << [Song.new, Song.new, Song.new, Song.new]
    aa
  end
  helper_method :artist

  def create_new_form
    aa = Artist.new
    aa.songs << [Song.new]
    @form = Forms::ArtistForm.new(aa)
  end

  def create_edit_form
    @form = Forms::ArtistForm.new(artist)
  end
end

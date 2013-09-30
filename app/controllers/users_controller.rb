class UsersController < ApplicationController
  respond_to :js, :html
  before_action :create_new_form, only: [:new, :create]
  before_action :create_edit_form, only: [:edit, :update]

  def new
  end

  def index
    @users = User.all
  end

  def create
    workflow = Workflows::UserWorkflow.new(@form, params[:user])
    workflow.process do |user|
      return respond_with user
    end
    render :new
  end

  def update
    workflow = Workflows::UserWorkflow.new(@form, params[:user])
    workflow.process do |user|
      return respond_with user
    end
    render :edit
  end

  private
  def user
    @user ||= User.find(params[:id])
  end
  helper_method :user

  def profile
    user.profile
  end
  helper_method :profile

  def create_new_form
    @form = Forms::UserForm.new(user: User.new, profile: Profile.new)
  end

  def create_edit_form
    @form = Forms::UserForm.new(user: user, profile: user.profile)
  end
end

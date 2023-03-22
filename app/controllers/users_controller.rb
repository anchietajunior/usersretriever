# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    params[:search] ||= build_default_search_params
    @users = Users::Organizers::Search.call(params: params[:search]).users
    @pagy, @users = pagy(@users)
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    flash.now[:notice] = "User was successfully created."

    respond_to do |format|
      if @user.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend(@user, partial: "users/user", locals: { user: @user }),
            turbo_stream.update("flash", partial: "layouts/flash")
          ]
        end
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        flash.now[:notice] = "User was successfully updated."

        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(@user, partial: "users/user", locals: { user: @user }),
            turbo_stream.update("flash", partial: "layouts/flash")
          ]
        end

        # format.turbo_stream { render turbo_stream: turbo_stream.replace(@user, partial: "users/user", locals: { user: @user }) }
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def bulk_destroy
    # users_ids param is a string containing multiple ids, so i'll split it to become an Array
    users = User.where(id: params[:users_ids].split(",")).destroy_all

    respond_to do |format|
      format.html { redirect_to users_url, notice: "#{users.count} were deleted from the application." }
      format.json { head :no_content }
    end
  end

  def queue_fetch_job
    FetchUsersJob.perform_later
    redirect_to users_url, notice: "Fetch Jobs Enqueued"
  end

  private

  def build_default_search_params
    {
      name_or_email: "",
      gender: "",
      age: ""
    }.with_indifferent_access
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone, :gender, :height, :weigth, :birthdate, :image)
  end
end

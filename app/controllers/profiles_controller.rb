class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def show
  end

  def update
    @profile.update(profile_params)
    if @profile.save
      flash[:notice] = "Username updated successfully"
    else
      flash[:alert] = "#{@profile.errors.full_messages.join("\n")}"
    end
    redirect_to profile_path(current_user)
  end

  private

  def set_profile
    @profile = current_user.profile || current_user.build_profile
  end

  def profile_params
    params.require(:profile).permit(:username)
  end

end

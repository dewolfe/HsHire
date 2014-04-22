class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user=User.find(params[:id])

  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    @user=User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render :edit
    end
  end
  def dashboard
    @f_profile=Profile.limit(5)
  end
  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:address,:address2,:city,:provice,:postal,
                                :country,:email,:password,:password_confirmation)
  end
end

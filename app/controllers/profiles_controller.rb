class ProfilesController < ApplicationController
 # respond_to :html, :xml, :json
 before_filter :authenticate_user!

  def new
    @profile=Profile.new
  end

  def create
    @profile=current_user.build_profile
    if @profile.update_attributes(params[:profile])
      respond_to do |format|
        format.js {}
        format.html {redirect_to root_path}
      end
    else

    end
  end

  def show
   @profile=Profile.find(params[:id])
  end

  def edit
    @profile=current_user.profile
  end

  def send_message
   @profile=Profile.find(params[:id])
   UserMailer.profile_message(@profile,current_user,params[:subject],params[:message]).deliver
   respond_to do |format|
     format.js {render json:{:status => "ok", :message => "Success!"} }
   end
  end

  def update
  @profile=current_user.profile
  params[:profile][:avatar].blank? ? @avatar=false : @avatar=true
  if @profile.update_attributes(params[:profile])

    respond_to do |format|
      format.js {}
      format.html {redirect_to root_path}

    end
  else

    respond_to do |format|
      format.js {render json: @profile.errors.to_json}
      format.html {redirect_to root_path}
    end
    end
  end

 def remove_resume
   @profile=Profile.find(params[:id])
   @profile.remove_resume!
   @profile.save
   render :json => {:status => "ok", :message => "Success!"}

 end
private

def profile_params
  params.require(:profile).permit(:avatar)
end

end

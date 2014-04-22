class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    auth = request.env["omniauth.auth"]
    token = session[:invitation_token]
    @user = User.find_for_facebook_oauth(auth, current_user)
    if @user.new_record? && token.blank?

      flash[:notice]="You need an invite to join."
      redirect_to root_path

    elsif @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else

      if token && user = User.where(:invitation_token => token).first
        #somethi
      else
        user = User.new
      end

      user.apply_omniauth(auth)
      if user.valid?
        if user.invited?
          user.accept_invitation!
        else
          user.save
        end
        sign_in(:user, user)
        redirect_to user_url(user)
      else
        #app specific code
      end
    end

=begin
    session["devise.facebook_data"] = request.env["omniauth.auth"]
    redirect_to new_user_registration_url
=end
  end
end
=begin
  def twitter

  identity = #find user by omniauth provider and uid
      if identity
        #do all regular sign in stuff here
      else
        #no identity found
        token = session[:invitation_token]
        if token && user = User.where(:invitation_token => token).first
          #some app specific code
        else
          user = User.new
        end

        user.apply_omniauth(auth)
        if user.valid?
          if user.invited?
            user.accept_invitation!
          else
            user.save
          end
          sign_in(:user, user)
          redirect_to user_url(user)
        else
          #app specific code
        end
      end

  session[:invitation_token] = nil
  end
=end

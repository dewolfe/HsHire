class InvitationsController < Devise::InvitationsController
  before_filter :search
  # GET /resource/invitation/accept?invitation_token=abcdef
  def edit
    if params[:invitation_token] && self.resource = resource_class.to_adapter.find_first( :invitation_token => params[:invitation_token] )
      session[:invitation_token] = params[:invitation_token]
      render :edit
    else
      set_flash_message(:alert, :invitation_token_invalid)
      redirect_to after_sign_out_path_for(resource_name)
    end
  end

  # PUT /resource/invitation
  def update
    self.resource = resource_class.accept_invitation!(params[resource_name])

    if resource.errors.empty?
      session[:invitation_token] = nil
      set_flash_message :notice, :updated
      sign_in(resource_name, resource)
      respond_with resource, :location => after_accept_path_for(resource)
    else
      respond_with_navigational(resource){ render :edit }
    end
  end

  def new
    if current_user.invitation_limit == 0 &&  current_user.invitation_limit
      flash[:notice] = "No invitation left"
      redirect_to root_path
    else
      super
    end
  end

  def create
    super
    @q = Skill.search(params[:q])
  end
  def search
    @q = Skill.search(params[:q])
  end
end

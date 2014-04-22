class EndorsementsController < ApplicationController
  def new
  end

  def create
    @skill=Skill.find(params[:skil_id])
    @endor=@skill.endorsements.new
    @endor.user_id=current_user.id
    if @endor.is_user_unique?
      if @endor.save
        render :json => {:status => "ok", :message => "Success!"}
      else
        render :json => {:status => "ok", :message => "Success!"}
      end
    else
      render :json => {:status=> 'error', :message => "Not Unique!"}
    end
  end
  def check_valid
    @skill=Skill.find(params[:skil_id])
    if @skill.endorsements.collect{|e|e.user_id==current_user.id}.include?(true)
      render :json => {:status => "error", :message => "false"}
    elsif
      @skill.profile.user==current_user
      render :json => {:status => "error", :message => "own"}
    else

      render :json => {:status => "ok", :message => "true"}
    end
  end

end

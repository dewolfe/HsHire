class SkillsController < ApplicationController
  skip_before_filter :search
  def new
  @profile=Profile.find(params[:profile_id])
  @skill=@profile.skills.new
  end

  def create
    @profile=Profile.find(params[:profile_id])
    @skill=@profile.skills.new(params)
    @skill.save
     respond_to do |format|
       format.html
       format.js {render json: @skill}
     end
  end

  def index
    @skills=Skill.order(:name).where("name like ?","%#{params[:term]}%")
    render json: @skills.map(&:name)
  end

  def destroy
    @skill=Skill.find(params[:id])
    @skill.destroy
    end

  def search_results
    @q = Skill.search(params[:q])
    @skills = @q.result(:distinct => true)
  end

 def index_for_auto
   @skills=Skill.order(:name).where("name like ?","%#{params[:term]}%")
   render json: @skills.map(&:name).uniq
 end
end

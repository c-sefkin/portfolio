class SkillsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @skill = Skill.new
  end

  def create
    @project = Project.find(params[:project_id])
    @skill = @project.skills.new(skill_params)
    if @skill.save
      redirect_to project_path(@skill.project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @skill = Skill.find(params[:id])
  end

  def update
   @project = Project.find(params[:project_id])
   @skill = Skill.find(params[:id])
   if @skill.update(skill_params)
     flash[:notice] = "Skill successfully updated!"
     redirect_to project_path(@skill.project)
   else
     render :edit
   end
 end

 def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    flash[:notice] = "Skill successfully deleted."
    redirect_to project_path(@skill.list)
  end

private
  def skill_params
    params.require(:skill).permit(:description)
  end
end

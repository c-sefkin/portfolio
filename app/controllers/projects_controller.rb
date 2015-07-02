class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @projects = Project.new
  end

  def create
   @project = Project.new(project_params)
   if @project.save
     flash[:notice] = "Project Added"
     redirect_to projects_path
   else
     render :new
   end
 end

  def edit
    @project = Project.find(params[:id])
  end

  def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        flash[:notice] = "Project Updated"
        redirect_to project_path(@project)
      else
        render :edit
      end
    end


  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project successfully deleted"
    redirect_to projects_path
  end

private
  def project_params
    params.require(:project).permit(:name, :description, :github)
  end
end

class SectionController < ApplicationController
  def new
    @section=Section.new()
  end

  def create
    #create the new section
    @section=Section.new(section_params)
    #save the new section and if successful give notice and redirect to index
    if @section.save
      flash[:notice]="New section was created successfully"
      redirect_to(:action => 'index')
    #if it fails render page with data user has already entered
    else
      render('new')
    end

  end

  def index
    @sections=Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def edit
    @section=Section.find(params[:id])
  end

  def update
    #retrieve section
    @section=Section.find(params[:id])
    #save the new section and if successful give notice and redirect to index
    if @section.update_attributes(section_params)
      flash[:notice]="New section was updated successfully"
      redirect_to(:action => 'index')
      #if it fails render page with data user has already entered
    else
      render('edit')
    end
  end

  def delete
    @section=Section.find(params[:id])
  end

  def destroy
    section=Section.find(params[:id]).destroy
    flash[:notice]="The section was deleted successfully"
    redirect_to(:action=>'index')
  end

  private

  def section_params
    params.require(:section).permit(:page_id,:name, :position, :visible, :content_type, :content)
  end
end

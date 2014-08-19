class PageController < ApplicationController
  layout "admin"
  def index
    @pages=Page.all
  end

  def show
    @page=Page.find(params[:id])
  end

  def new
    @page=Page.new()
  end

  def create
    #instantiate a new object using form parameters
    @page = Page.new(page_params)
    #save the object
    if @page.save
      #if save succeeds, redirect to the index action
      flash[:notice]= "Page #{@page.name} created successfully"
      redirect_to(:action => 'index')
    else
      #if save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @page=Page.find(params[:id])
  end

  def update
    #find object with id
    @page = Page.find(params[:id])
    #update object
    @page.update_attributes(page_params)
    #save the object
    if @page.save
      #if save succeeds, redirect to the index action
      flash[:notice]= "Page #{@page.name} updated successfully"
      redirect_to(:action => 'index')
    else
      #if save fails, redisplay the form so user can fix problems
      flash[:error]= "Page #{@page.name} update failed"
      render('new')
    end
  end

  def delete
    @page=Page.find(params[:id])
  end

  def destroy
    #find object with id
    page=Page.find(params[:id])
    #delete the item
    page.destroy
    flash[:notice]= "Page deleted successfully"
    redirect_to(:action=>'index')
  end

  private

  def page_params
    params.require(:page).permit(:name, :subject_id, :position, :visible, :permalink)
  end

end

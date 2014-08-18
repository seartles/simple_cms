class SubjectsController < ApplicationController
  layout false
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name=>"Default"})
  end

  def create
    #instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    #save the object
      if @subject.save
      #if save succeeds, redirect to the index action
        flash[:notice]= "Subject #{@subject.name} created successfully"
        redirect_to(:action => 'index')
      else
      #if save fails, redisplay the form so user can fix problems
       render('new')
      end
  end

  def edit
    @subject=Subject.find(params[:id])
  end

  def update
    #find an existing Subject
    @subject=Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      #if update succeeds, redirect to the show action
      flash[:notice]= "Subject #{@subject.id} updated successfully"
      redirect_to(:action=>'show', :id=>@subject.id)
    else
      #if update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
   #retrieve subject for deletion
    @subject= Subject.find(params[:id])

  end

  def destroy
    subject=Subject.find(params[:id]).destroy
      #if delete succeeds, redirect to the index action
      flash[:notice]= "Subject ' #{subject.name} ' deleted"
      redirect_to(:action=>'index')
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end

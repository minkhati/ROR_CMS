class SubjectsController < ApplicationController
  layout 'admin' # specify the layout file used, by default application 


  def index
    @subjects = Subject.sorted
    
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    
    # Save the object
    if @subject.save
      # If save successeds, redirect to the index action
      flash[:notice] = "Subject created successfully."
      redirect_to subjects_path
    else
      # If save fails, redisplays the form so user can fix problems
      @subject_count = Subject.count + 1
      render 'new'
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    # Find a object using form parameters
    @subject = Subject.find(params[:id])
    
    # Update the object attributes
    if @subject.update_attributes(subject_params)
      # If update successeds, redirect to the show action
      flash[:notice] = "Subject updated successfully."
      redirect_to subject_path(@subject)
    else
      # If update fails, redisplays the form so user can fix problems
      @subject_count = Subject.count
      render 'edit'
    end
  end

  def delete
    # Find a object using form parameters
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' deleted successfully."
    redirect_to subjects_path
  end

  private 
  
    def subject_params
      params.require(:subject).permit(:page_id, :name, :position, :visible, :created_at)
    end

end

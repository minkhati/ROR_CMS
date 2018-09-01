class PagesController < ApplicationController
  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully."
      redirect_to pages_path
    else
      render 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    # Find a object using form parameters
    @page = Page.find(params[:id])
    
    # Update the object attributes
    if @page.update_attributes(page_params)
      # If update successeds, redirect to the show action
      flash[:notice] = "page updated successfully."
      redirect_to page_path(@page)
    else
      # If update fails, redisplays the form so user can fix problems
      render 'edit'
    end
  end

  def delete
    # Find a object using form parameters
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' deleted successfully."
    redirect_to pages_path
  end

  private 
  
    def page_params
      params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
    end
  
end

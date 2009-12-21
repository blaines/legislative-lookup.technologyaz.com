class LegislatorsController < ApplicationController
  def index
    @legislators = Legislator.all
  end
  
  def show
    @legislator = Legislator.find(params[:id])
  end
  
  def new
    @legislator = Legislator.new
  end
  
  def create
    @legislator = Legislator.new(params[:legislator])
    if @legislator.save
      flash[:notice] = "Successfully created legislator."
      redirect_to @legislator
    else
      render :action => 'new'
    end
  end
  
  def edit
    @legislator = Legislator.find(params[:id])
  end
  
  def update
    @legislator = Legislator.find(params[:id])
    if @legislator.update_attributes(params[:legislator])
      flash[:notice] = "Successfully updated legislator."
      redirect_to @legislator
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @legislator = Legislator.find(params[:id])
    @legislator.destroy
    flash[:notice] = "Successfully destroyed legislator."
    redirect_to legislators_url
  end
end

class ThumbnailsController < ApplicationController

  #Returns an image for the passed in screenshot
  def get_image_for_thumbnail
    @thumbnail = Thumbnail.find(params[:id])
    send_data(@thumbnail.data,
      :disposition => "inline" )
  end


  # GET /thumbnails/new
  # GET /thumbnails/new.xml
  def new
    @pattern = Pattern.find(params[:pattern_id])
    @thumbnail = Thumbnail.new
  end

  # GET /thumbnails/1/edit
  def edit
    @thumbnail = Thumbnail.find(params[:id])
    @pattern = @thumbnail.pattern
  end

  # POST /thumbnails
  # POST /thumbnails.xml
  def create
    @pattern = Pattern.find(params[:pattern_id])
    @thumbnail = Thumbnail.new(params[:thumbnail])
    if request.post? and @thumbnail.save and @pattern.thumbnail=@thumbnail and @pattern.update_attribute(:status, "needs_approval")
      flash[:notice] = "Thumbnail was successfully uploaded to #{@pattern.name}."
      redirect_to(:controller => 'patterns', :action => 'editing_pattern', :id => @pattern)
      #      redirect_to(:controller => "edit_history", :action => "add_edit", :id => @pattern)
    else
      render :action => "new"
    end
  end

 
  def update
    @pattern = Pattern.find(params[:pattern_id])
    if @pattern.thumbnail.update_attributes(params[:thumbnail]) and @pattern.update_attribute(:status, "needs_approval")
      flash[:notice] = "Thumbnail was successfully uploaded to #{@pattern.name}."
      redirect_to(:controller => 'patterns', :action => 'editing_pattern', :id => @pattern)
    else
      render :action => "edit"
    end
  end

end

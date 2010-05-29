class ScreenshotController < ApplicationController
  # Attempts to create and add an screenshot to the pattern
  def create_screenshot
    @pattern = Pattern.find(params[:id])
    screenshot = Screenshot.new(params[:screenshot])
    if request.post? and screenshot.save and @pattern.screenshots << screenshot
      if request.xhr?
        render(:partial => "list_editable", :locals => { :pattern => @pattern})
      else
        return_safely_to_page("Screenshot was successfully added.", nil)
      end
    else
      errors = "<h2>Error</h2><br/>"
      screenshot.errors.full_messages.each {|msg| "<p>" + errors += msg + "</p>"}
      if request.xhr?
        render :text => "<div id=\"errorExplanation\"><p>#{errors}</p></div>", :status => 404
      else
        return_safely_to_page(nil, errors)
      end     
    end
  end

  # Attempts to destroy the screenshot
  def destroy_screenshot
    if request.delete? and Screenshot.destroy(params[:screenshot_id])
      if request.xhr?
        pattern = Pattern.find(params[:id])
        render(:partial => "list_editable", :locals => { :pattern => pattern })
      else
        return_safely_to_page("Successfully removed screenshot", nil)
      end
    else
      if request.xhr?
        render :text => "<div id=\"errorExplanation\"><h2>Error</h2><p>Error in removing screenshot</p></div>", :status => 404
      else
        return_safely_to_page(nil, "<h2>Error</h2><p>Error in removing screenshot</p>")
      end
    end
  end

  #Returns an image for the passed in screenshot
  def get_image_for_screenshot
    @image = Screenshot.find(params[:id])
    send_data(@image.data,
      :filename => @image.name,
      :type => @image.content_type,
      :disposition => "inline" )
  end

  private

  # Will attempt to return to the last url (:back). If uncussessful, will return
  # to the pattern path.
  def return_safely_to_page(msg = nil, in_errors = nil)
    begin
      flash[:notice] = msg if msg
      flash[:errors] = in_errors if in_errors
      redirect_to :back
    rescue
      flash[:errors] = "<p>Error in site navigation, the procedure was completed though</p>"
      redirect_to(pattern_path)
    end
  end

end

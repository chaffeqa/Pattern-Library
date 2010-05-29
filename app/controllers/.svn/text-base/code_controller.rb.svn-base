class CodeController < ApplicationController
  # Attempts to create and add an code example to the pattern
  def create_code
    @pattern = Pattern.find(params[:id])
    code = Code.new(params[:code])
    if request.post? and code.save and @pattern.codes << code
      if request.xhr?
        render(:partial => "list_editable", :locals => { :pattern => @pattern})
      else
        return_safely_to_page("Code was successfully added.", nil)
      end
    else
      errors = "<h2>Error</h2><br/>"
      code.errors.full_messages.each {|msg| errors += msg + "<br/>"}
      if request.xhr?
        render :text => "<div id=\"errorExplanation\">#{errors}</div>", :status => 404
      else
        return_safely_to_page(nil, errors)
      end
    end
  end

  # Attempts to destroy the code example
  def destroy_code
    if request.delete? and Code.destroy(params[:code_id])
      if request.xhr?
        pattern = Pattern.find(params[:id])
        render(:partial => "list_editable", :locals => { :pattern => pattern })
      else
        return_safely_to_page("Successfully removed code", nil)
      end
    else
      if request.xhr?
        render :text => "<div id=\"errorExplanation\"><h2>Error</h2><br/>Error in removing code</div>", :status => 404
      else
        return_safely_to_page(nil, "<h2>Error</h2><br/>Error in removing code")
      end
    end
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
      flash[:errors] = "Error in site navigation, the procedure was completed though"
      redirect_to(pattern_path)
    end
  end

end

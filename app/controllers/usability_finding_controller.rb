class UsabilityFindingController < ApplicationController
  # Attempts to create and add an usability finding to the pattern
  def create_finding
    pattern = Pattern.find(params[:id])
    usability_finding = UsabilityFinding.new(params[:usability_finding])
    if request.post? and usability_finding.save and pattern.usability_findings << usability_finding
      if request.xhr?
        render :update do |page|
          page.replace_html 'usability_list' , :partial => 'list_editable', :locals => { :pattern => pattern }
        end
      else
        return_safely_to_page("Usability Finding was successfully added.", nil)
      end
    else
      errors = "<h2>Error</h2><br/>"
      usability_finding.errors.full_messages.each {|msg| errors += msg + "<br/>"}
      if request.xhr?
        render :update do |page|
          page.replace_html 'error_list', "<div id=\"errorExplanation\">#{errors}</div>"
        end
      else
        return_safely_to_page(nil, errors)
      end
    end
  end

  # Attempts to destroy the usability finding
  def destroy_finding
    if request.delete? and UsabilityFinding.destroy(params[:finding_id])
      if request.xhr?
        pattern = Pattern.find(params[:id])
        render :update do |page|
          page.replace_html 'usability_list' , :partial => "list_editable", :locals => { :pattern => pattern }
        end
      else
        return_safely_to_page("Successfully removed usability finding", nil)
      end
    else
      if request.xhr?
        #TODO broken error return!!!


        
        render :update do |page|
          page.replace_html 'error_list', "<div id=\"errorExplanation\"><h2>Error</h2><br/>Error in removing usability finding</div>"
        end
      else
        return_safely_to_page(nil, "<h2>Error</h2><br/>Error in removing usability finding")
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

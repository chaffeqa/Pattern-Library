class PatternsAdminController < ApplicationController
  before_filter :authorize_administrator
  
  def submitted_patterns
    @needs_approval_patterns = Pattern.find_all_by_status("needs_approval")
  end

  def view_pattern
    @pattern = Pattern.find(params[:id])
  end

  def approve_pattern
    @pattern = Pattern.find(params[:id])
    if request.post? and @pattern.update_attribute(:status, "approved")
      expire_pattern_listing_caches
      redirect_to :action => "submitted_patterns"
    else
      render :action => "view_pattern"
    end
  end

  def reject_pattern
    @pattern = Pattern.find(params[:id])
    if request.post? and @pattern.update_attribute(:status, "rejected")
      redirect_to :action => "submitted_patterns"
    else
      render :action => "view_pattern"
    end
  end

end

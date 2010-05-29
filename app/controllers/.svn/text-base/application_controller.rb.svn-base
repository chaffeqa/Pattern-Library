# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "patterns"
  #before_filter :authorize, :except => :login
  helper :all # include all helpers, all the time
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery 

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  filter_parameter_logging :password

  protected
  # Checks to see if the user is logged in. If not, redirects the user to his
  # last URL, and if that doesn't exist, the pattern home.
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
      if request.env["HTTP_REFERER"]
        redirect_to(:back)
      else
        redirect_to(:controller => "patterns")
      end
    end
  end

  # Checks to see if the user is logged in and an Administrative role.
  # If not, redirects the user to his last URL, and if that doesn't exist, the
  # pattern home.
  def authorize_administrator
    unless User.find_by_id(session[:user_id]) and
        (User.find_by_id(session[:user_id])).roles.exists?(:name => 'Administrative')
      flash[:errors] = "<h2>Request Denied</h2><p>You are not an Administrator</p>"
      if request.env["HTTP_REFERER"]
        redirect_to(:back)
      else
        redirect_to(:controller => "patterns")
      end
    end
  end

  # Checks to see if the user is logged in and a Contributor or Administrator role.
  # If not, redirects the user to his last URL, and if that doesn't exist, the
  # pattern home.
  def authorize_contributor
    unless (User.find_by_id(session[:user_id]) and
          ((User.find_by_id(session[:user_id])).roles.exists?(:name => 'Administrative') or
            (User.find_by_id(session[:user_id])).roles.exists?(:name => 'Contributor')))
      flash[:errors] = "<h2>Request Denied</h2><p>You are not an authorized contributor to this site.</p>"
      if request.env["HTTP_REFERER"]
        redirect_to(:back)
      else
        redirect_to(:controller => "patterns")
      end
    end
  end

  def expire_pattern_listing_caches
#    expire_action(:controller => 'patterns', :action => 'index')
    expire_fragment('full_menu')
    expire_fragment('group_menu')
#    expire_fragment('related_menu')
  end
end

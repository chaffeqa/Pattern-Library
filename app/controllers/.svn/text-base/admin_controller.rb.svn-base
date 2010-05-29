class AdminController < ApplicationController

  def faq
  end

  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        if request.xhr?
          render :update do |page|
            page.replace_html 'login-div' , :partial => 'logout', :locals => { :user => user }
            page.replace_html 'top-menu' , :partial => 'layouts/top_menu'
            page.replace_html 'admin-menu' , :partial => 'layouts/side_admin_menu'
            page.replace_html 'login-errors', :text => ""
          end
        else
          flash[:notice] = "Logged in successfully!"
          redirect_to :back
        end
      else
        if request.xhr?
          render :update do |page|            
            page.replace_html 'login-div' , :partial => 'login'
            page.replace_html 'login-errors', :text => "<div id='login_error_list'><h2>Error in Credentials</h2><p>Invalid user name or password.</p></div>"
          end
        else
          flash[:errors] = "Invalid user/password combination"
          redirect_to :back
        end        
      end
    end
  end

  def logout
    session[:user_id] = nil
    if request.xhr?
      render :update do |page|
        page.replace_html 'login-div' , :partial => 'login'
        page.replace_html 'top-menu' , :partial => 'layouts/top_menu'
        page.replace_html 'admin-menu' , :partial => 'layouts/side_admin_menu'
      end
    else
      flash[:notice] = "Successfully Logged Out"
      redirect_to :back
    end
  end
  

end

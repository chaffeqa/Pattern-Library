class MenuController < ApplicationController
  before_filter :authorize_administrator, :except => {:add_menu, :remove_menu}

  def index
    @parent_menus = ParentMenu.all(:order => :name)
  end

  #--------------------------- Parent Menu Actions ------------------------#

  def new_parent_menu
    @parent_menu = ParentMenu.new
  end

  def create_parent_menu
    @parent_menu = ParentMenu.new(params[:parent_menu])
    if request.post? and @parent_menu.save
      flash[:notice] = "#{@parent_menu.name} Menu successfully created"
      redirect_to :action => "index"
    else
      render :action => "new_parent_menu"
    end
  end

  def destroy_parent_menu
    if request.delete? and ParentMenu.destroy(params[:id])
      flash[:notice] = "Menu and all submenus successfully deleted"
    else
      flash[:error] = "Error in deleting menu"
    end
    redirect_to :action => "index"
  end


  #--------------------------- Sub Menu Actions ------------------------#

  def new_menu
    @parent_menu = ParentMenu.find(params[:id])
    @menu = @parent_menu.menus.new
  end

  def create_menu
    @parent_menu = ParentMenu.find(params[:id])
    @menu = @parent_menu.menus.new(params[:menu])
    if request.post? and @menu.save
      flash[:notice] = "Menu successfully created to #{@parent_menu.name}"
      redirect_to :action => "index"
    else
      render :action => "new_menu"
    end
  end

  def destroy_menu
    if request.delete? and Menu.destroy(params[:id])
      flash[:notice] = "Submenus successfully deleted"
    else
      flash[:error] = "Error in deleting submenu"
    end
    redirect_to :action => "index"
  end


  #--------------------------- Pattern Actions ------------------------#

  # Called when a menu is attempting to be added to a pattern, will only add it
  # if the pattern doesn't already have a menu with that name
  def add_menu
    pattern = Pattern.find(params[:id])
    menu = Menu.find(params[:menu_id])
    if request.post? and not pattern.menus.exists?(:name => menu.name) and pattern.menus << menu
      if request.xhr?
        render :update do |page|
          page.replace_html 'menu_list', :partial => 'list_editable', :locals => { :pattern => pattern }
        end
      else
        return_safely_to_page("#{pattern.name} was successfully added to menu: #{menu.name}.",nil)
      end
    else
      errors = "<div id=\"errorExplanation\"><h2>Error</h2><br/>Unable to add menu to #{pattern.name}</div>"
      if request.xhr?
        render :update do |page|
          page.replace_html 'error_list', errors
        end
      else
        return_safely_to_page(nil,errors)
      end
    end
  end



  # Attempts to remove the menu from the pattern, NOT destroy()
  def remove_menu
    pattern = Pattern.find(params[:id])
    menu = Menu.find(params[:menu_id])
    if request.delete? and pattern.menus.delete(menu)
      if request.xhr?
        render :update do |page|
          page.replace_html 'menu_list' , :partial => "list_editable", :locals => { :pattern => pattern }
        end
      else
        return_safely_to_page("Successfully removed menu",nil)
      end
    else
      if request.xhr?
        
        #TODO broken error return!!!

        render :update do |page|
          page.replace_html 'error_list', "<div id=\"errorExplanation\"><h2>Error</h2><br/>Error in removing menu</div>"
        end
      else
        return_safely_to_page(nil,"Error in removing #{menu.name} menu.")
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
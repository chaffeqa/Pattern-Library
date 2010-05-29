# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # --------------------------- Basic View Helpers ------------------------ #
  # Returns the user object if there is a logged in user, nil otherwise
  def get_user
    user = User.find_by_id(session[:user_id])
    user
  end

  # --------------------------- Basic View Helpers ------------------------ #
  # Returns the user object if there is a logged in user, nil otherwise
  def current_user
    user = User.find_by_id(session[:user_id])
    user
  end

  # Returns the current user's groups (Not model Objects), nil otherwise
  def get_user_groups
    groups = nil
    groups = get_user.groups.collect {|group| group.name} if get_user
    groups
  end

  # Returns true if there is a logged in administrative user
  def is_admin
    user = User.find_by_id(session[:user_id])
    if user and user.roles.exists?(:name => 'Administrative')
      return true
    end
    return false
  end

  def can_edit_pattern(pattern_id)
    user = get_user
    return (user and ( Pattern.find(pattern_id).user == user or user.roles.exists?(:name => 'Administrative') ))
  end

  def get_creation_date(object)
    if object.created_at
      return object.created_at.strftime("%m/%d/%Y")
    end
    return "Error in retrieving date"
  end

  
  # ----------------------------- Side Menu -------------------------- #

  # Returns a 3 dimensional array of the full menu heirarchy
  def get_menu(type)
    menu = []
    parent_menus = ParentMenu.all
    parent_menus.each {|parent_menu| 
      menu << [parent_menu.name, get_submenus(parent_menu, type)] }
    menu
  end

  # returns an array of submenus for the parent_menu each with its full array
  # of child patterns
  def get_submenus(parent_menu, type)
    submenu = []
    submenus = parent_menu.menus
    submenus.each {|a_sub_menu|
      submenu << [a_sub_menu.name, a_sub_menu.patterns.find(:all, :conditions => "status = 'approved'")]
    } if type == "full"
    submenus.each {|a_sub_menu|
      submenu << [a_sub_menu.name, get_group_patterns(a_sub_menu)]
    } if type == "group"
    submenus.each {|a_sub_menu|
      submenu << [a_sub_menu.name, get_related_patterns(a_sub_menu)]
    } if type == "related"
    submenu
  end

  #--------------------------- Group Patterns Menu -------------------------#

  # Returns an array of the patterns pertaining to the user's groups for this
  # submenu.
  def get_group_patterns(menu)
    user = User.find_by_id(session[:user_id])
    patterns = []    
    if user and menu and user.groups.count > 0
      patterns = menu.patterns.find(:all, :conditions => "status = 'approved'")
      tags = []
      user.groups.each {|group| tags << group.tag}
      tags.each {|tag|
        patterns.delete_if {|pattern|
          not pattern.tags.include?(tag)
        }
      }
    end
    patterns.uniq
  end

  # Returns the number of submenus with patterns pertaining to the user's groups
  def get_submenu_group_count(parent_menu)
    menu_count = 0
    for menu in parent_menu.menus
      menu_count += 1 if get_group_patterns(menu).size > 0
    end
    menu_count
  end

  #--------------------------- Related Patterns Menu -------------------------#

  # Returns an array of the patterns pertaining to the related patterns of the
  # current pattern for this submenu.
  def get_related_patterns(menu)
    if controller.controller_name == "patterns" and controller.action_name == "show" 
      user = User.find_by_id(session[:user_id])
      patterns = []
      current_pattern = Pattern.find(params[:id])
      if user and menu and user.groups.count > 0 and current_pattern
        menu_patterns = menu.patterns.find(:all, :conditions => "status = 'approved'")
        tags = current_pattern.tags
        # Remove group tags
        groups = Group.all
        groups.each { |group| tags.delete_if { |tag| tag == group.tag }  }
        tags.each {|tag|
          patterns += (tag.patterns & menu_patterns)
        }
        patterns.delete_if {|pattern| pattern.id == current_pattern.id}
      end
    end
    patterns.uniq
  end


  # --------------------------  Formating Output -------------------------- #

  def format_output(string)
    escaped_html_string = h(string)
    # Check for lists
    if escaped_html_string.include? '*'
      escaped_html_string = format_star_list(escaped_html_string)
    end
    if escaped_html_string.include? '#'
      escaped_html_string = format_pound_list(escaped_html_string)
    end
    # Check for numbered lists
    if escaped_html_string.include? "1."
      escaped_html_string = format_numbered_list(escaped_html_string)
    end
    if @terms
      return link_terms(escaped_html_string)
    end
    escaped_html_string
  end

  # formats a string containing a unordered (* sdkflsdj * ldskf) list
  def format_star_list(string)
    string.sub!('*', '<ul><li>')
    string.sub!('*', '</li><li>') while string.count('*') > 0
    string << "</li></ul>"
    string
  end

  # formats a string containing a unordered (# sdkflsdj # ldskf) list
  def format_pound_list(string)
    string.sub!('#', '<ul><li>')
    string.sub!('#', '</li><li>') while string.count('#') > 0
    string << "</li></ul>"
    string
  end

  # formats a string containing a unordered (- sdkflsdj - ldskf) list
  #    def format_minus_list(string)
  #      string.sub!('- ', '<ul><li>')
  #      string.sub!('- ', '</li><li>') while string.count('- ') > 0
  #      string << "</li></ul>"
  #      string
  #    end

  # formats a string containing a numbered (1. sdkflsdj 2. ldskf) list
  def format_numbered_list(string)
    string.sub!('1.', '<ol><li>')
    num = 2
    while string.include? "#{num}."
      string.sub!("#{num}.", '</li><li>')
      num += 1
    end
    string << "</li></ol>"
    string
  end

  def link_terms(string)
    array = string.split
    ret_string = ""
    for word in array
      compare_word = word.downcase
      term = ""
      @terms.each {|entry| (term = entry.id if compare_word =~ Regexp.new(entry.term.downcase))}
      if term != ""
        ret_string << "#{link_to(word, {:controller => 'terms', :action => 'show', :id => term})} "
      else
        ret_string << word + " "
      end
    end
    ret_string
  end
  
end

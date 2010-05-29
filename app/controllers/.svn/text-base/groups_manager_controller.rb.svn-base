class GroupsManagerController < ApplicationController
  before_filter :authorize_administrator
  def index
    @users = User.find(:all, :order => :name)
    @groups = Group.find(:all)
  end

  def add_group_to_user
    user = User.find(params[:user_id])
    group = Group.find(params[:group_id])
    if request.post? and not user.groups.exists?(group.id) and user.groups << group
      return_safely_to_page("#{group.name} was successfully added to user: #{user.get_display_name}.",nil)

    else
      errors = "<h2>Error</h2><br/>Unable to add group to user."
      return_safely_to_page(nil,errors)
    end
  end

  def remove_group_from_user
    right = AssignedGroup.find_by_group_id_and_user_id(params[:group_id], params[:user_id])
    if request.post? and right.destroy
      return_safely_to_page("Successfully removed #{Group.find(params[:group_id]).name} group from #{User.find(params[:user_id]).get_display_name}", nil)
    else
      return_safely_to_page(nil, "<h2>Error</h2><br/>Error in removing group from user")
    end
  end

  private

  # Will attempt to return to the last url (:back). If uncussessful, will return
  # to the pattern path.
  def return_safely_to_page(msg = nil, in_errors = nil)
    begin
      flash[:notice] = msg if msg
      flash[:errors] = in_errors if in_errors
      redirect_to(:action=>'index' )
    rescue
      flash[:errors] = "Error in site navigation, the procedure was completed though"
      redirect_to(:action=>'index' )
    end
  end

end


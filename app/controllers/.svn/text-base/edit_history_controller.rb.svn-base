class EditHistoryController < ApplicationController
  def add_edit
    @edit_history = EditHistory.new
    @pattern = Pattern.find(params[:id])
    @user = User.find_by_id(session[:user_id])
    expire_pattern_listing_caches
  end

  def create_edit
    @edit_history = EditHistory.new(params[:edit_history])
    @pattern = Pattern.find(params[:pattern_id])
    @user = User.find_by_id(session[:user_id])
    @edit_history.pattern = @pattern
    @edit_history.user = @user
    if @edit_history.save
      redirect_to(:controller => "patterns", :action => "show", :id => @pattern)
    else
      render :action => "add_edit"
    end
  end

  def pattern_edit_history
    @pattern = Pattern.find(params[:id])
    @edit_history = EditHistory.paginate_by_pattern_id @pattern.id, :page => params[:page] || 1, :per_page => 3, :order => 'created_at DESC'
  end

end

class TagController < ApplicationController


  # Called when a tag is attempting to be added to a pattern, will only add it
  # if the pattern doesn't already have a tag with that name
  def add_tag
    pattern = Pattern.find(params[:id])
    tag = Tag.find(params[:tag_id])
    if request.post? and not pattern.tags.exists?(:name => tag.name) and pattern.tags << tag
      if request.xhr?
        render :update do |page|
          page.replace_html 'tag_list' , :partial => 'list_editable', :locals => { :pattern => pattern }
          page.replace_html 'flashNotice', nil
          page.replace_html 'error_list', nil
        end
      else
        return_safely_to_page("tag: #{tag.name} was successfully added to #{pattern.name}.",nil)
      end
    else
      errors = "<div id=\"errorExplanation\"><h2>Error</h2><p>Error in adding #{tag.name} tag to #{pattern.name}.</p></div>"
      if request.xhr?
        render :update do |page|
          page.replace_html 'flashNotice', nil
          page.replace_html 'error_list', errors
        end
      else
        return_safely_to_page(nil,errors)
      end
    end
  end


  # Called when a new tag is attempting to be made, will only add the tag if 
  # the tag doesn't already exist and the pattern doesn't already have a tag
  # with that name
  def create_tag
    pattern = Pattern.find(params[:id])
    puts params[:tag]["name"]
    if Tag.exists?(params[:tag])
      tag = Tag.find_by_name params[:tag]["name"]
    else
      tag = Tag.create(params[:tag])
    end
    if request.post? and not pattern.tags.exists?(:name => tag.name) and pattern.tags << tag
      if request.xhr?
        render :update do |page|
          page.replace_html 'tag_list' , :partial => 'list_editable', :locals => { :pattern => pattern }
          page.replace_html 'flashNotice', nil
          page.replace_html 'error_list', nil
        end
      else
        return_safely_to_page("#{pattern.name} was successfully added to tag: #{tag.name}.",nil)
      end
    else
      errors = "<div id=\"errorExplanation\"><h2>Error</h2><p>Unable to add tag to #{pattern.name}</p></div>"
      if request.xhr?
        render :update do |page|
          page.replace_html 'flashNotice', nil
          page.replace_html 'error_list', errors
        end
      else
        return_safely_to_page(nil,"Error in adding #{tag.name} tag to #{pattern.name}.")
      end
    end
  end


  # Attempts to remove the tag from the pattern, NOT destroy()
  def remove_tag
    pattern = Pattern.find(params[:id])
    tag = Tag.find(params[:tag_id])
    if request.delete? and pattern.tags.delete(tag)
      tag.check_if_unassigned
      if request.xhr?       
        render :update do |page|
          page.replace_html 'tag_list' , :partial => "list_editable", :locals => { :pattern => pattern }
          page.replace_html 'flashNotice', nil
          page.replace_html 'error_list', nil
        end
      else
        return_safely_to_page("Successfully removed tag",nil)
      end
    else
      if request.xhr?
        render :update do |page|
          apage.replace_html 'flashNotice', nil
          page.replace_html 'error_list', "<div id=\"errorExplanation\"><h2>Error</h2><p>Error in removing tag</p></div>"
        end
      else
        return_safely_to_page(nil,"Error in removing #{tag.name} tag.")
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

module PatternsHelper

  # Returns the url for a javascript call to one of the pattern associated objects.
  # Pass in the target url, then, if the javascript is disabled the controller will degrade
  # and call the return_url path, which is default set to this current url
  # Example:
  #
  # <% get_url_and_parameters("this","is","1","/patterns/add_tags_and_menus/#{@pattern.id}") %>
  #
  # Gives:
  # 
  # # <% /this/is/1?return_url=/patterns/add_tags_and_menus/4 %>
  #
  # get_url_and_parameters("tag","add_tag","#{@pattern.id}","/patterns/add_tags_and_menus/#{@pattern.id}")
  def get_url_and_parameters(target_controller, target_action, target_id, return_url = request.request_uri)
    url = url_for( :controller => target_controller,
      :action => target_action,
      :id => target_id,
      :return_url => return_url
    )
    return url
  end
end

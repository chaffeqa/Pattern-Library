class SitemapController < ApplicationController
  layout nil
  caches_action :index, :layout => false, :expires_in => 24.hours

  def index
    headers['Content-Type'] = 'application/xml'
      respond_to do |format|
        format.xml { @patterns = Pattern.all } # sitemap is a named scope
      end
  end

end

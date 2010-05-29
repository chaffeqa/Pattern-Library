module SitemapHelper
  def w3c_date(date)
    date.utc.strftime("%Y-%m-%d")
  end

end

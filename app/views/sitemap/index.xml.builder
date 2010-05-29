base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version=>'1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  for pattern in @patterns do
    xml.tag! 'url' do
      xml.tag! 'loc', "#{base_url}/pattern-library/patterns/#{pattern.id}"
      xml.tag! 'lastmod', w3c_date(pattern.updated_at)
      xml.tag! 'changefreq', 'monthly'
      xml.tag! 'priority', '0.5'
    end
  end
end

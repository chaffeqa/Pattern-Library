namespace :utils do
  desc "Sets all patterns with no author to an author named 'Quinn Chaffee'"
  task :db_set_unknown_patterns => :environment do
    puts "Setting all patterns with no author to an author named 'Quinn Chaffee'..."
    patterns = Pattern.find(:all, :conditions => "user_id IS NULL")
    quinn = User.find_by_name "Quinn Chaffee"
    for pattern in patterns
      pattern.update_attribute(:user_id, quinn.id)
    end
    patterns.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}
    puts "Completed!"
  end
end
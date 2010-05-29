namespace :utils do
  desc "Sets all pattern status to 'needs_approval'"
  task :set_pattern_status => :environment do
    puts "Setting all pattern status to 'needs_approval'..."
    patterns = Pattern.find(:all)
    for pattern in patterns
      pattern.update_attribute(:status, "needs_approval")
    end
    patterns.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}
    puts "Complete"
  end
end
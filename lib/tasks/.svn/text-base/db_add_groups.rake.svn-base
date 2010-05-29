namespace :utils do
  desc "Adds default groups to Groups"
  task :add_groups => :environment do
    puts "Adding default groups..."
    groups = Group.create(
      [ { :name => "Pagasus" },
        { :name => "RUMBA" },
        { :name => "Portal" }
      ])
    groups.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}
    puts "Complete"
  end
end
namespace :utils do
  desc "Adds default roles to Roles"
  task :add_roles => :environment do
    puts "Adding default roles..."
    roles = Role.create(
      [ { :name => "Administrative" },
        { :name => "Contributor" },
        { :name => "Reader" }
      ])
    roles.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}
    puts "Complete"
  end
end
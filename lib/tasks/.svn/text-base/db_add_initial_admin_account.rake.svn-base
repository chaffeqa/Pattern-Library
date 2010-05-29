namespace :utils do
  desc "Adds initial admin account"
  task :add_initial_admin_account => :environment do
    puts "Adding initial Administrative role..."
    role = Role.create( :name => "Administrative" )
    role.errors.each {|attr,msg| puts "Error! The #{attr}: #{role.name} #{msg}" }

    puts "Adding initial admin user..."
    user = User.create(:name => 'admin', :password => 'secret', :password_confirmation => 'secret')
    user.errors.each {|attr,msg| puts "Error! The #{attr}: #{user.name} #{msg}" }

    puts "Making 'admin' user an Administrator..."
    right = AssignedRole.create(:user_id => User.find_by_name("admin").id,
                                :role_id => Role.find_by_name("Administrative").id)
    right.errors.each {|attr,msg| puts "Error! The #{attr}: #{right.name} #{msg}" }
    
    puts "Complete! CAUTION!!!! As soon as possible delete admin account!"
  end
end
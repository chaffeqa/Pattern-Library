namespace :utils do
  desc "Adds default menu names to Menus"
  task :add_menus => :environment do
    puts "Adding default menus..."
    parent_menus = ParentMenu.create(
      [ { :name => "Forms" },
        { :name => "Searching" },
        { :name => "Feedback" },
        { :name => "Content Management" },
        { :name => "Navigation" },
        { :name => "Layout and Theme" },
        { :name => "Profile" },
        { :name => "Displaying Information" },
        { :name => "Color and Background" }
      ])
    parent_menus.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}
    puts "Populating default submenus..."

    menus = ParentMenu.find_by_name("Forms").menus.create(
      [ { :name => "Add Attachment" },
        { :name => "Add Images" },
        { :name => "Calendar" },
        { :name => "Characters Remaining" },
        { :name => "Selector" },
        { :name => "Input Hints" },
        { :name => "Buttons" },
        { :name => "Multi-Step Indicator" }
      ])
    menus.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}

    menus = ParentMenu.find_by_name("Searching").menus.create(
      [ { :name => "Alternating Search Methods" },
        { :name => "Advanced Search" },
        { :name => "Search Box" },
        { :name => "Search Results" },
        { :name => "Search Results Filter" }
      ])
    menus.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}

    menus = ParentMenu.find_by_name("Feedback").menus.create(
      [ { :name => "Error Messaging" },
        { :name => "Help" },
        { :name => "Messaging – Lightbox" },
        { :name => "Messaging – Popup" },
        { :name => "Processing Bar" },
        { :name => "Server Down" },
        { :name => "Video Player" }
      ])
    menus.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}

    menus = ParentMenu.find_by_name("Content Management").menus.create(
      [ { :name => "Action Buttons" },
        { :name => "Cut and Paste Rows" },
        { :name => "Drag and Drop" },
        { :name => "Folder Management" }
      ])
    menus.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}

    menus = ParentMenu.find_by_name("Navigation").menus.create(
      [ { :name => "Breadcrumbs" },
        { :name => "Contextual Menus" },
        { :name => "Navigation Bar" },
        { :name => "Pagination" }
      ])
    menus.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}

    menus = ParentMenu.find_by_name("Layout and Theme").menus.create(
      [ { :name => "Footer" },
        { :name => "Banner" },
        { :name => "Font" },
        { :name => "Animation" },
        { :name => "Transitions" }
      ])
    menus.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}

    menus = ParentMenu.find_by_name("Profile").menus.create(
      [ { :name => "Hello Object" },
        { :name => "Log In" },
        { :name => "Registration" },
        { :name => "Personal Layout" },
        { :name => "Shopping Cart" }
      ])
    menus.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}

    menus = ParentMenu.find_by_name("Displaying Information").menus.create(
      [ { :name => "Alternating Row Colors" },
        { :name => "Display Grid" },
        { :name => "Expand & Collapse" },
        { :name => "Font Resizing" },
        { :name => "Portlet" },
        { :name => "Sortable Tables" },
        { :name => "Tree View" },
        { :name => "Video Player" }
      ])
    menus.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}

    menus = ParentMenu.find_by_name("Color and Background").menus.create(
      [ { :name => "Hue" },
        { :name => "Color Scheme" },
        { :name => "Background Images" },
        { :name => "Shapes" }
      ])
    menus.each {|e| e.errors.each {|attr,msg| puts "Error! The #{attr}: #{e.name} #{msg}" }}

    puts "Complete"
  end
end
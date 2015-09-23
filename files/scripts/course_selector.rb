#! /usr/bin/ruby

puts "Welcome to the PuppetLabs Learning System"
puts "-----------------------------------------"
puts "Press [enter] to update content:"
gets()

puts
puts "Updating course content, please stand by."

# Pull latest files
%x(cd /usr/src/pltraining-course_selector && git pull)

# Update courseware content
%x(puppet apply /usr/src/pltraining-course_selector/scripts/update.pp)

# Run course_update script
%x(/usr/local/bin/course_update)

# Run Course Menu
exec '/usr/local/bin/course_menu'

# Creates an archive of the repository so you can start a new
# un-versioned project. Run by specifying a "path" argument
# 
#    rake archive path="/path/to/new_app"
#
namespace :ss do
  desc 'Usage: `rake ss:archive path="/path/to/new_app"` - Archives repo into specified directory and does some cleanup'
  task :archive do
    path = ENV['path']
    Dir.mkdir("#{path}") unless File.exists?("#{path}")
    
    # archive
    puts "Archiving repo to #{path}"
    %x[git archive master | tar -x -C #{path}]
    
    # cleanup
    File.open("#{path}/README.md", 'w') {|f| f.write('TODO: Add description to README') }
  end
end
require 'rubygems'
require 'active_record'
require 'english'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "/Users/meganii/Work/Site/JekyllFFViewer/db/development.sqlite3"
)

class Post< ActiveRecord::Base
  serialize :metadata
end

files = Dir.glob(File.join("/Users/meganii/Dropbox/Sites/meganii.com/_posts", "*"))

files.each do |f|
  ff = YAML.load_file(f)
  file = open(f)
  content = file.read

  if content =~ /\A(---\s*\n.*?\n?)^(---\s*$\n?)/m
    post_content = $POSTMATCH
  end

  filename = File.basename(f)
  unless filename =~ /~\z/
    post = Post.new
    post.filename = filename 
    post.metadata = ff
    post.content = post_content
    post.save
  end


end

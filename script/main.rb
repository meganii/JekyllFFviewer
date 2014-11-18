require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "test.db"
)

class Post < ActiveRecord::Base
  has_many :tags
  accepts_nested_attributes_for :tags
end

class Tag < ActiveRecord::Base
  belongs_to :posts
end

files = Dir.glob(File.join("/Users/meganii/Dropbox/Sites/meganii.com/_posts", "*"))

files.each do |f|
  thing = YAML.load_file(f)
  post = Post.new
  post.filename = File::basename(f)
  post.layout = thing['layout']
  post.title = thing['title']
  post.old_url = thing['old_url']
  post.description = thing['description']
  post.modified = thing['modified']
  post.date = thing['date']
  post.comments = thing['comments']
  post.summary = thing['summary']
  post.published = thing['published']
  post.draft = thing['draft']
  post.save
end

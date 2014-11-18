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

DIR = "/Users/meganii/Work/Site/JekyllFFViewer/script/posts"

posts = Post.all

posts.each do |post|
  data = post.metadata
  filename = post.filename
  File.open(File.join(DIR,filename), 'w') {|file|
    file.puts("---")
    file.puts("layout: " + data['layout'])
    file.puts("title: " + data['title']) unless data['title'].nil?
    
    file.print("date: ")
    if data['date'].nil? || data['date'] == ''
      d = filename.split(/-/)
      time = d[0] + "-"  + d[1] + "-" + d[2] + " 0:00"
      file.puts(time)
    else
      file.puts(data['date'])
    end
    
    file.print("category: ")
    if data['category'].nil?
      file.puts("")
    else
      file.puts(data['category'])
    end

    if data['tags'].nil?
      file.puts("tags: ")
    else
      file.print("tags: [")
      if data['tags'].instance_of?(Array)

        index = 0
        data['tags'].each do |tag|
          file.print(",") unless index == 0
          file.print('"')
          file.print(tag)
          file.print('"')
          index = index + 1
        end
      else
        file.print('"')
        file.print(data['tags'])
        file.print('"')
      end
      file.puts("]")
    end
    file.print("old_url: ") unless data['old_url'].nil?
    file.puts(data['old_url']) unless data['old_url'].nil?

    file.puts("published: true")

    file.puts("")
    file.puts("---")
    file.puts("")

    file.puts(post.content)
  }
end




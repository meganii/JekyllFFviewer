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

posts = Post.all

posts.each do |post|
  data = post.metadata

  if data.key? 'image'
    p data
    Post.destroy(post.id)
  end

  if data.key? 'tagline'
    p data
    Post.destroy(post.id)
  end

  if data.key? 'description'
    p data
    Post.destroy(post.id)
  end

  if data.key? 'summary'
    p data
    data.delete("summary")
    post.metadata = data
    post.save
  end

  if data.key? 'tag'
    p data
    data['tags'] = data['tag']
    data.delete("tag")
    post.metadata = data
    post.save
  end

  if data['categories'] == 'activity, climing'
    p data
    data['category'] = 'activity'
    data.delete('categories')
    post.save
  end

  if data['categories'] == 'tech'
    p data
    data['category'] = 'tech'
    data.delete("categories")
    post.save
  end

  if data['categories'] == 'activity'
    p data
    data['category'] = 'activity'
    data.delete("categories")
    post.save
  end

  if data['categories'] == 'travel'
    p data
    data['category'] = 'activity'
    data.delete("categories")
    post.save
  end

  if data['categories'] == 'book'
    p data
    data['category'] = 'art'
    data.delete("categories")
    post.save
  end

  if data['categories'] == 'lifehack'
    p data
    data['category'] = 'art'
    data.delete("categories")
    post.save
  end

  if data['categories'] == 'like'
    p data
    data['category'] = 'activity'
    data.delete("categories")
    post.save
  end

  if data['categories'] == 'tech, mac'
    p data
    data['category'] = 'tech'
    data.delete("categories")
    post.save
  end

  if data['categories'] == 'tech, aws'
    p data
    data['category'] = 'tech'
    data.delete("categories")
    post.save
  end

  if data['categories'] == 'event'
    p data
    data['category'] = 'art'
    data.delete("categories")
    post.save
  end

  
  if data['categories'] == 'learning' 
    p data
    data['category'] = 'art'
    data.delete("categories")
    post.save
  end

 if data['categories'] == 'learnling' 
    p data
    data['category'] = 'art'
    data.delete("categories")
    post.save
  end

  if data['categories'] == ["book", "tech"] 
    p data
    data['category'] = 'art'
    data.delete("categories")
    post.save
  end

  if data['categories'] == 'care' 
    p data
    data['category'] = 'art'
    data.delete("categories")
    post.save
  end

  if data.key? 'categories' 
    p data
    data.delete("categories")
    post.metadata = data
    post.save
  end

  if data['category'] == 'book'
    p data
    data['category'] = 'art'
    post.metadata = data
    post.save
  end
end

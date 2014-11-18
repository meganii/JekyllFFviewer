require 'yaml'

files = Dir.glob(File.join("/Users/meganii/Dropbox/Sites/meganii.com/_posts", "*"))


a = []

files.each do |f|
  thing = YAML.load_file(f)
  puts File.basename(f) + ": " + thing.inspect
#  thing.keys.each do |key|
#    a << key
#  end
end

p a.uniq


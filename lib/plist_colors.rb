require "plist"
require "fileutils"

path = "."
plist_files = Dir.glob("#{path}/Configuration/**/*.plist")

def colors_from_hash(colors_hash)
  colors_path = 'colors'

  FileUtils.rm_rf colors_path
  FileUtils.mkdir colors_path

  montages = []
  colors_hash.each do |key, value|
    image_path = "#{colors_path}/#{key}.png"
    image_key_path = "#{colors_path}/#{key}_text_key.png"
    image_value_path = "#{colors_path}/#{key}_text_value.png"
    image_result_path = "#{colors_path}/#{key}_montage.png"

    `convert -size 100x100 xc:##{value} #{image_path}`
    `convert -background white -pointsize 22 caption:#{key} #{image_key_path}`
    `convert -background white -pointsize 22 caption:#{value} #{image_value_path}`
    `montage #{image_path} #{image_key_path} #{image_value_path} -tile x1 -geometry +5+5 #{image_result_path}`
    montages << image_result_path
  end

  all_paths = montages.join " "
  `montage #{all_paths} -tile 1x -geometry +5+5 color_mapping.png`

  FileUtils.rm_rf colors_path
end

plist_files.each do |plist_file|
  content = Plist::parse_xml(plist_file)
  colors = content["colors"]
  next if colors.nil?
  colors_from_hash(colors)
end

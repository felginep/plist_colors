require "plist"
require "fileutils"

def generate_png(colors_hash)
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

def colors_hash_from_plist(plist_content)
  colors_hash = {}
  plist_content.each do |key, value|
    if key.downcase == "colors" then
      colors_hash = colors_hash.merge(value)
    elsif value.is_a?(Hash)
      sub_hash = colors_hash_from_plist(value)
      colors_hash = colors_hash.merge(sub_hash)
    end
  end
  colors_hash
end

def colors_hash_from_plist_files(plist_files)
  colors_hash = {}
  plist_files.each do |plist_file|
    content = Plist::parse_xml(plist_file)
    plist_colors = colors_hash_from_plist(content)
    colors_hash = colors_hash.merge(plist_colors)
  end
  colors_hash
end

path = "."
plist_files = Dir.glob("#{path}/Configuration/**/*.plist")
colors_hash = colors_hash_from_plist_files(plist_files)
generate_png(colors_hash)

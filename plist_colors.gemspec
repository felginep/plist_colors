Gem::Specification.new do |s|
  s.name        = 'plist_colors'
  s.version     = '1.0.0'
  s.executables << 'plist_colors'
  s.date        = '2017-03-01'
  s.summary     = "Extract colors from xcode plist"
  s.authors     = ["Pierre Felgines"]
  s.email       = 'pierre.felgines@gmail.com'
  s.files       = ["lib/plist_colors.rb"]
  s.homepage    = "https://github.com/felginep"
  s.license     = 'MIT'
  s.add_dependency 'plist', '~> 3.2'
end

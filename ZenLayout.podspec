Pod::Spec.new do |s|
  s.name             = "ZenLayout"
  s.version          = "0.2.1"
  s.summary          = "An extension for UIView that makes working with Auto Layout easy."

  s.homepage         = "https://github.com/aethe/ZenLayout"
  s.license          = 'MIT'
  s.author           = { "Andrey Ufimtsev" => "andrew.aethe@gmail.com" }
  s.source           = { :git => "https://github.com/aethe/ZenLayout.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ZenLayout' => ['Pod/Assets/*.png']
  }
end

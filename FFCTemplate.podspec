#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FFCTemplate"
  s.version          = "0.1.0"
  s.summary          = "A model-based template in Objective-C."
  s.description      = <<-DESC
                       Fill templates with object properties.
                       DESC
  s.homepage         = "https://github.com/fcanas/FFCTemplate"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Fabian Canas" => "fcanas@gmail.com" }
  s.source           = { :git => "https://github.com/fcanas/FFCTemplate.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/fcanas'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resources = 'Pod/Assets/*.png'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

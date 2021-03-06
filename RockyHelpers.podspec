Pod::Spec.new do |s|
  s.name             = "RockyHelpers"
  s.version          = "0.1.0"
  s.summary          = "Swift rocky helpers."

  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/auraev/helpers"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'proprietary'
  s.author           = { "Airat Uraev" => "airat.uraev@gmail.com" }
  s.source           = { :git => "https://github.com/auraev/helpers.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.swift'
  s.resource_bundles = {
    'RockyHelpers' => ['Assets/*.png']
  }

  spec.subspec 'Utils' do |utils|
    utils = 'Classes/Utils/*.swift'
  end

  spec.subspec 'Network' do |network|
    network.source_files = 'Classes/Network/*.swift'
    network.dependency	'Mantle'
  end

  spec.default_subspec = 'Utils'
end

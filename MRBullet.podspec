#
#  Be sure to run `pod spec lint MRBullet.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "MRBullet"
  s.version      = "0.0.1"
  s.summary      = "一个小型的弹幕库，集成弹幕效果，方便集成使用."
  s.description  = <<-DESC
                   本着学习、研究的态度，封装一个小的弹幕库。实现弹幕的可配置性，使用简洁。版本会一直优化迭代，尽量提升灵活度。
                   DESC
  s.homepage     = "https://github.com/CrazyRoy/MRBullet"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "CrazyRoy" => "897323459@qq.com" }
  # Or just: s.author    = "Roy"
  # s.authors            = { "Roy" => "" }
  # s.social_media_url   = "http://twitter.com/Roy"
  # 
  s.platform     = :ios
  # s.platform     = :ios, "5.0"

  #  When using multiple platforms
  s.ios.deployment_target = "8.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/CrazyRoy/MRBullet.git", :tag => "#{s.version}" }

  s.source_files  = "MRBullet/Resources/**/*.{jpg,png}", "MRBullet/Classes/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end

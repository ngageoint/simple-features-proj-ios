Pod::Spec.new do |s|
  s.name             = 'sf-proj-ios'
  s.version          = '6.0.2'
  s.license          =  {:type => 'MIT', :file => 'LICENSE' }
  s.summary          = 'iOS SDK for Simple Features Projection'
  s.homepage         = 'https://github.com/ngageoint/simple-features-proj-ios'
  s.authors          = { 'NGA' => '', 'BIT Systems' => '', 'Brian Osborn' => 'bosborn@caci.com' }
  s.social_media_url = 'https://twitter.com/NGA_GEOINT'
  s.source           = { :git => 'https://github.com/ngageoint/simple-features-proj-ios.git', :tag => s.version }
  s.requires_arc     = true
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }

  s.platform         = :ios, '12.0'
  s.ios.deployment_target = '12.0'

  s.source_files = 'sf-proj-ios/**/*.{h,m}'

  s.frameworks = 'Foundation'

  s.dependency 'sf-ios', '~> 4.1.3'
  s.dependency 'proj-ios', '~> 2.0.2'
end

#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_blufi.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'esp_blufi'
  s.version          = '0.0.6'
  s.summary          = 'A new Flutter plugin.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'https://github.com/RianOvO/esp_blufi'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'RianOvO' => 'yu.legend@outlook.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*.{h,m,mm,c}'
  s.public_header_files = 'Classes/**/*.h'
  s.private_header_files = 'Classes/BlufiLibrary/Security/openssl/include/openssl/*{.h,.cpp,.a}', 'Classes/BlufiLibrary/Security/openssl/include/*{.h,.cpp,.a}', 'Classes/BlufiLibrary/Security/openssl/*{.h,.cpp,.a}',
  'Classes/BlufiLibrary/**/*{.h,.cpp,.a}'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  s.ios.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SRCROOT)/../.symlinks/plugins/esp_blufi/ios/Classes/BlufiLibrary/Security/openssl/include" }

  # Dùng xcframework thay cho .a để hỗ trợ cả device arm64 và simulator arm64
  s.ios.vendored_frameworks = 'Classes/BlufiLibrary/Security/openssl/libcrypto.xcframework', 'Classes/BlufiLibrary/Security/openssl/libssl.xcframework'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'ENABLE_BITCODE' => 'NO'}
end

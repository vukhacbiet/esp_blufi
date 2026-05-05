#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_blufi.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'esp_blufi'
  s.version          = '0.0.7'
  s.summary          = 'ESP BluFi Flutter plugin with iOS Simulator support.'
  s.description      = <<-DESC
ESP BluFi provisioning plugin. On iOS Simulator, OpenSSL stubs are used
since BLE is not available.
                       DESC
  s.homepage         = 'https://github.com/RianOvO/esp_blufi'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'RianOvO' => 'yu.legend@outlook.com' }
  s.source           = { :path => '.' }

  # source_files bao gồm cả openssl_sim_stubs.c (có #if TARGET_OS_SIMULATOR guard)
  s.source_files = 'Classes/**/*.{h,m,mm,c}'
  s.public_header_files = 'Classes/**/*.h'
  s.private_header_files = 'Classes/BlufiLibrary/Security/openssl/include/openssl/*.h',
                           'Classes/BlufiLibrary/Security/openssl/include/*.h',
                           'Classes/BlufiLibrary/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Link libcrypto.a & libssl.a CHỈ trên device thật (không link trên simulator)
  # Trên simulator, openssl_sim_stubs.c cung cấp stub symbols
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'ENABLE_BITCODE' => 'NO',
    'HEADER_SEARCH_PATHS' => '"$(PODS_TARGET_SRCROOT)/Classes/BlufiLibrary/Security/openssl/include"',
    'LIBRARY_SEARCH_PATHS[sdk=iphoneos*]' => '"$(PODS_TARGET_SRCROOT)/Classes/BlufiLibrary/Security/openssl"',
    'OTHER_LDFLAGS[sdk=iphoneos*]' => '-lcrypto -lssl',
  }
end


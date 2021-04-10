Pod::Spec.new do |s|
  s.name             = 'libcurl'
  s.version          = '7.76.0'
  s.summary          = 'client-side URL transfers'
  s.homepage         = 'https://curl.se/libcurl/'
  s.license          = { :file => 'curl/COPYING' }
  s.author           = { 'Daniel Stenberg' => 'daniel@haxx.se' }
  s.source           = { :git => 'https://github.com/seven332/libcurl-Xcode.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.default_subspec  = :none
  s.compiler_flags   = '-DBUILDING_LIBCURL', '-DCURL_HIDDEN_SYMBOLS', '-DHAVE_CONFIG_H'
  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libcurl/curl/include/ ${PODS_TARGET_SRCROOT}/curl/include/',
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libcurl/curl/lib/ ${PODS_TARGET_SRCROOT}/curl/lib/'
  }

  s.subspec 'http_only' do |ss|
    ss.source_files = 'curl/lib/**/*.{h,c}', 'curl/include/curl/*.h', 'include/http_only/curl_config.h'
    ss.public_header_files   = 'curl/include/curl/*.h'
    ss.dependency 'OpenSSL-Universal', '1.1.1100'
  end
end

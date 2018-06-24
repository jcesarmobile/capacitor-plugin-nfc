
  Pod::Spec.new do |s|
    s.name = 'CapacitorPluginNfc'
    s.version = '0.0.3'
    s.summary = 'A Capacitor NFC plugin'
    s.license = 'MIT'
    s.homepage = 'https://github.com/jcesarmobile/capacitor-plugin-nfc'
    s.author = 'jcesarmobile'
    s.source = { :git => 'https://github.com/jcesarmobile/capacitor-plugin-nfc', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end

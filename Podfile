
# Uncomment this line to define a global platform for your project
# platform :ios, ‘7.0’

source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!


target :SmileLove, :exclusive => true do
# pod 'Kiwi'
end

target 'SmileLove' do

pod 'AFNetworking', '~> 3.0.4'
pod 'PXTools', '~> 1.0.0’
pod 'YYKit', '~> 0.9.11'
pod 'MJRefresh', '~> 3.1.0'
pod 'MyLayout', '~> 1.1.7’



end
post_install do |installer_representation|
installer_representation.pods_project.build_configurations.each do |config|
config.build_settings['SKIP_INSTALL'] = 'YES'
config.build_settings['VALID_ARCHS'] = 'armv7 armv7s arm64'
config.build_settings['ARCHS'] = 'armv7 armv7s arm64'
end
end


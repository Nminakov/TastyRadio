# add pods for desired Firebase products
# https://firebase.google.com/docs/ios/setup#available-pods

# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Tasty Radio' do
  	# Comment the next line if you don't want to use dynamic frameworks
  	use_frameworks!

  	# Pods for Tasty Radio
  
	pod 'Kingfisher', '5.15.8'
	pod 'Parse'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
             config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            if config.name == 'Debug'
                config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
                config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
            end
        end
    end
end

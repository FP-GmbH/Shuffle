platform :ios, '13.0'

target 'ShuffleExample' do
  use_frameworks!
  inherit! :search_paths
  
  pod 'PopBounceButton'

end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end

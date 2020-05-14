

Pod::Spec.new do |spec|

  spec.name         = "GKWebTestFramework"
  spec.version      = "1.0.0"
  spec.summary      = "GKWebTestFramework for webservice framework"

  spec.description  = "GKWebTestFramework webservice framework for testing web service class for client"

  spec.homepage     = "https://github.com/gmtaGovind/GKWebTestFramework"

  spec.license      = "MIT"
  spec.author             = { "Govind" => "govind.kumawat@gmtasoftware.com" }
  
  spec.platform     = :ios
  spec.ios.deployment_target = "12.0"
  spec.swift_version = "5.0"
  
  spec.source       = { :git => "https://github.com/gmtaGovind/GKWebTestFramework.git", :tag => "1.0.0" }
  
  spec.source_files  = "GKWebTestFramework/**/*.{swift}"

  spec.dependency 'Alamofire'
  spec.framework = "UIKit"

end

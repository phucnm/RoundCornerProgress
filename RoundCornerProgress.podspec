
Pod::Spec.new do |s|
  s.name         = "RoundCornerProgress"
  s.version      = "1.0.0"
  s.summary      = "A progress control you can change round radius of any border"
  s.description  = <<-DESC
  "Drop in and easy to customize progress view. 
  You can change sizes, colors and round corner radius of any border of either track or progress part"
  DESC

  s.homepage     = "https://github.com/phucnm/RoundCornerProgress.git"
  s.license      = "MIT"
  s.author             = { "Phuc Nguyen" => "phucnguyenpr@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/phucnm/RoundCornerProgress.git", :tag => "#{s.version}" }
  s.source_files  = "RoundCornerProgressView/*.swift"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end

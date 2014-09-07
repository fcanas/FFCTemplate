Pod::Spec.new do |s|
  s.name             = "FFCTemplate"
  s.version          = "1.0.0"
  s.summary          = "A model-based template in Objective-C."
  s.description      = <<-DESC
                       A simple template renderer in Objective-C. Fill templates with object properties, methods, and key paths.

                       Given
                       ```
                       @interface MYObject : NSObject
                       @property (nonatomic, copy) NSString *color;
                       @property (nonatomic, copy) NSNumber *favoriteNumber;
                       @property (nonatomic, assign) NSInteger leastFavoriteNumber;
                       @end
                       
                       ...
                       
                       obj = [[MYObject alloc] init];
                       obj.color = @"red";
                       obj.favoriteNumber = @47;
                       obj.leastFavoriteNumber = -12;
                       ```
                       
                       and
                       
                       ```
                       NSString *templateString = @"My favorite color is {{ color }} and my favorite number is {{ favoriteNumber }} and my least favorite number is {{ leastFavoriteNumber }}!";
                       ```

                       ```
                       template = [[FFCTemplate alloc] initWithTemplate:templateString];
                       template.valueSource = obj;
                       
                       NSString *result = [template render]; 
                       //@"My favorite color is red and my favorite number is 47 and my least favorite number is -12!"
                       ```
                       DESC
  s.homepage         = "https://github.com/fcanas/FFCTemplate"
  s.license          = 'MIT'
  s.author           = { "Fabian Canas" => "fcanas@gmail.com" }
  s.source           = { :git => "https://github.com/fcanas/FFCTemplate.git", :tag => 'v1.0.0' }
  s.social_media_url = 'https://twitter.com/fcanas'
  s.platform     = :ios, '5.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes'
  s.public_header_files = 'Pod/Classes/**/*.h'
end

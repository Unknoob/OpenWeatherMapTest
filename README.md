# Open Weather Test
### Developed by Gabriel Beltrame Silva for the LuizaLabs Challenge.

I should start by saying that I used this test to learn a bunch of new technologies and plan on improving it further.

If you're going to judge me on the work I did in 5 days, use the `1.0` Tag
If you want to see the cooler stuff check out the development branch.

## Project details:
 - XCode 9.4.1.
 - iOS 11 or higher.

## Architecture: Why Viper?
I didn't want to end with Massive View Controllers so I thought I'd give it a try. I'm sure I could separate the responsibilities better and I'll keep working on it.

## Why Cocoapods?
Because it's better than manually setting up dependencies. Also, I didn't have time to learn how to use the Swift Package Manager.

Which Pods I used and why : 
- pod 'Alamofire', '4.7'
     - I didn't have time to make NSURLRequests manually.
- pod 'RxSwift', '4.2.0'
    - I'm trying to learn reactive programming. 
- pod 'RxCocoa', '4.2.0'
    - I'm trying to learn reactive programming. 
- pod 'Kingfisher', '4.8.0'
     - It makes it easier to download and cache images.


## Things I plan on doing:

 - Move the Models to the presenter because I think it makes more sense that way.
 - Do the Model > View binding on the presenter.
 - ~~Force Touch on the List View Controller to show more information.~~
 - Allow filtering locations from the list.
 - Allow reordering the list.
 - Allow loading more items.(Not sure if the API allows page=n parameter)
 - Prettier UX.
 - Add cool icons.
 - Separate the API calls in another class.
 - Better error handling.
 - Loading indicators.
 - Code comments.
 - Unit tests.
 - UI tests.
 - Localization.
 - ~~Limit the API requests to only update information after a considerable distance has been walked.~~
 - ~~Learn how to format a README file.~~
 - Configurable thresholds for fetching the weather information, both for distance and time.
# Tube Status

A simple application for displaying the status of different TFL Underground Lines

## What To Expect

In this repository, you can expect to find;

 - **Model View ViewModel Pattern** - Out of all the patterns out there at the moment I find MVVM to be the most fun to use. MVC is useful for rapid prototypes & V.I.P.E.R. is overkill much for something this simple.
 - **Coordinators** - I find the coordinator pattern very useful when following the Single Responsible Principle.
 - **Protocol Orientated Programming** - I prefer using POP over OOP as it allows for better testability.  There are areas where classes can be abstracted however I feel it's best to do so when said class is going to be used in multiple places.
 - **Other Patterns** - On top the aforementioned patterns, I've included other patterns I enjoy working with such as;
     - Dependency Injection 
     - Delegation
     - Repository
 - **3rd Frameworks** - I've imported 3rd frameworks using Swift Package Manager, however [Poppify](https://github.com/OccamsCode/Poppify/) & [Injection](https://github.com/OccamsCode/Injection/) are both frameworks I've created.
 - **Unit Testing** - I'm a big proponent of unit testing, hence it's inclusion here. With the patterns and ideas I have in place it's fairly easy to test everything apart the Views. I aim to reach overt 70% code coverage.

## Insert App Key
To insert your own App Key;
1. Open the `Config.xcconfig` file
2. Set the App Key, string quotes are not required.
```swift
// Set APP KEY Here:
APP_KEY = custom_app_key
```

1. [How to build the code](#how-to-build-code)
2. [How to run the output](#how-to-run-the-output)
3. [How the run the tests](#how-to-run-the-tests)
4. [Assumptions made](#assumptions-made)
5. [Anything else](#anything-else)

### How to build the code
 - Clone the repository
 - Open using an up-to date version of Xcode (preferably versions 14+)
 - Wait until SPM has imported dependencies
 - Build using the command `CMD + B`

### How to run the output
 - After building the project
 - Target any iPhone/iPad/iPod Touch device
 - Use the run button or select `Product -> Run` or command `CMD + R`

### How to run the unit tests
 - Clone the repository
 - Open using an up-to date version of Xcode (preferably versions 14+)
 - Target any iPhone/iPad/iPod Touch device
 - Select `Product -> Test` or command `CMD + U`

### Assumptions made
The following assumptions have been made;
 - The project uses UIKit, not SwiftUI. 
   - Within the job description or coding challenge specification, there is not specific mention of SwiftUI. Hence the UI us in UIKit.
   - Although the [TFL app](https://apps.apple.com/gb/app/tfl-go-live-tube-bus-rail/id1419541638) on the app store supports iOS 14+, which is higher the than the minimal required iOS for SwiftUI.
 - The entity `Line` will only ever have at most one `LineStatus` entity within the `lineStatuses` array. This assumption is mostly used when generating the accessibility label.

### Anything else
 - Support for Dynamic Type
   - From 80% to 310%.
   - Label text wraps where needed.
 - Support for Dark Mode
   - Labels switch between black & white.
   - However Tube Line does not switch, as the same colors are being in the Assest Catalog. Once the dark mode colors are known, they can inputed into Assest Catalog.
   - I plated around with a few ideas on how to get the Northern Line color to have a distinctive look in Dark Mode, but I did not find anything I liked.
 - App Icons
   - It's a small thing but it looks nicer than the stock App Icons.
 - Shimmering Effect
    - Views shimmer when loading.
 - Empty Data Set Pattern
    - Simple implementation of Empty State/Blank State. Can be seen when network is offline.
 - Unit Tests Display
    - When running the unit tests, a label is displayed to indicate that the tests are running. 
 - Calls the API Endpoint can be made without an APP KEY
   - From my testing, it appear that calls to `/Line/Mode/Tube/Status` can be made without the APP KEY. I put a check to ensure that an APP KEY is provided or else the app does not run.
  ```swift
  guard let key = Bundle.main.infoDictionary?["APP_KEY"] as? String, key.count > 0 else {
        fatalError("App Key not supplied")
    }
```

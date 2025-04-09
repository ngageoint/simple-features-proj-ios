# Simple Features Projection iOS

#### Simple Features Projection Lib ####

The Simple Features Libraries were developed at the [National Geospatial-Intelligence Agency (NGA)](http://www.nga.mil/) in collaboration with [BIT Systems](https://www.caci.com/bit-systems/). The government has "unlimited rights" and is releasing this software to increase the impact of government investments by providing developers with the opportunity to take things in new directions. The software use, modification, and distribution rights are stipulated within the [MIT license](http://choosealicense.com/licenses/mit/).

### Pull Requests ###
If you'd like to contribute to this project, please make a pull request. We'll review the pull request and discuss the changes. All pull request contributions to this project will be released under the MIT license.

Software source code previously released under an open source license and then modified by NGA staff is considered a "joint work" (see 17 USC § 101); it is partially copyrighted, partially public domain, and as a whole is protected by the copyrights of the non-government authors and must be released according to the terms of the original open source license.

### About ###

[Simple Features Projection](http://ngageoint.github.io/simple-features-proj-ios/) is an iOS library for performing projection conversions between [Simple Feature](https://github.com/ngageoint/simple-features-ios) Geometries.

### Usage ###

View the latest [Appledoc](http://ngageoint.github.io/simple-features-proj-ios/docs/api/)

#### Transform ####

```objectivec

// SFGeometry *geometry = ...

PROJProjection *projection1 =
    [PROJProjectionFactory projectionWithAuthority:PROJ_AUTHORITY_EPSG
    andIntCode:PROJ_EPSG_WEB_MERCATOR];
PROJProjection *projection2 =
    [PROJProjectionFactory projectionWithAuthority:PROJ_AUTHORITY_EPSG
    andIntCode:PROJ_EPSG_WORLD_GEODETIC_SYSTEM];

SFPGeometryTransform *transform =
    [SFPGeometryTransform transformFromProjection:projection1
    andToProjection:projection2];

SFGeometry *transformed = [transform transformGeometry:geometry];

[transform destroy];

```

### Build ###

[![Build & Test](https://github.com/ngageoint/simple-features-proj-ios/workflows/Build%20&%20Test/badge.svg)](https://github.com/ngageoint/simple-features-proj-ios/actions/workflows/build-test.yml)

**IMPORTANT** -
Be sure your Mac has the `autoconf`, `automake`, and `glibtoolize` utilities.  These are required to build
the [PROJ](https://github.com/ngageoint/PROJ) dependency.  Without them, `pod install` will fail.  The easiest way to get these is to [`brew install`](https://brew.sh/) them:
```
brew install automake
brew install libtool
```

Build this repository using Xcode and/or CocoaPods:

    pod repo update
    pod install

Open sf-proj-ios.xcworkspace in Xcode or build from command line:

    xcodebuild -workspace 'sf-proj-ios.xcworkspace' -scheme sf-proj-ios build

Run tests from Xcode or from command line:

    xcodebuild test -workspace 'sf-proj-ios.xcworkspace' -scheme sf-proj-ios -destination 'platform=iOS Simulator,name=iPhone 15'

### Include Library ###

See the [above note](https://github.com/ngageoint/simple-features-proj-ios#build) about `automake` and `glibtoolize`.

Include this repository by specifying it in a Podfile using a supported option.

Pull from [CocoaPods](https://cocoapods.org/pods/sf-proj-ios):

    pod 'sf-proj-ios', '~> 7.0.0'

If you use `use_modular_headers!` in your Podfile, disable modular headers for the [PROJ](https://github.com/ngageoint/PROJ) dependency:

    pod 'sf-proj-ios', '~> 7.0.0'
    pod 'PROJ', :modular_headers => false

Pull from GitHub:

    pod 'sf-proj-ios', :git => 'https://github.com/ngageoint/simple-features-proj-ios.git', :branch => 'master'
    pod 'sf-proj-ios', :git => 'https://github.com/ngageoint/simple-features-proj-ios.git', :tag => '7.0.0'

Include as local project:

    pod 'sf-proj-ios', :path => '../simple-features-proj-ios'

### Swift ###

To use from Swift, import the sf-proj-ios bridging header from the Swift project's bridging header

    #import "sf-proj-ios-Bridging-Header.h"

#### Transform ####

```swift

// var geometry: SFGeometry = ...

let projection1: PROJProjection = PROJProjectionFactory.projection(withAuthority: PROJ_AUTHORITY_EPSG, andIntCode: PROJ_EPSG_WEB_MERCATOR)
let projection2: PROJProjection = PROJProjectionFactory.projection(withAuthority: PROJ_AUTHORITY_EPSG, andIntCode: PROJ_EPSG_WORLD_GEODETIC_SYSTEM)

let transform: SFPGeometryTransform = SFPGeometryTransform(from: projection1, andTo: projection2)

let transformed: SFGeometry = transform.transform(geometry)

transform.destroy()

```

### Remote Dependencies ###

* [Simple Features](https://github.com/ngageoint/simple-features-ios) (The MIT License (MIT)) - Simple Features Lib
* [Projections](https://github.com/ngageoint/projections-ios) (The MIT License (MIT)) - Projections Lib

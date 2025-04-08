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

[![Build](https://github.com/ngageoint/simple-features-proj-ios/workflows/Build/badge.svg)](https://github.com/ngageoint/simple-features-proj-ios/actions/workflows/build.yml)

Build this repository using Swift Package Manager:

    swift build

Run tests from Xcode or from command line:

    swift test

Open the Swift Package in Xcode from command line:

    open Package.swift

### Include Library ###

Use this library via SPM in your Package.swift:

    dependencies: [
        .package(url: "https://github.com/ngageoint/simple-features-proj-ios.git", branch: "release/7.0.0"),
    ]
    
Or as a tagged release:

    dependencies: [
        .package(url: "https://github.com/ngageoint/simple-features-proj-ios.git", from: "7.0.0"),
    ]

Reference it in your Package.swift target:

    .target(
        name: "projections",
        dependencies: [
            .product(name: "SimpleFeaturesProjections", package: "simple-features-proj-ios"),
        ],
    ),

### Swift ###

To use from Swift:

    import SimpleFeaturesProjections

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

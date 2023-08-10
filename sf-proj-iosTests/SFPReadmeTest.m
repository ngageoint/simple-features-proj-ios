//
//  SFPReadmeTest.m
//  sf-proj-iosTests
//
//  Created by Brian Osborn on 7/24/20.
//  Copyright © 2020 NGA. All rights reserved.
//

#import "SFPReadmeTest.h"
#import "SFPTestUtils.h"
#import "SFPGeometryTransform.h"
#import "PROJProjectionFactory.h"
#import "PROJProjectionConstants.h"

@implementation SFPReadmeTest

/**
 * Test transform
 */
-(void) testTransform{
    
    SFGeometry *transformed = [self transformTester: [SFPoint pointWithXValue:111319.49079327357 andYValue:111325.14286638486]];
    
    [SFPTestUtils assertEqualIntWithValue:SF_POINT andValue2:transformed.geometryType];
    SFPoint *point = (SFPoint *) transformed;
    [SFPTestUtils assertEqualDoubleWithValue:1.0 andValue2:[point.x doubleValue] andDelta:.0000000000001];
    [SFPTestUtils assertEqualDoubleWithValue:1.0 andValue2:[point.y doubleValue] andDelta:.0000000000001];
    
}

/**
 * Test transform
 *
 * @param geometry
 *            geometry
 * @return geometry
 */
-(SFGeometry *) transformTester: (SFGeometry *) geometry{
    
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

    return transformed;
}

@end

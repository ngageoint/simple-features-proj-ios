//
//  SFPGeometryTransformTestCase.m
//  sf-proj-iosTests
//
//  Created by Brian Osborn on 5/3/18.
//  Copyright © 2018 NGA. All rights reserved.
//

#import "SFPGeometryTransformTestCase.h"
@import SimpleFeaturesProjections;
@import TestUtils;

@implementation SFPGeometryTransformTestCase

-(void) testProjectionTransform{
    
    SFPolygon *polygon = [SFPolygon polygon];
    SFLineString *ring = [SFLineString lineString];
    [ring addPoint:[SFPoint pointWithXValue:-PROJ_WEB_MERCATOR_HALF_WORLD_WIDTH andYValue:-PROJ_WEB_MERCATOR_HALF_WORLD_WIDTH]];
    [ring addPoint:[SFPoint pointWithXValue:PROJ_WEB_MERCATOR_HALF_WORLD_WIDTH andYValue:-PROJ_WEB_MERCATOR_HALF_WORLD_WIDTH]];
    [ring addPoint:[SFPoint pointWithXValue:PROJ_WEB_MERCATOR_HALF_WORLD_WIDTH andYValue:PROJ_WEB_MERCATOR_HALF_WORLD_WIDTH]];
    [ring addPoint:[SFPoint pointWithXValue:-PROJ_WEB_MERCATOR_HALF_WORLD_WIDTH andYValue:PROJ_WEB_MERCATOR_HALF_WORLD_WIDTH]];
    [polygon addRing:ring];
    
    SFPolygon *wgs84Polygon = [SFPolygon polygon];
    SFLineString *wgs84Ring = [SFLineString lineString];
    [wgs84Ring addPoint:[SFPoint pointWithXValue:-PROJ_WGS84_HALF_WORLD_LON_WIDTH andYValue:-PROJ_WEB_MERCATOR_MAX_LAT_RANGE]];
    [wgs84Ring addPoint:[SFPoint pointWithXValue:PROJ_WGS84_HALF_WORLD_LON_WIDTH andYValue:-PROJ_WEB_MERCATOR_MAX_LAT_RANGE]];
    [wgs84Ring addPoint:[SFPoint pointWithXValue:PROJ_WGS84_HALF_WORLD_LON_WIDTH andYValue:PROJ_WEB_MERCATOR_MAX_LAT_RANGE]];
    [wgs84Ring addPoint:[SFPoint pointWithXValue:-PROJ_WGS84_HALF_WORLD_LON_WIDTH andYValue:PROJ_WEB_MERCATOR_MAX_LAT_RANGE]];
    [wgs84Polygon addRing:wgs84Ring];

    PROJProjection *webMercator = [PROJProjectionFactory projectionWithAuthority:PROJ_AUTHORITY_EPSG andIntCode:PROJ_EPSG_WEB_MERCATOR];
    PROJProjection *wgs84 = [PROJProjectionFactory projectionWithAuthority:PROJ_AUTHORITY_EPSG andIntCode:PROJ_EPSG_WORLD_GEODETIC_SYSTEM];

    SFPGeometryTransform *transformWebMercatorToWgs84 = [SFPGeometryTransform transformFromProjection:webMercator andToProjection:wgs84];
    
    SFGeometry *transformedGeometry = [transformWebMercatorToWgs84 transformGeometry:polygon];

    [transformWebMercatorToWgs84 destroy];
    
    [SFPTestUtils assertNotNil:transformedGeometry];
    [SFPTestUtils assertTrue:[transformedGeometry isKindOfClass:[SFPolygon class]]];
    
    [SFPTestUtils assertEqualWithValue:wgs84Polygon andValue2:transformedGeometry];
    
    SFPGeometryTransform *transformWgs84ToWebMercator = [SFPGeometryTransform transformFromProjection:wgs84 andToProjection:webMercator];

    SFGeometry *transformedGeometry2 = [transformWgs84ToWebMercator transformGeometry:transformedGeometry];
    
    [transformWgs84ToWebMercator destroy];

    [SFPTestUtils assertNotNil:transformedGeometry2];
    [SFPTestUtils assertTrue:[transformedGeometry2 isKindOfClass:[SFPolygon class]]];
    
    SFPolygon *transformedPolygon2 = (SFPolygon *) transformedGeometry2;
    
    [SFPTestUtils assertEqualIntWithValue:[polygon numRings] andValue2:[transformedPolygon2 numRings]];
    [SFPTestUtils assertEqualIntWithValue:[[polygon exteriorRing] numPoints] andValue2:[[transformedPolygon2 exteriorRing] numPoints]];
    
    
    for (int i = 0; i < [[polygon exteriorRing] numPoints]; i++) {
        [SFPTestUtils assertEqualWithValue:[[polygon exteriorRing] pointAtIndex:i].x andValue2:[[transformedPolygon2 exteriorRing] pointAtIndex:i].x];
        [SFPTestUtils assertEqualDecimalNumberWithValue:[[polygon exteriorRing] pointAtIndex:i].y andValue2:[[transformedPolygon2 exteriorRing] pointAtIndex:i].y andDelta:0.0000001];
    }
}

@end

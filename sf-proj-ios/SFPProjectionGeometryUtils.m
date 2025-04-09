//
//  SFPProjectionGeometryUtils.m
//  sf-proj-ios
//
//  Created by Brian Osborn on 3/27/24.
//  Copyright © 2024 NGA. All rights reserved.
//

#import "SFPProjectionGeometryUtils.h"
#import "PROJProjectionFactory.h"
#import "PROJProjectionConstants.h"
#import "SFPGeometryTransform.h"

@implementation SFPProjectionGeometryUtils

static PROJProjection *WGS_84_PROJECTION = nil;

+(void) initialize{
    if(WGS_84_PROJECTION == nil){
        WGS_84_PROJECTION = [PROJProjectionFactory projectionWithEpsgInt:PROJ_EPSG_WORLD_GEODETIC_SYSTEM];
    }
}

+(NSArray<SFPoint *> *) geodesicPathOfPoints: (NSArray<SFPoint *> *) points withMaxDistance: (double) maxDistance inProjection: (PROJProjection *) projection{
    
    NSArray<SFPoint *> *geodesicPath = points;
    
    if(projection != nil){
        
        // Reproject to WGS84 if not in degrees
        if(![projection isUnit:PROJ_UNIT_DEGREES]){
            SFPGeometryTransform *toWGS84 = [SFPGeometryTransform transformFromProjection:projection andToProjection:WGS_84_PROJECTION];
            geodesicPath = [toWGS84 transformPoints:geodesicPath];
        }
        
        // Create the geodesic path
        geodesicPath = [SFGeometryUtils geodesicPathOfPoints:geodesicPath withMaxDistance:maxDistance];
        
        // Reproject back to the original projection
        if(![projection isUnit:PROJ_UNIT_DEGREES]){
            SFPGeometryTransform *fromWGS84 = [SFPGeometryTransform transformFromProjection:WGS_84_PROJECTION andToProjection:projection];
            geodesicPath = [fromWGS84 transformPoints:geodesicPath];
        }
        
    }
    
    return geodesicPath;
}

+(SFGeometryEnvelope *) geodesicEnvelope: (SFGeometryEnvelope *) envelope inProjection: (PROJProjection *) projection{
    
    SFGeometryEnvelope *geodesic = envelope;
    
    if(projection != nil){
        
        // Reproject to WGS84 if not in degrees
        if(![projection isUnit:PROJ_UNIT_DEGREES]){
            SFPGeometryTransform *toWGS84 = [SFPGeometryTransform transformFromProjection:projection andToProjection:WGS_84_PROJECTION];
            geodesic = [toWGS84 transformGeometryEnvelope:geodesic];
        }
        
        // Expand the envelope for geodesic lines
        geodesic = [SFGeometryUtils geodesicEnvelope:geodesic];
        
        // Reproject back to the original projection
        if(![projection isUnit:PROJ_UNIT_DEGREES]){
            SFPGeometryTransform *fromWGS84 = [SFPGeometryTransform transformFromProjection:WGS_84_PROJECTION andToProjection:projection];
            geodesic = [fromWGS84 transformGeometryEnvelope:geodesic];
        }
        
    }
    
    return geodesic;
}

@end

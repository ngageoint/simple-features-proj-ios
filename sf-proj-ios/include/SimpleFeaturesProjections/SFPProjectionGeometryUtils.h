//
//  SFPProjectionGeometryUtils.h
//  sf-proj-ios
//
//  Created by Brian Osborn on 3/27/24.
//  Copyright © 2024 NGA. All rights reserved.
//

#import <Projections/Projections.h>
#import <SimpleFeatures/SimpleFeatures.h>

/**
 * Projection Geometry Utilities
 */
@interface SFPProjectionGeometryUtils : NSObject

/**
 * Create a geodesic path of a points in the projection with a max distance
 * between any two path points
 *
 * @param points
 *            points in the projection
 * @param maxDistance
 *            max distance allowed between path points
 * @param projection
 *            projection of the points
 * @return geodesic path of points
 */
+(NSArray<SFPoint *> *) geodesicPathOfPoints: (NSArray<SFPoint *> *) points withMaxDistance: (double) maxDistance inProjection: (PROJProjection *) projection;

/**
 * Expand the vertical bounds of a geometry envelope in the projection by
 * including geodesic bounds
 *
 * @param envelope
 *            geometry envelope
 * @param projection
 *            projection of the envelope
 * @return geodesic expanded geometry envelope
 */
+(SFGeometryEnvelope *) geodesicEnvelope: (SFGeometryEnvelope *) envelope inProjection: (PROJProjection *) projection;
    
@end

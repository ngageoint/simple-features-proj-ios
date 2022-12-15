//
//  SFPGeometryTransform.h
//  sf-proj-ios
//
//  Created by Brian Osborn on 1/18/16.
//  Copyright © 2016 NGA. All rights reserved.
//

#import "PROJProjectionTransform.h"
#import "SFMultiPoint.h"
#import "SFMultiLineString.h"
#import "SFMultiPolygon.h"
#import "SFCircularString.h"
#import "SFCompoundCurve.h"
#import "SFTIN.h"
#import "SFTriangle.h"

/**
 * Geometry Projection Transform
 */
@interface SFPGeometryTransform : PROJProjectionTransform

/**
 *  Create
 *
 *  @param fromProjection from projection
 *  @param toProjection   to projection
 *
 *  @return new projection transform
 */
+(SFPGeometryTransform *) transformFromProjection: (PROJProjection *) fromProjection andToProjection: (PROJProjection *) toProjection;

/**
 *  Create
 *
 *  @param fromEpsg from epsg
 *  @param toEpsg   to epsg
 *
 *  @return new projection transform
 */
+(SFPGeometryTransform *) transformFromEpsg: (int) fromEpsg andToEpsg: (int) toEpsg;

/**
 *  Create
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
+(SFPGeometryTransform *) transformFromAuthority: (NSString *) fromAuthority andFromIntCode: (int) fromCode andToAuthority: (NSString *) toAuthority andToIntCode: (int) toCode;

/**
 *  Create
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
+(SFPGeometryTransform *) transformFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Create
 *
 *  @param fromProjection from projection
 *  @param toEpsg         to epsg
 *
 *  @return new projection transform
 */
+(SFPGeometryTransform *) transformFromProjection: (PROJProjection *) fromProjection andToEpsg: (int) toEpsg;

/**
 *  Create
 *
 *  @param fromProjection from projection
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
+(SFPGeometryTransform *) transformFromProjection: (PROJProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Create
 *
 *  @param fromEpsg     from epsg
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
+(SFPGeometryTransform *) transformFromEpsg: (int) fromEpsg andToProjection: (PROJProjection *) toProjection;

/**
 *  Create
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
+(SFPGeometryTransform *) transformFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (PROJProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toProjection   to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToProjection: (PROJProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param fromEpsg from epsg
 *  @param toEpsg   to epsg
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromEpsg: (int) fromEpsg andToEpsg: (int) toEpsg;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromIntCode: (int) fromCode andToAuthority: (NSString *) toAuthority andToIntCode: (int) toCode;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toEpsg         to epsg
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToEpsg: (int) toEpsg;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Initialize
 *
 *  @param fromEpsg     from epsg
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromEpsg: (int) fromEpsg andToProjection: (PROJProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (PROJProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param transform projection transform
 *
 *  @return new projection transform
 */
-(instancetype) initWithProjectionTransform: (PROJProjectionTransform *) transform;

/**
 *  Transform the geometry envelope
 *
 *  @param envelope geometry envelope
 *
 *  @return geometry envelope
 */
-(SFGeometryEnvelope *) transformGeometryEnvelope: (SFGeometryEnvelope *) envelope;

/**
 *  Transform the geometry
 *
 *  @param geometry geometry
 *
 *  @return projected geometry
 */
-(SFGeometry *) transformGeometry: (SFGeometry *) geometry;

/**
 *  Transform the point
 *
 *  @param point point
 *
 *  @return projected point
 */
-(SFPoint *) transformPoint: (SFPoint *) point;

/**
 *  Transform an array of points
 *
 *  @param from points to transform
 *
 *  @return transformed points
 */
-(NSArray<SFPoint *> *) transformPoints: (NSArray<SFPoint *> *) from;

/**
 *  Transform the line string
 *
 *  @param lineString line string
 *
 *  @return projected line string
 */
-(SFLineString *) transformLineString: (SFLineString *) lineString;

/**
 *  Transform the polygon
 *
 *  @param polygon polygon
 *
 *  @return projected polygon
 */
-(SFPolygon *) transformPolygon: (SFPolygon *) polygon;

/**
 *  Transform the multi point
 *
 *  @param multiPoint multi point
 *
 *  @return projected multi point
 */
-(SFMultiPoint *) transformMultiPoint: (SFMultiPoint *) multiPoint;

/**
 *  Transform the multi line string
 *
 *  @param multiLineString multi line string
 *
 *  @return projected multi line string
 */
-(SFMultiLineString *) transformMultiLineString: (SFMultiLineString *) multiLineString;

/**
 *  Transform the multi polygon
 *
 *  @param multiPolygon multi polygon
 *
 *  @return projected multi polygon
 */
-(SFMultiPolygon *) transformMultiPolygon: (SFMultiPolygon *) multiPolygon;

/**
 *  Transform the circular string
 *
 *  @param circularString circular string
 *
 *  @return projected circular string
 */
-(SFCircularString *) transformCircularString: (SFCircularString *) circularString;

/**
 *  Transform the compound curve
 *
 *  @param compoundCurve compound curve
 *
 *  @return projected compound curve
 */
-(SFCompoundCurve *) transformCompoundCurve: (SFCompoundCurve *) compoundCurve;

/**
 *  Transform the curve polygon
 *
 *  @param curvePolygon curve polygon
 *
 *  @return projected curve polygon
 */
-(SFCurvePolygon *) transformCurvePolygon: (SFCurvePolygon *) curvePolygon;

/**
 *  Transform the polyhedrals surface
 *
 *  @param polyhedralSurface polyhedrals surface
 *
 *  @return projected polyhedrals surface
 */
-(SFPolyhedralSurface *) transformPolyhedralSurface: (SFPolyhedralSurface *) polyhedralSurface;

/**
 *  Transform the tin
 *
 *  @param tin tin
 *
 *  @return projected tin
 */
-(SFTIN *) transformTIN: (SFTIN *) tin;

/**
 *  Transform the triangle
 *
 *  @param triangle triangle
 *
 *  @return projected triangle
 */
-(SFTriangle *) transformTriangle: (SFTriangle *) triangle;

/**
 *  Transform the geometry collection
 *
 *  @param geometryCollection geometry collection
 *
 *  @return projected geometry collection
 */
-(SFGeometryCollection *) transformGeometryCollection: (SFGeometryCollection *) geometryCollection;

/**
 * Get the inverse transformation
 *
 * @return inverse transformation
 */
-(SFPGeometryTransform *) inverseTransformation;

@end

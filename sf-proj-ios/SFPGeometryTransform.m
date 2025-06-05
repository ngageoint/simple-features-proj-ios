//
//  SFPGeometryTransform.m
//  sf-proj-ios
//
//  Created by Brian Osborn on 1/18/16.
//  Copyright © 2016 NGA. All rights reserved.
//

#import <SimpleFeaturesProjections/SFPGeometryTransform.h>

@implementation SFPGeometryTransform

+(SFPGeometryTransform *) transformFromProjection: (PROJProjection *) fromProjection andToProjection: (PROJProjection *) toProjection{
    return [[SFPGeometryTransform alloc] initWithFromProjection:fromProjection andToProjection:toProjection];
}

+(SFPGeometryTransform *) transformFromEpsg: (int) fromEpsg andToEpsg: (int) toEpsg{
    return [[SFPGeometryTransform alloc] initWithFromEpsg:fromEpsg andToEpsg:toEpsg];
}

+(SFPGeometryTransform *) transformFromAuthority: (NSString *) fromAuthority andFromIntCode: (int) fromCode andToAuthority: (NSString *) toAuthority andToIntCode: (int) toCode{
    return [[SFPGeometryTransform alloc] initWithFromAuthority:fromAuthority andFromIntCode:fromCode andToAuthority:toAuthority andToIntCode:toCode];
}

+(SFPGeometryTransform *) transformFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode{
    return [[SFPGeometryTransform alloc] initWithFromAuthority:fromAuthority andFromCode:fromCode andToAuthority:toAuthority andToCode:toCode];
}

+(SFPGeometryTransform *) transformFromProjection: (PROJProjection *) fromProjection andToEpsg: (int) toEpsg{
    return [[SFPGeometryTransform alloc] initWithFromProjection:fromProjection andToEpsg:toEpsg];
}

+(SFPGeometryTransform *) transformFromProjection: (PROJProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode{
    return [[SFPGeometryTransform alloc] initWithFromProjection:fromProjection andToAuthority:toAuthority andToCode:toCode];
}

+(SFPGeometryTransform *) transformFromEpsg: (int) fromEpsg andToProjection: (PROJProjection *) toProjection{
    return [[SFPGeometryTransform alloc] initWithFromEpsg:fromEpsg andToProjection:toProjection];
}

+(SFPGeometryTransform *) transformFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (PROJProjection *) toProjection{
    return [[SFPGeometryTransform alloc] initWithFromAuthority:fromAuthority andFromCode:fromCode andToProjection:toProjection];
}

-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToProjection: (PROJProjection *) toProjection{
    self = [super initWithFromProjection:fromProjection andToProjection:toProjection];
    return self;
}

-(instancetype) initWithFromEpsg: (int) fromEpsg andToEpsg: (int) toEpsg{
    self = [super initWithFromEpsg:fromEpsg andToEpsg:toEpsg];
    return self;
}

-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromIntCode: (int) fromCode andToAuthority: (NSString *) toAuthority andToIntCode: (int) toCode{
    self = [super initWithFromAuthority:fromAuthority andFromIntCode:fromCode andToAuthority:toAuthority andToIntCode:toCode];
    return self;
}

-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode{
    self = [super initWithFromAuthority:fromAuthority andFromCode:fromCode andToAuthority:toAuthority andToCode:toCode];
    return self;
}

-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToEpsg: (int) toEpsg{
    self = [super initWithFromProjection:fromProjection andToEpsg:toEpsg];
    return self;
}

-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode{
    self = [super initWithFromProjection:fromProjection andToAuthority:toAuthority andToCode:toCode];
    return self;
}

-(instancetype) initWithFromEpsg: (int) fromEpsg andToProjection: (PROJProjection *) toProjection{
    self = [super initWithFromEpsg:fromEpsg andToProjection:toProjection];
    return self;
}

-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (PROJProjection *) toProjection{
    self = [super initWithFromAuthority:fromAuthority andFromCode:fromCode andToProjection:toProjection];
    return self;
}

-(instancetype) initWithProjectionTransform: (PROJProjectionTransform *) transform{
    self = [super initWithProjectionTransform:transform];
    return self;
}

-(SFGeometryEnvelope *) transformGeometryEnvelope: (SFGeometryEnvelope *) envelope{
    
    NSArray<NSDecimalNumber *> *bounds = [self transformMinX:[envelope.minX doubleValue] andMinY:[envelope.minY doubleValue] andMaxX:[envelope.maxX doubleValue] andMaxY:[envelope.maxY doubleValue]];
    
    SFGeometryEnvelope *projectedEnvelope = [SFGeometryEnvelope envelopeWithMinX:[bounds objectAtIndex:0] andMinY:[bounds objectAtIndex:1] andMaxX:[bounds objectAtIndex:2] andMaxY:[bounds objectAtIndex:3]];
    
    return projectedEnvelope;
}

-(SFGeometry *) transformGeometry: (SFGeometry *) geometry{
    
    SFGeometry *to = nil;
    
    SFGeometryType geometryType = geometry.geometryType;
    switch(geometryType){
        case SF_POINT:
            to = [self transformPoint:(SFPoint *)geometry];
            break;
        case SF_LINESTRING:
            to = [self transformLineString:(SFLineString *)geometry];
            break;
        case SF_POLYGON:
            to = [self transformPolygon:(SFPolygon *)geometry];
            break;
        case SF_MULTIPOINT:
            to = [self transformMultiPoint:(SFMultiPoint *)geometry];
            break;
        case SF_MULTILINESTRING:
            to = [self transformMultiLineString:(SFMultiLineString *)geometry];
            break;
        case SF_MULTIPOLYGON:
            to = [self transformMultiPolygon:(SFMultiPolygon *)geometry];
            break;
        case SF_CIRCULARSTRING:
            to = [self transformCircularString:(SFCircularString *)geometry];
            break;
        case SF_COMPOUNDCURVE:
            to = [self transformCompoundCurve:(SFCompoundCurve *)geometry];
            break;
        case SF_CURVEPOLYGON:
            to = [self transformCurvePolygon:(SFCurvePolygon *)geometry];
            break;
        case SF_POLYHEDRALSURFACE:
            to = [self transformPolyhedralSurface:(SFPolyhedralSurface *)geometry];
            break;
        case SF_TIN:
            to = [self transformTIN:(SFTIN *)geometry];
            break;
        case SF_TRIANGLE:
            to = [self transformTriangle:(SFTriangle *)geometry];
            break;
        case SF_GEOMETRYCOLLECTION:
            to = [self transformGeometryCollection:(SFGeometryCollection *)geometry];
            break;
        default:
            [NSException raise:@"Unsupported Geometry" format:@"Unsupported Geometry Type: %ld", geometryType];
    }
    
    return to;
}

-(SFPoint *) transformPoint: (SFPoint *) point{
    
    CLLocationCoordinate2D fromCoord2d = CLLocationCoordinate2DMake([point.y doubleValue], [point.x doubleValue]);
    PROJLocationCoordinate3D *fromCoord = [[PROJLocationCoordinate3D alloc] initWithCoordinate:fromCoord2d];
    if(point.hasZ){
        [fromCoord setZ:point.z];
    }
    
    PROJLocationCoordinate3D *toCoord = [self transform3d:fromCoord];
    
    NSDecimalNumber *x = [[NSDecimalNumber alloc] initWithDouble:toCoord.coordinate.longitude];
    NSDecimalNumber *y = [[NSDecimalNumber alloc] initWithDouble:toCoord.coordinate.latitude];
    SFPoint *to = [SFPoint pointWithHasZ:point.hasZ andHasM:point.hasM andX:x andY:y];
    
    if(point.hasZ){
        [to setZ:toCoord.z];
    }
    if(point.hasM){
        [to setM:point.m];
    }
    
    return to;
}

-(NSArray<SFPoint *> *) transformPoints: (NSArray<SFPoint *> *) from{
    
    NSMutableArray<SFPoint *> *to = [NSMutableArray array];
    
    for(SFPoint *fromPoint in from){
        SFPoint *toPoint = [self transformPoint:fromPoint];
        [to addObject:toPoint];
    }
    
    return to;
}

-(SFLineString *) transformLineString: (SFLineString *) lineString{
    
    SFLineString *to = nil;
    
    switch (lineString.geometryType) {
        case SF_CIRCULARSTRING:
            to = [SFCircularString circularStringWithHasZ:lineString.hasZ andHasM:lineString.hasM];
            break;
        default:
            to = [SFLineString lineStringWithHasZ:lineString.hasZ andHasM:lineString.hasM];
    }
    
    for(SFPoint *point in lineString.points){
        SFPoint *toPoint = [self transformPoint:point];
        [to addPoint:toPoint];
    }
    
    return to;
}

-(SFPolygon *) transformPolygon: (SFPolygon *) polygon{
    
    SFPolygon *to = nil;
    
    switch (polygon.geometryType) {
        case SF_TRIANGLE:
            to = [SFTriangle triangleWithHasZ:polygon.hasZ andHasM:polygon.hasM];
            break;
        default:
            to = [SFPolygon polygonWithHasZ:polygon.hasZ andHasM:polygon.hasM];
    }
    
    for(SFLineString *ring in polygon.rings){
        SFLineString *toRing = [self transformLineString:ring];
        [to addRing:toRing];
    }
    
    return to;
}

-(SFMultiPoint *) transformMultiPoint: (SFMultiPoint *) multiPoint{

    SFMultiPoint *to = [SFMultiPoint multiPointWithHasZ:multiPoint.hasZ andHasM:multiPoint.hasM];
    
    for(SFPoint *point in [multiPoint points]){
        SFPoint *toPoint = [self transformPoint:point];
        [to addPoint:toPoint];
    }
    
    return to;
}

-(SFMultiLineString *) transformMultiLineString: (SFMultiLineString *) multiLineString{

    SFMultiLineString *to = [SFMultiLineString multiLineStringWithHasZ:multiLineString.hasZ andHasM:multiLineString.hasM];
    
    for(SFLineString *lineString in [multiLineString lineStrings]){
        SFLineString *toLineString = [self transformLineString:lineString];
        [to addLineString:toLineString];
    }
    
    return to;
}

-(SFMultiPolygon *) transformMultiPolygon: (SFMultiPolygon *) multiPolygon{
    
    SFMultiPolygon *to = [SFMultiPolygon multiPolygonWithHasZ:multiPolygon.hasZ andHasM:multiPolygon.hasM];
    
    for(SFPolygon *polygon in [multiPolygon polygons]){
        SFPolygon *toPolygon = [self transformPolygon:polygon];
        [to addPolygon:toPolygon];
    }
    
    return to;
}

-(SFCircularString *) transformCircularString: (SFCircularString *) circularString{
    return (SFCircularString *) [self transformLineString:circularString];
}

-(SFCompoundCurve *) transformCompoundCurve: (SFCompoundCurve *) compoundCurve{
    
    SFCompoundCurve *to = [SFCompoundCurve compoundCurveWithHasZ:compoundCurve.hasZ andHasM:compoundCurve.hasM];
    
    for(SFLineString *lineString in compoundCurve.lineStrings){
        SFLineString *toLineString = [self transformLineString:lineString];
        [to addLineString:toLineString];
    }
    
    return to;
}

-(SFCurvePolygon *) transformCurvePolygon: (SFCurvePolygon *) curvePolygon{
    
    SFCurvePolygon *to = [SFCurvePolygon curvePolygonWithHasZ:curvePolygon.hasZ andHasM:curvePolygon.hasM];
    
    for(SFCurve *ring in curvePolygon.rings){
        
        SFCurve *toRing = nil;
        
        switch (ring.geometryType) {
            case SF_COMPOUNDCURVE:
                toRing = [self transformCompoundCurve:(SFCompoundCurve *)ring];
                break;
            default:
                toRing = [self transformLineString:(SFLineString *)ring];
        }
        
        [to addRing:toRing];
    }
    
    return to;
}

-(SFPolyhedralSurface *) transformPolyhedralSurface: (SFPolyhedralSurface *) polyhedralSurface{
    
    SFPolyhedralSurface *to = nil;
    
    switch (polyhedralSurface.geometryType) {
        case SF_TIN:
            to = [SFTIN tinWithHasZ:polyhedralSurface.hasZ andHasM:polyhedralSurface.hasM];
            break;
        default:
            to = [SFPolyhedralSurface polyhedralSurfaceWithHasZ:polyhedralSurface.hasZ andHasM:polyhedralSurface.hasM];
    }
    
    for(SFPolygon *polygon in polyhedralSurface.polygons){
        SFPolygon *toPolygon = [self transformPolygon:polygon];
        [to addPolygon:toPolygon];
    }
    
    return to;
}

-(SFTIN *) transformTIN: (SFTIN *) tin{
    return (SFTIN *) [self transformPolyhedralSurface:tin];
}

-(SFTriangle *) transformTriangle: (SFTriangle *) triangle{
    return (SFTriangle *) [self transformPolygon:triangle];
}

-(SFGeometryCollection *) transformGeometryCollection: (SFGeometryCollection *) geometryCollection{
    
    SFGeometryCollection *to = [SFGeometryCollection geometryCollectionWithHasZ:geometryCollection.hasZ andHasM:geometryCollection.hasM];
    
    for(SFGeometry *geometry in geometryCollection.geometries){
        SFGeometry *toGeometry = [self transformGeometry:geometry];
        [to addGeometry:toGeometry];
    }

    return to;
}

-(SFPGeometryTransform *) inverseTransformation{
    return [SFPGeometryTransform transformFromProjection:self.toProjection andToProjection:self.fromProjection];
}

@end

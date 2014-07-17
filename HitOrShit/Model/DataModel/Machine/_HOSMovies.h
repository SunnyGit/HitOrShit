// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to HOSMovies.h instead.

#import <CoreData/CoreData.h>
#import "HOSRecord.h"

extern const struct HOSMoviesAttributes {
	__unsafe_unretained NSString *cast;
	__unsafe_unretained NSString *genre;
	__unsafe_unretained NSString *moviePoster;
	__unsafe_unretained NSString *movie_id;
	__unsafe_unretained NSString *title;
} HOSMoviesAttributes;

extern const struct HOSMoviesRelationships {
	__unsafe_unretained NSString *reviews;
} HOSMoviesRelationships;

extern const struct HOSMoviesFetchedProperties {
} HOSMoviesFetchedProperties;

@class NSManagedObject;







@interface HOSMoviesID : NSManagedObjectID {}
@end

@interface _HOSMovies : HOSRecord {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (HOSMoviesID*)objectID;





@property (nonatomic, strong) NSString* cast;



//- (BOOL)validateCast:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* genre;



//- (BOOL)validateGenre:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* moviePoster;



//- (BOOL)validateMoviePoster:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* movie_id;



//- (BOOL)validateMovie_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *reviews;

- (NSMutableSet*)reviewsSet;





@end

@interface _HOSMovies (CoreDataGeneratedAccessors)

- (void)addReviews:(NSSet*)value_;
- (void)removeReviews:(NSSet*)value_;
- (void)addReviewsObject:(NSManagedObject*)value_;
- (void)removeReviewsObject:(NSManagedObject*)value_;

@end

@interface _HOSMovies (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCast;
- (void)setPrimitiveCast:(NSString*)value;




- (NSString*)primitiveGenre;
- (void)setPrimitiveGenre:(NSString*)value;




- (NSString*)primitiveMoviePoster;
- (void)setPrimitiveMoviePoster:(NSString*)value;




- (NSString*)primitiveMovie_id;
- (void)setPrimitiveMovie_id:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;





- (NSMutableSet*)primitiveReviews;
- (void)setPrimitiveReviews:(NSMutableSet*)value;


@end

// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to HOSMovies.m instead.

#import "_HOSMovies.h"

const struct HOSMoviesAttributes HOSMoviesAttributes = {
	.cast = @"cast",
	.genre = @"genre",
	.moviePoster = @"moviePoster",
	.movie_id = @"movie_id",
	.title = @"title",
};

const struct HOSMoviesRelationships HOSMoviesRelationships = {
	.reviews = @"reviews",
};

const struct HOSMoviesFetchedProperties HOSMoviesFetchedProperties = {
};

@implementation HOSMoviesID
@end

@implementation _HOSMovies

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"HOSMovies" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"HOSMovies";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"HOSMovies" inManagedObjectContext:moc_];
}

- (HOSMoviesID*)objectID {
	return (HOSMoviesID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic cast;






@dynamic genre;






@dynamic moviePoster;






@dynamic movie_id;






@dynamic title;






@dynamic reviews;

	
- (NSMutableSet*)reviewsSet {
	[self willAccessValueForKey:@"reviews"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"reviews"];
  
	[self didAccessValueForKey:@"reviews"];
	return result;
}
	






@end

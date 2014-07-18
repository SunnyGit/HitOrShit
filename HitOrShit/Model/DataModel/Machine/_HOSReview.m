// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to HOSReview.m instead.

#import "_HOSReview.h"

const struct HOSReviewAttributes HOSReviewAttributes = {
	.date = @"date",
	.hearts = @"hearts",
	.imageURL = @"imageURL",
	.movie_id = @"movie_id",
	.name = @"name",
	.review_text = @"review_text",
	.start_count = @"start_count",
};

const struct HOSReviewRelationships HOSReviewRelationships = {
};

const struct HOSReviewFetchedProperties HOSReviewFetchedProperties = {
};

@implementation HOSReviewID
@end

@implementation _HOSReview

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"HOSReview" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"HOSReview";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"HOSReview" inManagedObjectContext:moc_];
}

- (HOSReviewID*)objectID {
	return (HOSReviewID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"heartsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"hearts"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"start_countValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"start_count"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic date;






@dynamic hearts;



- (int16_t)heartsValue {
	NSNumber *result = [self hearts];
	return [result shortValue];
}

- (void)setHeartsValue:(int16_t)value_ {
	[self setHearts:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveHeartsValue {
	NSNumber *result = [self primitiveHearts];
	return [result shortValue];
}

- (void)setPrimitiveHeartsValue:(int16_t)value_ {
	[self setPrimitiveHearts:[NSNumber numberWithShort:value_]];
}





@dynamic imageURL;






@dynamic movie_id;






@dynamic name;






@dynamic review_text;






@dynamic start_count;



- (int16_t)start_countValue {
	NSNumber *result = [self start_count];
	return [result shortValue];
}

- (void)setStart_countValue:(int16_t)value_ {
	[self setStart_count:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveStart_countValue {
	NSNumber *result = [self primitiveStart_count];
	return [result shortValue];
}

- (void)setPrimitiveStart_countValue:(int16_t)value_ {
	[self setPrimitiveStart_count:[NSNumber numberWithShort:value_]];
}










@end

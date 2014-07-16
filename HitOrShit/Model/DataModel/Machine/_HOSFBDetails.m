// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to HOSFBDetails.m instead.

#import "_HOSFBDetails.h"

const struct HOSFBDetailsAttributes HOSFBDetailsAttributes = {
	.email = @"email",
	.firstName = @"firstName",
	.lastName = @"lastName",
	.name = @"name",
	.profileLink = @"profileLink",
	.userid = @"userid",
};

const struct HOSFBDetailsRelationships HOSFBDetailsRelationships = {
};

const struct HOSFBDetailsFetchedProperties HOSFBDetailsFetchedProperties = {
};

@implementation HOSFBDetailsID
@end

@implementation _HOSFBDetails

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"HOSFBDetails" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"HOSFBDetails";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"HOSFBDetails" inManagedObjectContext:moc_];
}

- (HOSFBDetailsID*)objectID {
	return (HOSFBDetailsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic email;






@dynamic firstName;






@dynamic lastName;






@dynamic name;






@dynamic profileLink;






@dynamic userid;











@end

// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to HOSRegister.m instead.

#import "_HOSRegister.h"

const struct HOSRegisterAttributes HOSRegisterAttributes = {
	.status = @"status",
	.sucessToken = @"sucessToken",
};

const struct HOSRegisterRelationships HOSRegisterRelationships = {
};

const struct HOSRegisterFetchedProperties HOSRegisterFetchedProperties = {
};

@implementation HOSRegisterID
@end

@implementation _HOSRegister

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"HOSRegister" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"HOSRegister";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"HOSRegister" inManagedObjectContext:moc_];
}

- (HOSRegisterID*)objectID {
	return (HOSRegisterID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic status;






@dynamic sucessToken;











@end

// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to HOSRegister.h instead.

#import <CoreData/CoreData.h>
#import "HOSRecord.h"

extern const struct HOSRegisterAttributes {
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *sucessToken;
} HOSRegisterAttributes;

extern const struct HOSRegisterRelationships {
} HOSRegisterRelationships;

extern const struct HOSRegisterFetchedProperties {
} HOSRegisterFetchedProperties;





@interface HOSRegisterID : NSManagedObjectID {}
@end

@interface _HOSRegister : HOSRecord {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (HOSRegisterID*)objectID;





@property (nonatomic, strong) NSString* status;



//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* sucessToken;



//- (BOOL)validateSucessToken:(id*)value_ error:(NSError**)error_;






@end

@interface _HOSRegister (CoreDataGeneratedAccessors)

@end

@interface _HOSRegister (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveStatus;
- (void)setPrimitiveStatus:(NSString*)value;




- (NSString*)primitiveSucessToken;
- (void)setPrimitiveSucessToken:(NSString*)value;




@end

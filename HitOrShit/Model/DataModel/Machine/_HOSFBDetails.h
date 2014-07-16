// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to HOSFBDetails.h instead.

#import <CoreData/CoreData.h>
#import "HOSRecord.h"

extern const struct HOSFBDetailsAttributes {
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *profileLink;
	__unsafe_unretained NSString *userid;
} HOSFBDetailsAttributes;

extern const struct HOSFBDetailsRelationships {
} HOSFBDetailsRelationships;

extern const struct HOSFBDetailsFetchedProperties {
} HOSFBDetailsFetchedProperties;









@interface HOSFBDetailsID : NSManagedObjectID {}
@end

@interface _HOSFBDetails : HOSRecord {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (HOSFBDetailsID*)objectID;





@property (nonatomic, strong) NSString* email;



//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* profileLink;



//- (BOOL)validateProfileLink:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* userid;



//- (BOOL)validateUserid:(id*)value_ error:(NSError**)error_;






@end

@interface _HOSFBDetails (CoreDataGeneratedAccessors)

@end

@interface _HOSFBDetails (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;




- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveProfileLink;
- (void)setPrimitiveProfileLink:(NSString*)value;




- (NSString*)primitiveUserid;
- (void)setPrimitiveUserid:(NSString*)value;




@end

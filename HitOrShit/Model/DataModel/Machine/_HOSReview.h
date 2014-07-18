// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to HOSReview.h instead.

#import <CoreData/CoreData.h>
#import "HOSRecord.h"

extern const struct HOSReviewAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *hearts;
	__unsafe_unretained NSString *imageURL;
	__unsafe_unretained NSString *movie_id;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *review_text;
	__unsafe_unretained NSString *start_count;
} HOSReviewAttributes;

extern const struct HOSReviewRelationships {
} HOSReviewRelationships;

extern const struct HOSReviewFetchedProperties {
} HOSReviewFetchedProperties;










@interface HOSReviewID : NSManagedObjectID {}
@end

@interface _HOSReview : HOSRecord {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (HOSReviewID*)objectID;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* hearts;



@property int16_t heartsValue;
- (int16_t)heartsValue;
- (void)setHeartsValue:(int16_t)value_;

//- (BOOL)validateHearts:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageURL;



//- (BOOL)validateImageURL:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* movie_id;



//- (BOOL)validateMovie_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* review_text;



//- (BOOL)validateReview_text:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* start_count;



@property int16_t start_countValue;
- (int16_t)start_countValue;
- (void)setStart_countValue:(int16_t)value_;

//- (BOOL)validateStart_count:(id*)value_ error:(NSError**)error_;






@end

@interface _HOSReview (CoreDataGeneratedAccessors)

@end

@interface _HOSReview (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSNumber*)primitiveHearts;
- (void)setPrimitiveHearts:(NSNumber*)value;

- (int16_t)primitiveHeartsValue;
- (void)setPrimitiveHeartsValue:(int16_t)value_;




- (NSString*)primitiveImageURL;
- (void)setPrimitiveImageURL:(NSString*)value;




- (NSString*)primitiveMovie_id;
- (void)setPrimitiveMovie_id:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveReview_text;
- (void)setPrimitiveReview_text:(NSString*)value;




- (NSNumber*)primitiveStart_count;
- (void)setPrimitiveStart_count:(NSNumber*)value;

- (int16_t)primitiveStart_countValue;
- (void)setPrimitiveStart_countValue:(int16_t)value_;




@end

// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WordBookModel.h instead.

#import <CoreData/CoreData.h>


extern const struct WordBookModelAttributes {
	__unsafe_unretained NSString *bID;
	__unsafe_unretained NSString *cID;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *picture;
} WordBookModelAttributes;

extern const struct WordBookModelRelationships {
} WordBookModelRelationships;

extern const struct WordBookModelFetchedProperties {
} WordBookModelFetchedProperties;







@interface WordBookModelID : NSManagedObjectID {}
@end

@interface _WordBookModel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WordBookModelID*)objectID;





@property (nonatomic, strong) NSString* bID;



//- (BOOL)validateBID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* cID;



//- (BOOL)validateCID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* picture;



//- (BOOL)validatePicture:(id*)value_ error:(NSError**)error_;






@end

@interface _WordBookModel (CoreDataGeneratedAccessors)

@end

@interface _WordBookModel (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveBID;
- (void)setPrimitiveBID:(NSString*)value;




- (NSString*)primitiveCID;
- (void)setPrimitiveCID:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitivePicture;
- (void)setPrimitivePicture:(NSString*)value;




@end

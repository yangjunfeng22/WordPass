// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WordBookCategoryModel.h instead.

#import <CoreData/CoreData.h>


extern const struct WordBookCategoryModelAttributes {
	__unsafe_unretained NSString *cID;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *picture;
} WordBookCategoryModelAttributes;

extern const struct WordBookCategoryModelRelationships {
} WordBookCategoryModelRelationships;

extern const struct WordBookCategoryModelFetchedProperties {
} WordBookCategoryModelFetchedProperties;






@interface WordBookCategoryModelID : NSManagedObjectID {}
@end

@interface _WordBookCategoryModel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WordBookCategoryModelID*)objectID;





@property (nonatomic, strong) NSString* cID;



//- (BOOL)validateCID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* picture;



//- (BOOL)validatePicture:(id*)value_ error:(NSError**)error_;






@end

@interface _WordBookCategoryModel (CoreDataGeneratedAccessors)

@end

@interface _WordBookCategoryModel (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCID;
- (void)setPrimitiveCID:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitivePicture;
- (void)setPrimitivePicture:(NSString*)value;




@end

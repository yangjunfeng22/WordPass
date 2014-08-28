// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WordBookTranslationModel.h instead.

#import <CoreData/CoreData.h>


extern const struct WordBookTranslationModelAttributes {
	__unsafe_unretained NSString *bID;
	__unsafe_unretained NSString *language;
	__unsafe_unretained NSString *nameTranslate;
	__unsafe_unretained NSString *tID;
} WordBookTranslationModelAttributes;

extern const struct WordBookTranslationModelRelationships {
} WordBookTranslationModelRelationships;

extern const struct WordBookTranslationModelFetchedProperties {
} WordBookTranslationModelFetchedProperties;







@interface WordBookTranslationModelID : NSManagedObjectID {}
@end

@interface _WordBookTranslationModel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WordBookTranslationModelID*)objectID;





@property (nonatomic, strong) NSString* bID;



//- (BOOL)validateBID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* language;



//- (BOOL)validateLanguage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* nameTranslate;



//- (BOOL)validateNameTranslate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* tID;



//- (BOOL)validateTID:(id*)value_ error:(NSError**)error_;






@end

@interface _WordBookTranslationModel (CoreDataGeneratedAccessors)

@end

@interface _WordBookTranslationModel (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveBID;
- (void)setPrimitiveBID:(NSString*)value;




- (NSString*)primitiveLanguage;
- (void)setPrimitiveLanguage:(NSString*)value;




- (NSString*)primitiveNameTranslate;
- (void)setPrimitiveNameTranslate:(NSString*)value;




- (NSString*)primitiveTID;
- (void)setPrimitiveTID:(NSString*)value;




@end

// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WordBookTranslationModel.m instead.

#import "_WordBookTranslationModel.h"

const struct WordBookTranslationModelAttributes WordBookTranslationModelAttributes = {
	.bID = @"bID",
	.language = @"language",
	.nameTranslate = @"nameTranslate",
	.tID = @"tID",
};

const struct WordBookTranslationModelRelationships WordBookTranslationModelRelationships = {
};

const struct WordBookTranslationModelFetchedProperties WordBookTranslationModelFetchedProperties = {
};

@implementation WordBookTranslationModelID
@end

@implementation _WordBookTranslationModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"WordBookTranslationModel" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"WordBookTranslationModel";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"WordBookTranslationModel" inManagedObjectContext:moc_];
}

- (WordBookTranslationModelID*)objectID {
	return (WordBookTranslationModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic bID;






@dynamic language;






@dynamic nameTranslate;






@dynamic tID;











@end

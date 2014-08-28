// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WordBookCategoryModel.m instead.

#import "_WordBookCategoryModel.h"

const struct WordBookCategoryModelAttributes WordBookCategoryModelAttributes = {
	.cID = @"cID",
	.name = @"name",
	.picture = @"picture",
};

const struct WordBookCategoryModelRelationships WordBookCategoryModelRelationships = {
};

const struct WordBookCategoryModelFetchedProperties WordBookCategoryModelFetchedProperties = {
};

@implementation WordBookCategoryModelID
@end

@implementation _WordBookCategoryModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"WordBookCategoryModel" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"WordBookCategoryModel";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"WordBookCategoryModel" inManagedObjectContext:moc_];
}

- (WordBookCategoryModelID*)objectID {
	return (WordBookCategoryModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic cID;






@dynamic name;






@dynamic picture;











@end

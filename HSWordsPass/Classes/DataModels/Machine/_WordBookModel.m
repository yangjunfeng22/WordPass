// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WordBookModel.m instead.

#import "_WordBookModel.h"

const struct WordBookModelAttributes WordBookModelAttributes = {
	.bID = @"bID",
	.cID = @"cID",
	.name = @"name",
	.picture = @"picture",
};

const struct WordBookModelRelationships WordBookModelRelationships = {
};

const struct WordBookModelFetchedProperties WordBookModelFetchedProperties = {
};

@implementation WordBookModelID
@end

@implementation _WordBookModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"WordBookModel" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"WordBookModel";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"WordBookModel" inManagedObjectContext:moc_];
}

- (WordBookModelID*)objectID {
	return (WordBookModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic bID;






@dynamic cID;






@dynamic name;






@dynamic picture;











@end

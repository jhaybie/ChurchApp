//
//  Data.m
//  ChurchApp
//
//  Created by Greg Tropino on 11/18/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import "Data.h"
#import "AppDelegate.h"
#import "ParishInfo.h"

@implementation Data
static Data* sMyData;

@synthesize managedObjectContext;

+(Data *)myData
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^
                  {
                      NSLog(@"Dispatch once");
                      sMyData = [[Data alloc] init];
                  });
    return sMyData;
}

-(id)init
{
    if (self = [super init])
    {
        NSLog(@"instantiating the singleton here: %@", self);
        managedObjectContext = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
        NSLog(@"init context %@", managedObjectContext);
        
        //TODO insert JSON connection info here
        
        
        NSFetchRequest *searchRequest = [[NSFetchRequest alloc] init];
        [searchRequest setEntity:[NSEntityDescription entityForName:@"ParishInfo" inManagedObjectContext:managedObjectContext]];
        
        NSArray *availArray = [managedObjectContext executeFetchRequest:searchRequest error:nil];
        
        if ([availArray count] <= 0)
        {
            ParishInfo *parishInfo = (ParishInfo *) [NSEntityDescription insertNewObjectForEntityForName:@"ParishInfo" inManagedObjectContext:[self managedObjectContext]];
            parishInfo.history = @"Insert Json history here!";
            [(AppDelegate*)[[UIApplication sharedApplication] delegate] saveContext];
        }
        else //check to see when last updated, add last updated date to each entity??
        {
            NSArray *searchedArray = [managedObjectContext executeFetchRequest:searchRequest error:nil];
            ParishInfo *parishInfo = [searchedArray objectAtIndex:0];
            parishInfo.history = @"Insert Json history here!";
            [(AppDelegate*)[[UIApplication sharedApplication] delegate] saveContext];
        }

    }
    return self;
}

-(NSArray *)fetchSundayBulletins
{
    NSFetchRequest *searchRequest = [[NSFetchRequest alloc] init];
    [searchRequest setEntity:[NSEntityDescription entityForName:@"SundayBulletins" inManagedObjectContext:managedObjectContext]];
    
    NSArray *matchedObjects = [managedObjectContext executeFetchRequest:searchRequest error:nil];
    return matchedObjects;
}

-(NSArray *)fetchMassTimes
{
    NSFetchRequest *searchRequest = [[NSFetchRequest alloc] init];
    [searchRequest setEntity:[NSEntityDescription entityForName:@"MassTimes" inManagedObjectContext:managedObjectContext]];
    
    NSArray *matchedObjects = [managedObjectContext executeFetchRequest:searchRequest error:nil];
    return matchedObjects;
}

-(NSArray *)fetchSermons
{
    NSFetchRequest *searchRequest = [[NSFetchRequest alloc] init];
    [searchRequest setEntity:[NSEntityDescription entityForName:@"Sermons" inManagedObjectContext:managedObjectContext]];
    
    NSArray *matchedObjects = [managedObjectContext executeFetchRequest:searchRequest error:nil];
    return matchedObjects;
}

-(NSArray *)fetchChurchPictures
{
    NSFetchRequest *searchRequest = [[NSFetchRequest alloc] init];
    [searchRequest setEntity:[NSEntityDescription entityForName:@"ChurchPictures" inManagedObjectContext:managedObjectContext]];
    
    NSArray *matchedObjects = [managedObjectContext executeFetchRequest:searchRequest error:nil];
    return matchedObjects;
}

-(NSArray *)fetchOtherServices
{
    NSFetchRequest *searchRequest = [[NSFetchRequest alloc] init];
    [searchRequest setEntity:[NSEntityDescription entityForName:@"OtherServices" inManagedObjectContext:managedObjectContext]];
    
    NSArray *matchedObjects = [managedObjectContext executeFetchRequest:searchRequest error:nil];
    return matchedObjects;
}

-(NSArray *)fetchEvents
{
    NSFetchRequest *searchRequest = [[NSFetchRequest alloc] init];
    [searchRequest setEntity:[NSEntityDescription entityForName:@"Events" inManagedObjectContext:managedObjectContext]];
    
    NSArray *matchedObjects = [managedObjectContext executeFetchRequest:searchRequest error:nil];
    return matchedObjects;
}

-(NSArray *)fetchParishInfo
{
    NSFetchRequest *searchRequest = [[NSFetchRequest alloc] init];
    [searchRequest setEntity:[NSEntityDescription entityForName:@"ParishInfo" inManagedObjectContext:managedObjectContext]];
    
    NSArray *matchedObjects = [managedObjectContext executeFetchRequest:searchRequest error:nil];
    return matchedObjects;
}




@end

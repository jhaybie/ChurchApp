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
#import "LastUpdated.h"
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

-(void)parseLoadInfo
{
    
    NSFetchRequest *searchRequest = [[NSFetchRequest alloc] init];
    [searchRequest setEntity:[NSEntityDescription entityForName:@"LastUpdated" inManagedObjectContext:managedObjectContext]];
    
    NSArray *availArray = [managedObjectContext executeFetchRequest:searchRequest error:nil];
    
    NSDate *lastUpdate;
    if ([availArray count] <= 0)
    {
        LastUpdated *updatedEntity = (LastUpdated *) [NSEntityDescription insertNewObjectForEntityForName:@"LastUpdated" inManagedObjectContext:[self managedObjectContext]];
        lastUpdate = updatedEntity.lastUpdatePerformed;
        [(AppDelegate*)[[UIApplication sharedApplication] delegate] saveContext];
    }
    else
    {
        NSArray *searchedArray = [managedObjectContext executeFetchRequest:searchRequest error:nil];
        LastUpdated *updatedEntity = [searchedArray objectAtIndex:0];
        lastUpdate = updatedEntity.lastUpdatePerformed;
    }

    
    
    PFQuery *query = [PFQuery queryWithClassName:@"INSERT LAST OVERALL UPDATE TIME CLASS HERE"];
    
    [query whereKey:@"updatedAt" greaterThan:lastUpdate];  //comparison not working properly, must FIX!!
    
    [query orderByAscending:@"createdAt"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu information.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects)
            {
                [object objectForKey:@"ClassNameHere"];
                
                ParishInfo *parish = (ParishInfo *)[NSEntityDescription insertNewObjectForEntityForName:@"ParishInfo" inManagedObjectContext:managedObjectContext];
                
                //converting string into date
                NSString *dateString = object[@"LAST UPDATE CLASS NAME HERE"];
                NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                [dateFormat setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
                NSDate *date = [dateFormat dateFromString:[dateString stringByReplacingOccurrencesOfString:@" +0000" withString:@""]];
                                
                parish.history = object[@"PARISH HISTORY CLASS NAME HERE"];
                
                [(AppDelegate*)[[UIApplication sharedApplication] delegate] saveContext];
                
                NSLog(@"%@", object.objectId);
            }
        } else
        {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}



@end

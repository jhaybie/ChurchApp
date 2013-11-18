//
//  Events.h
//  ChurchApp
//
//  Created by Greg Tropino on 11/18/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Events : NSManagedObject

@property (nonatomic, retain) NSString * eventDescription;
@property (nonatomic, retain) NSString * eventTitle;
@property (nonatomic, retain) NSString * eventDays;
@property (nonatomic, retain) NSString * eventTimes;

@end

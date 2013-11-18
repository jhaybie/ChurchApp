//
//  SundayBulletins.h
//  ChurchApp
//
//  Created by Greg Tropino on 11/18/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SundayBulletins : NSManagedObject

@property (nonatomic, retain) NSString * links;
@property (nonatomic, retain) NSString * date;

@end

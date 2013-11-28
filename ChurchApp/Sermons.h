//
//  Sermons.h
//  ChurchApp
//
//  Created by Greg Tropino on 11/27/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Sermons : NSManagedObject

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * synopsis;
@property (nonatomic, retain) NSString * title;

@end

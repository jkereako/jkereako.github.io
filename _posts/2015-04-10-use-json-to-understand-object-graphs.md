---
title: Use JSON to understand object graphs
author: Jeff Kereakoglow
category: Code
excerpt: JSON is a statically defined object graph. Use it to design models before writing code.
layout: post
revisions:
  2015-04-10: Fixed bugs in the code
---
> Core Data is an object-graph management and persistence framework. Core Data is not a relational database or a relational database management
system (RDBMS).

I did not internalize the meaning of these sentences until I was looking at some
JSON, and then I had an "ah-ha!" moment: JSON is an object graph and can be
described in code and therefore tracked with Core Data.

## JSON is an object graph
An object graph is a series of related objects. That's it. JSON is a statically
defined object graph and clearly shows how objects relate to one another.

Below is an example object graph for an app which I'm building for NOAA
Fisheries. The root object represents a single vessel trip and each trip has
children which represent a series of catches. There is a 1:n relationship
between trip and catches. This is represented in JSON thusly:

{% highlight json %}
{
  "type": "days at sea",
  "vtrID": 8392093827,
  "startDate": "2015-04-07T14:16:39.797Z",
  "endDate": "2015-04-09T14:16:17.826Z",
  "catches": [
    {
      "species": "atlantic herring",
      "poundsRetained": 200,
      "poundsDiscarded": 50
    },
    {
      "species": "monkfish",
      "poundsRetained": 50,
      "poundsDiscarded": 0
    },
    {
      "species": "tilefish",
      "poundsRetained": 130,
      "poundsDiscarded": 30
    }
  ]
}
{% endhighlight %}

There are 2 distinct objects here. We'll name them `Trip` and `Catch`. Knowing
this, we can translate this JSON into Objective-C.

## Managed objects
In order to use Core Data, you must subclass `NSManagedObject` for all the
objects you wish to track. You ought to read the official documentation on Core
Data for more information.

### The managed Trip object
{% highlight objective-c %}
//  Trip.h

@import Foundation;
@import CoreData;

@class Catch;

@interface Trip : NSManagedObject

@property (nonatomic) NSString *type;
@property (nonatomic) NSString *vtrID;
@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSDate *endDate;
@property (nonatomic) NSSet *catches;

@end

@interface Trip (CoreDataGeneratedAccessors)

- (void)addCatchesObject:(Catch *)value;
- (void)removeCatchesObject:(Catch *)value;
- (void)addCatches:(NSSet *)values;
- (void)removeCatches:(NSSet *)values;

@end
{% endhighlight %}

### The managed Catch object
{% highlight objective-c %}
//  Catch.h

@import Foundation;
@import CoreData;

@class Trip;

@interface Catch : NSManagedObject

@property (nonatomic) NSString *species;
@property (nonatomic) NSNumber *poundsRetained;
@property (nonatomic) NSNumber *poundsDiscarded;
@property (nonatomic) Trip *trip;

@end
{% endhighlight %}

# Implementation
The code below creates the object graph between the `Trip` and `Catch` objects.
At the bottom of the routine, you'll see a series of `NSLog()` statements. This
shows how to traverse the object graph.

Everything between `// BEGIN Core Data boilerplate` and
`// END Core Data boilerplate` sets up the Core Data stack. For the purpose of
this article, you do not need to understand what is happening, but know that it
is required for all Core Data applications.

{% highlight objective-c %}
//  AppDelegate.m
#import "AppDelegate.h"
#import "Trip.h"
#import "Catch.h"

NSString *const kModelName = @"MyModel";

@implementation AppDelegate

- (BOOL)application:(UIApplication * __unused)application
didFinishLaunchingWithOptions:(NSDictionary * __unused)launchOptions {
  //-- Create store
  NSManagedObjectContext *moc;
  NSManagedObjectModel *mom;
  NSURL *docsDir;
  NSURL *modelURL;
  NSURL *storeURL;
  NSError *error;

  // BEGIN Core Data boilerplate
  docsDir = [[NSFileManager defaultManager]
             URLForDirectory:NSDocumentDirectory
             inDomain:NSUserDomainMask
             appropriateForURL:nil
             create:YES
             error:&error];
  storeURL = [docsDir URLByAppendingPathComponent:
              [NSString stringWithFormat:@"%@.sqlite", kModelName]];

  modelURL = [[NSBundle mainBundle] URLForResource:kModelName
                                     withExtension:@"momd"];
  mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
  moc = [[NSManagedObjectContext alloc]
         initWithConcurrencyType:NSMainQueueConcurrencyType];

  moc.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                    initWithManagedObjectModel:mom];
  [moc.persistentStoreCoordinator
   addPersistentStoreWithType:NSSQLiteStoreType
   configuration:nil
   URL:storeURL
   options:nil
   error:&error];
  // END Core Data boilerplate

  //-- Create managed objects
  Trip *trip = [NSEntityDescription insertNewObjectForEntityForName:@"Trip"
                                             inManagedObjectContext:moc];

  Catch *atlanticHerring = [NSEntityDescription
                            insertNewObjectForEntityForName:@"Catch"
                                     inManagedObjectContext:moc];
  Catch *monkFish = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Catch"
                               inManagedObjectContext:moc];
  Catch *tileFish = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Catch"
                               inManagedObjectContext:moc];

  trip.type = @"days at sea";
  trip.vtrID = @"8392093827";
  trip.startDate = [NSDate date];
  trip.endDate = [NSDate date];

  atlanticHerring.species = @"atlantic herring";
  atlanticHerring.poundsRetained = @200;
  atlanticHerring.poundsDiscarded = @50;

  monkFish.species = @"monkfish";
  monkFish.poundsRetained = @50;
  monkFish.poundsDiscarded = 0;

  tileFish.species = @"tilefish";
  tileFish.poundsRetained = @130;
  tileFish.poundsDiscarded = @30;

  [trip addCatches:[NSSet setWithObjects:atlanticHerring,
                    monkFish,
                    tileFish, nil]];

  // Print all catches related to `trip`
  NSLog(@"%@", trip.catches);

  // Find the `Trip` object associated with each `Catch` object
  NSLog(@"%@", atlanticHerring.trip);
  NSLog(@"%@", monkFish.trip);
  NSLog(@"%@", tileFish.trip);

  return YES;

}
{% endhighlight %}

# Further reading
To understand Core Data, you **must** read these documents in this order:

1. [Core Data Core Competencies](https://developer.apple.com/library/ios/documentation/DataManagement/Devpedia-CoreData/coreDataOverview.html)
2. [Core Data Programming Guide](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreData/cdProgrammingGuide.html)

*[1:n]: One-to-many
*[NOAA]: National Oceanic and Atmospheric Administration

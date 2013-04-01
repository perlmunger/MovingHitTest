//
//  MLViewController.m
//  MovingHitTest
//
//  Created by Matt Long on 4/1/13.
//  Copyright (c) 2013 Matt Long. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  CGPoint endPoint = CGPointMake([[self view] bounds].size.width, [[self view] bounds].size.height);
  
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
  animation.fromValue = [NSValue valueWithCGPoint:[[_imageView layer] position]];
  animation.toValue = [NSValue valueWithCGPoint:endPoint];
  animation.duration = 30.0f;
  
  [[_imageView layer] addAnimation:animation forKey:@"position"];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *t = [touches anyObject];
  CGPoint thePoint = [t locationInView:self.view];
  
  thePoint = [[_imageView layer] convertPoint:thePoint toLayer:[[self view] layer]];
  
  if([[_imageView layer].presentationLayer hitTest:thePoint])
  {
    NSLog(@"You touched a Shape!");
  }
  else{
    NSLog(@"backgound touched");
  }

}



@end

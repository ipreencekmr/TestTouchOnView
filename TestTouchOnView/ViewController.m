//
//  ViewController.m
//  TestTouchOnView
//
//  Created by Quy Sang Le on 2/19/13.
//  Copyright (c) 2013 Quy Sang Le. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //load xib using outlets.
    
    for (QSKey *aView in self.view.subviews) {
        if ([aView isKindOfClass:[QSKey class]]) {
            [self addGestureRecognizersToPiece:aView];
            aView.label.text=@"whatever!";
        }
    }
    
    QSKey *keyView=[[QSKey alloc] init];
    
   //load xib using code ....
    
   NSArray *topObjects=[[NSBundle mainBundle] loadNibNamed:@"QSKey" owner:self options:nil];

    for (id view in topObjects) {
        if ([view isKindOfClass:[QSKey class]]) {
            keyView=(QSKey*)view;
        }
    }
    
    keyView.label.text=@"CView";
    [keyView setFrame:CGRectMake(0, 0, 100, 100)];
    [keyView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:keyView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addGestureRecognizersToPiece:(UIView *)piece
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPiece:)];
    [piece addGestureRecognizer:tapGesture];
}

- (void)tapPiece:(UITapGestureRecognizer *)gestureRecognizer
{
    CGPoint tapPoint = [gestureRecognizer locationInView:self.view];
    QSKey *hitView = (QSKey *)[self.view hitTest:tapPoint withEvent:nil];
    if (hitView.superview == self.view) NSLog(@"%@",hitView);
}

@end

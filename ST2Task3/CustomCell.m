//
//  CustomCell.m
//  ST2Task3
//
//  Created by Dima on 6/18/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize imgView;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
        UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnImageView:)];
        [self.imgView addGestureRecognizer:tapGesture];
        [self.imgView setUserInteractionEnabled:YES];
    }
    return self;
}

- (void) awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - UITapGestureRecognizer

- (void) tapOnImageView:(UITapGestureRecognizer*) tapGesture {
    if ([self.listener respondsToSelector:@selector(didTapOnImage:)]) {
        [self.listener didTapOnImage:self.imgView];
    }
}

#pragma mark - Methods

- (void) setUp {
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    [self.imgView setImage:[UIImage imageNamed:@"arrow_down"]];
    [self addSubview:self.imgView];
    
    self.imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.imgView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                              [self.imgView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:30],
                                              [self.imgView.widthAnchor constraintEqualToConstant:150],
                                              [self.imgView.heightAnchor constraintEqualToConstant:100]
                                              ]];
    
    self.infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.infoLabel.textAlignment = NSTextAlignmentCenter;
    self.infoLabel.numberOfLines = 0;
    
    [self addSubview:self.infoLabel];
    
    self.infoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.infoLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:50],
                                              [self.infoLabel.leadingAnchor constraintEqualToAnchor:self.imgView.trailingAnchor constant:20],
                                              [self.infoLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-20],
                                              [self.infoLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-50]
                                              ]];
    
}

- (void) setInfo:(NSString*) info {
    self.infoLabel.text = info;
}


@end

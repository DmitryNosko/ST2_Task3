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
    self.imgView = [[UIImageView alloc] init];
    [self addSubview:self.imgView];
    
    self.imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.imgView.centerYAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerYAnchor],
                                              [self.imgView.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:30],
                                              [self.imgView.widthAnchor constraintEqualToConstant:150],
                                              [self.imgView.heightAnchor constraintEqualToConstant:100]
                                              ]];
    
    self.infoLabel = [[UILabel alloc] init];
    self.infoLabel.textAlignment = NSTextAlignmentCenter;
    self.infoLabel.numberOfLines = 0;
    
    [self addSubview:self.infoLabel];
    
    self.infoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.infoLabel.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:50],
                                              [self.infoLabel.leadingAnchor constraintEqualToAnchor:self.imgView.safeAreaLayoutGuide.trailingAnchor constant:20],
                                              [self.infoLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-20],
                                              [self.infoLabel.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:-50]
                                              ]];
    
}

- (void) setInfo:(NSString*) info {
    self.infoLabel.text = info;
}


@end

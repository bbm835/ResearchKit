/*
 Copyright (c) 2015, Apple Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 
 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.
 
 3.  Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ORKGraphChartAccessibilityElement.h"


@interface ORKGraphChartAccessibilityElement()

@property (assign, nonatomic) NSInteger index;
@property (assign, nonatomic) NSInteger maxIndex;

@end


@implementation ORKGraphChartAccessibilityElement

- (nonnull instancetype)initWithAccessibilityContainer:(nonnull UIView *)container index:(NSInteger)index maxIndex:(NSInteger)maxIndex {
    self = [super initWithAccessibilityContainer:container];
    if (self) {
        self.index = index;
        self.maxIndex = maxIndex;
    }
    return self;
}

- (CGRect)accessibilityFrame {
    if (self.maxIndex == 0) {
        return [super accessibilityFrame];
    }
    
    CGRect containerFrame = [self.accessibilityContainer frame];
    CGFloat height = CGRectGetHeight(containerFrame);
    CGFloat width = CGRectGetWidth(containerFrame) / self.maxIndex;
    CGFloat x = self.index * width;
    
    return UIAccessibilityConvertFrameToScreenCoordinates(CGRectMake(x, 0, width, height), self.accessibilityContainer);
}

@end

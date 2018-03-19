//
//  TXTextField.m
//  TextField
//
//  Created by qianji_ios1 on 2018/3/19.
//  Copyright © 2018年 qianji_ios1. All rights reserved.
//

#import "TXTextField.h"
#import "NSString+Common.h"

@interface TXTextField ()

@property (nonatomic,assign) NSInteger  subIndex;

@end

@implementation TXTextField

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonSetup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonSetup];
}

- (void)commonSetup {
    self.emojiInput = YES;
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}


- (void)textFieldDidChange:(UITextField *)textField {
    if(_maxLength < 0)    return;
    
    NSString *text = textField.text;
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文/emoj被截断
    if (!position) {
        //如果屏蔽表情输入 且输入内容中有表情
        if (self.emojiInput == NO && [text isContainsEmoji]) {
            textField.text = [text stringRemoveAllEmoji];
            text = textField.text;
        }
        //如果设置了最大长度 按规则截取
        if (_maxLength > 0) {
            NSInteger textBytesLength = [self unicodeLengthOfString:text];
            if (textBytesLength >= _maxLength){
                _subIndex = textBytesLength == _maxLength ? _subIndex+1 : _subIndex;
                NSRange rangeIndex = [text rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, _subIndex)];
                if (rangeIndex.length == 1){
                    textField.text = [text substringToIndex:_subIndex];
                } else {
                    if(_maxLength == 1){
                        textField.text = @"";
                    } else {
                        NSRange rangeRange = [text rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, _subIndex)];
                        textField.text = [text substringWithRange:rangeRange];
                    }
                }
            }
        }
    }
}



- (NSUInteger)unicodeLengthOfString:(NSString *)text {
    NSUInteger asciiLength = 0;
    _subIndex = 0;
    for (NSUInteger i = 0; i < text.length; i++) {
        unichar uc = [text characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
        _subIndex = i;
        if (asciiLength >= _maxLength) break;
    }
    return asciiLength;
}

//MARK:是否展示菜单
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (self.noMenu) {
        return NO;
    } else {
        return YES;
    }
}

@end

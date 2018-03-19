//
//  TXTextField.h
//  TextField
//
//  Created by qianji_ios1 on 2018/3/19.
//  Copyright © 2018年 qianji_ios1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TXTextField : UITextField

/**是否不允许弹出菜单 */
@property (nonatomic, assign) BOOL noMenu;
/**最大字符数，一个英文算一个字符,一个中文字算两个字符,一个表情算四个字符，如果是0则不限制 */
@property(nonatomic,assign)NSInteger maxLength;
/**是否屏蔽表情输入 */
@property (nonatomic, assign) BOOL emojiInput;

@end

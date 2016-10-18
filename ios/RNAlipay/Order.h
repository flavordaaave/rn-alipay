//
//  Order.h
//  DONGXii Alipay integration
//
//  Created by David Ruisinger on 17.10.16.
//  Copyright © 2016 Things Move China GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject

@property(nonatomic, copy) NSString * partner;
@property(nonatomic, copy) NSString * seller;
@property(nonatomic, copy) NSString * out_trade_no;
@property(nonatomic, copy) NSString * subject;
@property(nonatomic, copy) NSString * body;
@property(nonatomic, copy) NSString * rmb_fee;
@property(nonatomic, copy) NSString * currency;
@property(nonatomic, copy) NSString * forex_biz;
@property(nonatomic, copy) NSString * notifyURL;

@property(nonatomic, copy) NSString * service;
@property(nonatomic, copy) NSString * payment_type;
@property(nonatomic, copy) NSString * _input_charset;
@property(nonatomic, copy) NSString * it_b_pay;
@property(nonatomic, copy) NSString * show_url;


@property(nonatomic, copy) NSString * sign_date;
@property(nonatomic, copy) NSString * app_id;

@end

//
//  Order.m
//  DONGXii Alipay integration
//
//  Created by David Ruisinger on 17.10.16.
//  Copyright © 2016 Things Move China GmbH. All rights reserved.
//

#import "Order.h"

@implementation Order

- (NSString *)description {
    
    NSMutableString * discription = [NSMutableString string];
    
    if (self.partner) {
        [discription appendFormat:@"partner=\"%@\"", self.partner];
    }
    if (self.seller) {
        [discription appendFormat:@"&seller_id=\"%@\"", self.seller];
    }
    if (self.out_trade_no) {
        [discription appendFormat:@"&out_trade_no=\"%@\"", self.out_trade_no];
    }
    if (self.subject) {
        [discription appendFormat:@"&subject=\"%@\"", self.subject];
    }
    if (self.body) {
        [discription appendFormat:@"&body=\"%@\"", self.body];
    }
    if (self.rmb_fee) {
        [discription appendFormat:@"&rmb_fee=\"%@\"", self.rmb_fee];
    }
    if (self.currency) {
        [discription appendFormat:@"&currency=\"%@\"", self.currency];
    }
    if (self.forex_biz) {
        [discription appendFormat:@"&forex_biz=\"%@\"", self.forex_biz];
    }
    if (self.notifyURL) {
        [discription appendFormat:@"&notify_url=\"%@\"", self.notifyURL];
    }
    if (self.service) {
        [discription appendFormat:@"&service=\"%@\"",self.service];
    }
    if (self.payment_type) {
        [discription appendFormat:@"&payment_type=\"%@\"",self.payment_type];
    }
    if (self._input_charset) {
        [discription appendFormat:@"&_input_charset=\"%@\"",self._input_charset];
    }
    if (self.it_b_pay) {
        [discription appendFormat:@"&it_b_pay=\"%@\"",self.it_b_pay];
    }
    if (self.show_url) {
        [discription appendFormat:@"&show_url=\"%@\"",self.show_url];
    }
    if (self.sign_date) {
        [discription appendFormat:@"&sign_date=\"%@\"",self.sign_date];
    }
    if (self.app_id) {
        [discription appendFormat:@"&app_id=\"%@\"",self.app_id];
    }
    return discription;
}


@end

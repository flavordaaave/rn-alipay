#import "RNAlipay.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation RNAlipay

RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(pay, options:(NSDictionary *)options
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    
    NSString *privateKey = @"__FILL IN HERE__";
    
    NSString *appScheme = @"com.dongxii.alipay";
    
    // Create the order
    Order *order = [[Order alloc] init];
    order.partner = @"__FILL IN HERE__";
    order.seller = @"__FILL IN HERE__";
    order.out_trade_no = [options objectForKey:@"orderId"];
    order.subject = [options objectForKey:@"subject"];
    order.body = [options objectForKey:@"body"];
    float rmb_fee = [[options objectForKey:@"amount"] floatValue];
    order.rmb_fee = [NSString stringWithFormat:@"%0.2f", rmb_fee];
    order.currency = @"__FILL IN HERE__";
    order.forex_biz = @"FP";
    order.notifyURL =  @"__FILL IN HERE__";
    order.service = @"mobile.securitypay.pay";
    order.payment_type = @"1";
    order._input_charset = @"utf-8";
    order.it_b_pay = @"30m";
    order.show_url = @"m.alipay.com";
    
    
    NSLog(@"ALIPAY: Order = %@", order.out_trade_no);
    NSLog(@"ALIPAY: Subject = %@", order.subject);
    NSLog(@"ALIPAY: Body = %@", order.body);
    NSLog(@"ALIPAY: Amount = %@", order.rmb_fee);
    
    // Create the orderString
    NSString *orderSpec = [order description];
    NSLog(@"ALIPAY: orderSpec = %@",orderSpec);

    // Sign the orderString
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    NSLog(@"ALIPAY: signedString = %@",signedString);
    

    
    // Initiate the payment
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSString *status = resultDic[@"resultStatus"];
            if ([status integerValue] >= 8000) {
                resolve(@[resultDic]);
            } else {
                reject(status, resultDic[@"memo"], [NSError errorWithDomain:resultDic[@"memo"] code:[status integerValue] userInfo:NULL]);
            }
        }];
        
        
    }
}

@end

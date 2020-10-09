//
//  Hero.h
//  sanguosha
//
//  Created by feiylang on 2020/10/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Hero : NSObject {
    NSString *name;//名字
    NSString *country;//国家
    double blood_value;//血量
    NSInteger jichugongji;//基础攻击
    NSInteger energy_value;//能量值，这里不会消耗完，用作攻击属性加成
    NSInteger youxianji;//设置优先级 优先级随机设计，优先级高的人优先攻击
}

- (double)getBlood_value;  //返回血量值
- (void)setenegry_value:(NSInteger )e;  //设置能量值
- (void)setblood_value:(double )b;  //设置血量值
- (NSInteger)getenergy_value;  //得到能量值
- (NSString *)getCountry;  //得到国家
- (NSString *)getName;  //得到名字
- (NSInteger)youxianji;  //得到优先级
- (void)zhuangtai;  //状态展示
- (double)pingA:(Hero *) shanghai;  //普通攻击伤害
- (double)skillone:(Hero *) shanghai;  //一技能伤害
- (double)skilltwo:(Hero * ) shanghai;  //二技能伤害

@end
//十二个人 蜀国 群雄 魏国 吴国各三个 分别为：刘备 关羽 张飞 董卓 吕布 貂蝉 夏侯惇 张辽 司马懿 太史慈 陆逊 鲁肃
@interface Zhangfei : Hero {
    
}

@end

@interface Lvbu :Hero {
    
}

@end

@interface Liubei :Hero {
    
}
@end

@interface Guanyu :Hero {
    
}
@end

@interface Xiahoudun :Hero {
    
}
@end

@interface Lusu :Hero {
    
}
@end

@interface Luxun :Hero {
    
}
@end

@interface Zhangliao :Hero {
    
}
@end

@interface Simayi :Hero {
    
}
@end

@interface Diaochan :Hero {
    
}
@end

@interface Taishici :Hero {
    
}
@end

@interface Dongzhuo :Hero {
    
}
@end


NS_ASSUME_NONNULL_END

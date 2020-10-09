//
//  Hero.m
//  sanguosha
//
//  Created by feiylang on 2020/10/6.
//

#import "Hero.h"


@implementation Hero
-(id)init{
    self=[super init];
    if(self){
        //一些初始化的操作
        self->name=@"xx";
        self->blood_value = 0;
        self->country =@"xx";
        self->jichugongji = 0;
        self->energy_value = 0;
        self->youxianji = 0;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value; //得到生命值
}
- (void)setblood_value:(double )b{
    self->blood_value = b;  //设置生命值，这里由于blood_value是私有变量，不能直接修改，所以需要一个设置函数，下面的能量值设置同样
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;  //设置能量值
}
- (NSInteger)getenergy_value{
    return self->energy_value; //返回能量值
}
- (NSString *)getCountry{
    return self->country; //返回国家
}
- (void)zhuangtai{
    //状态展示
}
- (NSString *)getName{
    return self->name;  //返回名字
}
- (NSInteger)youxianji{
    return self->youxianji;//优先级的设定，判定先攻击的人
}
- (double)pingA: (Hero *)shanghai{
    return 0;  //平A，即普通攻击的伤害，返回一个double变量
}
- (double)skillone:(Hero *) shanghai{
    return 0;  //技能一，同样返回一个double变量
}
- (double)skilltwo:(Hero *)shanghai{
    return 0; //技能二，也是double变量
}
@end



@implementation Zhangfei
-(id)init{
    self=[super init];
    if(self){
        //一些基本属性的设定
        self->name=@"张飞";
        self->blood_value = 5000;
        self->country =@"蜀国";
        self->jichugongji = 500;
        self->energy_value = 20;
        self->youxianji = 8;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}

- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
//上面和父类Hero一样，在这里可以不写出，但是为了代码统一，这里也写出了
- (void)zhuangtai{
    //张飞状态展示
    NSString *str=[NSString stringWithFormat:@"张飞现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSString *)getName{
    ///返回名字，即“张飞”
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    //普通攻击，根据初始攻击值确定
    NSString *str=[NSString stringWithFormat:@"张飞发动普通攻击，对方受到500点伤害"];
    NSLog(@"%@",str);
    return 500;  //返回double类型的伤害
}
- (double)skillone:(Hero *) shanghai{
    //一技能，主要是能量强化加成
    [self setenegry_value:[self getenergy_value]-2]; //设定能量值
    NSString *str=[NSString stringWithFormat:@"张飞发动一技能，对方受到%.2f点伤害，能量剩余%ld",500*(double)(1+energy_value/100.0),[self getenergy_value]];
    NSLog(@"%@",str); //输出内容
    return 500*(double)(1+energy_value/100.0); //返回double类型的伤害
}
- (double)skilltwo:(Hero *)shanghai{
    //二技能相对于一技能也强化了
    [self setenegry_value:[self getenergy_value]-3]; //设定能量值
    NSString *str=[NSString stringWithFormat:@"张飞发动二技能，对方受到%.2f点伤害。能量剩余%ld",500*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str); //输出内容
    return 500*(double)(1+(energy_value*10)/100.0); //返回double类型的伤害
}
@end


@implementation Lvbu
-(id)init{
    self=[super init];
    if(self){
        self->name=@"吕布";
        self->blood_value = 4500;
        self->country =@"群雄";
        self->jichugongji = 550;
        self->energy_value = 30;
        self->youxianji = 7;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)zhuangtai{
    NSString *str=[NSString stringWithFormat:@"吕布现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
- (NSString *)getName{
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    NSString *str=[NSString stringWithFormat:@"吕布发动普通攻击，对方受到550点伤害"];
    NSLog(@"%@",str);
    return 550;
}
- (double)skillone:(Hero *) shanghai{
    [self setenegry_value:[self getenergy_value]-2];
    NSString *str=[NSString stringWithFormat:@"吕布发动一技能，对方受到%.2f点伤害，能量剩余%ld",550*(double)(1+energy_value/100.0),[self getenergy_value]];
    NSLog(@"%@",str);
    return 550*(double)(1+energy_value/100.0);
}
- (double)skilltwo:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-3];
    NSString *str=[NSString stringWithFormat:@"吕布发动二技能，对方受到%.2f点伤害。能量剩余%ld",550*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 550*(double)(1+(energy_value*10)/100.0);
}


@end
@implementation Guanyu
-(id)init{
    self=[super init];
    if(self){
        self->name=@"关羽";
        self->blood_value = 4800;
        self->country =@"蜀国";
        self->jichugongji = 530;
        self->energy_value = 40;
        self->youxianji = 6;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)zhuangtai{
    NSString *str=[NSString stringWithFormat:@"关羽布现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
- (NSString *)getName{
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    NSString *str=[NSString stringWithFormat:@"关羽发动普通攻击，对方受到530点伤害"];
    NSLog(@"%@",str);
    return 530;
}
- (double)skillone:(Hero *) shanghai{
    [self setenegry_value:[self getenergy_value]-2];
    NSString *str=[NSString stringWithFormat:@"关羽发动一技能，对方受到%.2f点伤害，能量剩余%ld",530*(double)(1+energy_value/100.0),[self getenergy_value]];
    NSLog(@"%@",str);
    return 530*(double)(1+energy_value/100.0);
}
- (double)skilltwo:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-3];
    NSString *str=[NSString stringWithFormat:@"关羽发动二技能，对方受到%.2f点伤害。能量剩余%ld",530*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 530*(double)(1+(energy_value*10)/100.0);
}
@end


@implementation Zhangliao
-(id)init{
    self=[super init];
    if(self){
        self->name=@"张辽";
        self->blood_value = 3000;
        self->country =@"魏国";
        self->jichugongji = 700;
        self->energy_value = 50;
        self->youxianji = 3;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)zhuangtai{
    NSString *str=[NSString stringWithFormat:@"张辽现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
- (NSString *)getName{
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    NSString *str=[NSString stringWithFormat:@"张辽发动普通攻击，对方受到550点伤害"];
    NSLog(@"%@",str);
    return 700;
}
- (double)skillone:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-2];
    NSString *str=[NSString stringWithFormat:@"张辽发动一技能，对方受到%.2f点伤害，能量剩余%ld",700*(double)(1+energy_value/100.0),[self getenergy_value]];
    NSLog(@"%@",str);
    return 700*(double)(1+energy_value/100.0);
}
- (double)skilltwo:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-3];
    NSString *str=[NSString stringWithFormat:@"张辽发动二技能，对方受到%.2f点伤害。能量剩余%ld",700*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 700*(double)(1+(energy_value*10)/100.0);
}
@end

@implementation Diaochan
-(id)init{
    self=[super init];
    if(self){
        self->name=@"貂蝉";
        self->blood_value = 2500;
        self->country =@"群雄";
        self->jichugongji = 800;
        self->energy_value = 60;
        self->youxianji = 2;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)zhuangtai{
    NSString *str=[NSString stringWithFormat:@"貂蝉现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
- (NSString *)getName{
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    NSString *str=[NSString stringWithFormat:@"貂蝉发动普通攻击，对方受到800点伤害"];
    NSLog(@"%@",str);
    return 800;
}
- (double)skillone:(Hero *) shanghai{
    [self setenegry_value:[self getenergy_value]-2];
    NSString *str=[NSString stringWithFormat:@"貂蝉发动一技能，对方受到%.2f点伤害，能量剩余%ld",800*(double)(1+energy_value/100.0),[self getenergy_value]];
    NSLog(@"%@",str);
    return 800*(double)(1+energy_value/100.0);
}
- (double)skilltwo:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-3];
    NSString *str=[NSString stringWithFormat:@"貂蝉发动二技能，对方受到%.2f点伤害。能量剩余%ld",800*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 800*(double)(1+(energy_value*10)/100.0);
}
@end


@implementation Dongzhuo
-(id)init{
    self=[super init];
    if(self){
        self->name=@"董卓";
        self->blood_value = 6000;
        self->country =@"群雄";
        self->jichugongji = 450;
        self->energy_value = 50;
        self->youxianji = 1;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)zhuangtai{
    NSString *str=[NSString stringWithFormat:@"董卓现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
- (NSString *)getName{
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    NSString *str=[NSString stringWithFormat:@"董卓发动普通攻击，对方受到450点伤害"];
    NSLog(@"%@",str);
    return 450;
}
- (double)skillone:(Hero *) shanghai{
    [self setenegry_value:[self getenergy_value]-2];
    NSString *str=[NSString stringWithFormat:@"董卓发动一技能，对方受到%.2f点伤害，能量剩余%ld",450*(double)(1+energy_value/100.0),[self getenergy_value]];
    NSLog(@"%@",str);
    return 450*(double)(1+energy_value/100.0);
}
- (double)skilltwo:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-3];
    NSString *str=[NSString stringWithFormat:@"董卓发动二技能，对方受到%.2f点伤害。能量剩余%ld",450*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 450*(double)(1+(energy_value*10)/100.0);
}
@end
@implementation Simayi
-(id)init{
    self=[super init];
    if(self){
        self->name=@"司马懿";
        self->blood_value = 2000;
        self->country =@"魏国";
        self->jichugongji = 1000;
        self->energy_value = 15;
        self->youxianji = 12;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)zhuangtai{
    NSString *str=[NSString stringWithFormat:@"司马懿现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
- (NSString *)getName{
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    NSString *str=[NSString stringWithFormat:@"司马懿发动普通攻击，对方受到1000点伤害"];
    NSLog(@"%@",str);
    return 1000;
}
- (double)skillone:(Hero *) shanghai{
    [self setenegry_value:[self getenergy_value]-2];
    NSString *str=[NSString stringWithFormat:@"司马懿发动一技能，对方受到%.2f点伤害，能量剩余%ld",1000*(double)(1+energy_value/100.0),[self getenergy_value]];
    NSLog(@"%@",str);
    return 1000*(double)(1+energy_value/100.0);
}
- (double)skilltwo:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-3];
    NSString *str=[NSString stringWithFormat:@"司马懿发动二技能，对方受到%.2f点伤害。能量剩余%ld",1000*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 1000*(double)(1+(energy_value*10)/100.0);
}
@end
@implementation Lusu
-(id)init{
    self=[super init];
    if(self){
        self->name=@"鲁肃";
        self->blood_value = 2500;
        self->country =@"吴国";
        self->jichugongji = 900;
        self->energy_value = 20;
        self->youxianji = 9;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)zhuangtai{
    NSString *str=[NSString stringWithFormat:@"鲁肃现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
- (NSString *)getName{
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    NSString *str=[NSString stringWithFormat:@"鲁肃发动普通攻击，对方受到900点伤害"];
    NSLog(@"%@",str);
    return 900;
}
- (double)skillone:(Hero *) shanghai{
    [self setenegry_value:[self getenergy_value]-2];
    NSString *str=[NSString stringWithFormat:@"鲁肃发动一技能，对方受到%.2f点伤害，能量剩余%ld",900*(double)(1+energy_value/100.0),[self getenergy_value]];
    NSLog(@"%@",str);
    return 900*(double)(1+energy_value/100.0);
}
- (double)skilltwo:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-3];
    NSString *str=[NSString stringWithFormat:@"鲁肃发动二技能，对方受到%.2f点伤害。能量剩余%ld",900*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 900*(double)(1+(energy_value*10)/100.0);
}
@end
@implementation Taishici
-(id)init{
    self=[super init];
    if(self){
        self->name=@"太史慈";
        self->blood_value = 3000;
        self->country =@"吴国";
        self->jichugongji = 650;
        self->energy_value = 30;
        self->youxianji = 4;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)zhuangtai{
    NSString *str=[NSString stringWithFormat:@"太史慈现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
- (NSString *)getName{
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    NSString *str=[NSString stringWithFormat:@"太史慈发动普通攻击，对方受到650点伤害"];
    NSLog(@"%@",str);
    return 650;
}
- (double)skillone:(Hero *) shanghai{
    [self setenegry_value:[self getenergy_value]-2];
    NSString *str=[NSString stringWithFormat:@"太史慈发动一技能，对方受到%.2f点伤害，能量剩余%ld",650*(double)(1+energy_value/100.0),[self getenergy_value]];
    NSLog(@"%@",str);
    return 650*(double)(1+energy_value/100.0);
}
- (double)skilltwo:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-3];
    NSString *str=[NSString stringWithFormat:@"太史慈发动二技能，对方受到%.2f点伤害。能量剩余%ld",650*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 650*(double)(1+(energy_value*10)/100.0);
}
@end
@implementation Luxun
-(id)init{
    self=[super init];
    if(self){
        self->name=@"陆逊";
        self->blood_value = 3500;
        self->country =@"吴国";
        self->jichugongji = 600;
        self->energy_value = 40;
        self->youxianji = 11;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)zhuangtai{
    NSString *str=[NSString stringWithFormat:@"陆逊现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
- (NSString *)getName{
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    NSString *str=[NSString stringWithFormat:@"陆逊发动普通攻击，对方受到600点伤害"];
    NSLog(@"%@",str);
    return 600;
}
- (double)skillone:(Hero *) shanghai{
    [self setenegry_value:[self getenergy_value]-2];
    NSString *str=[NSString stringWithFormat:@"陆逊发动一技能，对方受到%.2f点伤害，能量剩余%ld",600*(double)(1+energy_value/100.0),[self getenergy_value]];
    NSLog(@"%@",str);
    return 600*(double)(1+energy_value/100.0);
}
- (double)skilltwo:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-3];
    NSString *str=[NSString stringWithFormat:@"陆逊发动二技能，对方受到%.2f点伤害。能量剩余%ld",600*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 600*(double)(1+(energy_value*10)/100.0);
}
@end

@implementation Liubei
-(id)init{
    self=[super init];
    if(self){
        self->name=@"刘备";
        self->blood_value = 4500;
        self->country =@"蜀国";
        self->jichugongji = 600;
        self->energy_value = 40;
        self->youxianji = 5;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)zhuangtai{
    NSString *str=[NSString stringWithFormat:@"刘备现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
- (NSString *)getName{
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    NSString *str=[NSString stringWithFormat:@"刘备发动普通攻击，对方受到600点伤害"];
    NSLog(@"%@",str);
    return 600;
}
- (double)skillone:(Hero *) shanghai{
    [self setenegry_value:[self getenergy_value]-2];
    NSString *str=[NSString stringWithFormat:@"刘备发动一技能，对方受到%.2f点伤害，能量剩余%ld",600*(1+(double)(energy_value/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 600*(double)(1+energy_value/100.0);
}
- (double)skilltwo:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-3];
    NSString *str=[NSString stringWithFormat:@"刘备发动二技能，对方受到%.2f点伤害。能量剩余%ld",600*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 600*(double)(1+(energy_value*5)/100.0);
}
@end
@implementation Xiahoudun
-(id)init{
    self=[super init];
    if(self){
        self->name=@"夏侯惇";
        self->blood_value = 5000;
        self->country =@"魏国";
        self->jichugongji = 450;
        self->energy_value = 100;
        self->youxianji = 10;
    }
    return self;
}
- (double)getBlood_value{
    return self->blood_value;
}
- (void)setenegry_value:(NSInteger )e{
    self->energy_value = e;
}
- (void)setblood_value:(double )b{
    self->blood_value = b;
}
- (void)zhuangtai{
    NSString *str=[NSString stringWithFormat:@"夏侯惇现在的生命值为%.2f ,能量值为%ld",  (double)[self getBlood_value],(long)[self  getenergy_value]];
    NSLog(@"%@",str);
}
- (NSInteger)getenergy_value{
    return self->energy_value;
}
- (NSString *)getCountry{
    return self->country;
}
- (NSString *)getName{
    return self->name;
}
- (NSInteger)youxianji{
    return self->youxianji;
}
- (double)pingA: (Hero *)shanghai{
    NSString *str=[NSString stringWithFormat:@"夏侯惇发动普通攻击，对方受到450点伤害"];
    NSLog(@"%@",str);
    return 450;
}
- (double)skillone:(Hero *) shanghai{
    [self setenegry_value:[self getenergy_value]-2];
    NSString *str=[NSString stringWithFormat:@"夏侯惇发动一技能，对方受到%.2f点伤害，能量剩余%ld",450*(1+(double)(energy_value/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 450*(double)(1+energy_value/100);
}
- (double)skilltwo:(Hero *)shanghai{
    [self setenegry_value:[self getenergy_value]-3];
    NSString *str=[NSString stringWithFormat:@"夏侯惇发动二技能，对方受到%.2f点伤害。能量剩余%ld",450*(1+(double)((energy_value*10)/100.0)),[self getenergy_value]];
    NSLog(@"%@",str);
    return 450*(double)(1+(energy_value*5)/100);
}
@end

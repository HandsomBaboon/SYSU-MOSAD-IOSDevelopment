## MOSAD_HW1

## 基于oc实现三国人物对战，并且以对话的形式输出

### 介绍

个人作业1-创建第一个XCode项目、面向对象与Objective-C语法学习

###  开发环境

- Mac OS
- Objective-C
- Xcode

###  任务

- 安装配置Mac OS和Xcode

- 熟悉Mac OS按键操作

- 熟悉Xcode项目结构，编译运行第一个Xcode项目，项目创建流程详见[tutorial](https://gitee.com/code_sysu/mosad_hw1/blob/master/manual/tutorial.md)

- 选取并设计N（N>10）个三国英雄

  

实现场景输出（log形式即可）：随机选择两名英雄，挑战M（M<=10）个回合，其中每个回合各英雄可发动不同技能，从而导致不同的结果发生（英雄各属性变化及每个回合的输赢）。

要求：

- 输出随机选择的英雄及其关键属性，输出单挑中每回合的过程、结果，以及最终胜负结果
- 需要用到多态
- 输出程序设计和运行过程中，相关设计体现的oo特性（数据隐秘性、封装性、继承、多态）

验收要点：

- 输出随机选择的英雄及其关键属性，输出单挑中每回合的过程、结果，以及最终胜负结果

- 类的设计与封装

- 类与类之间的继承关系与多态的体现

  

## 实验过程

### 继承关系如图所示：

![IMG20201009003804](C:\Users\巴塞罗那\Desktop\mosad_hw1的副本\IMG20201009003804.jpg)

### 首先是父类的设计

下面给出详细的代码：

具体的函数和参数已经给出注释

```objective-c
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

```

接下来是父类的实现，在这里父类的实现如下，相应的代码已经给出：

```objective-c
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

```

接下来是一些子类的实现，在这里就不把所有的子类都列出来，大部分的实现大多相同，这里以最初的张飞和吕布为例进行展示，详细代码在文件中会给出

张飞的实现如下：

```objective-c

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

```

相应的注释已经给出，这里不再赘述

吕布的实现：

```objective-c
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

```

### 接下来是主函数的一些内容：

首先是选择人，这里采用了随机数的方法选择两个人进行战斗

```objective-c
id choose(void){
    //随机选人
        int num=(int)(arc4random()%12) + 1;
        if(num==8) return [[Zhangfei alloc]init];
        else if(num==7) return [[Lvbu alloc]init];
        else if(num==6) return [[Guanyu alloc]init];
        else if(num==5) return [[Liubei alloc]init];
        else if(num==4) return [[Taishici alloc]init];
        else if(num==1) return [[Dongzhuo alloc]init];
        else if(num==2) return [[Diaochan alloc]init];
        else if(num==3) return [[Zhangliao alloc]init];
        else if(num==9) return [[Lusu alloc] init];
        else if(num==10) return [[Xiahoudun alloc] init];
        else if(num==11) return [[Luxun alloc ]init];
        else if(num==12) return [[Simayi alloc]init];
    return nil;
}
```

然后是打斗的总过程，这里调用到了函数**void** beat(**id** first,**id** second)，这个函数的作用是进行每一轮的打斗

```objective-c
void PKOneUnit(id first,id second){
    int roundnum=1; //初始为第一轮
    NSString *str=[NSString stringWithFormat:@"%@ %@ VS%@ %@",[first getCountry],[first getName],[second getCountry],[second getName]];
    NSLog(@"%@",str);
    [first zhuangtai]; //展示初始状态
    [second zhuangtai]; //展示初始状态
    for(;roundnum<10;roundnum++){
        NSString *str=[NSString stringWithFormat:@"第%d回合",roundnum];
        NSLog(@"%@",str);
        beat(first,second); //进行战斗，优先级高的先打
        if([second getBlood_value]<0) { //生命值为零则失败，对方取得胜利
            NSString *str=[NSString stringWithFormat:@"%@战败，%@取得胜利", [second getName],[first getName]];
            NSLog(@"%@",str);
            break;
        }
        beat(second , first);//进行战斗，优先级低的后打
        if ([first getBlood_value]<0) {//生命值为零则失败，对方取得胜利
            NSString *str=[NSString stringWithFormat:@"%@战败,%@取得胜利", [first getName],[second getName]];
            NSLog(@"%@",str);
            break;
        }
        [first zhuangtai]; //战斗完成展示状态
        [second zhuangtai]; //战斗完成展示状态
        
    }
}
```

下面则是每一轮打斗的过程

```objective-c
void beat(id first,id second){//打斗的过程，这里设置普通攻击的概率为0.5，一技能为0.4，二技能为0.1
    int zhaoshi1=arc4random()%10+1;
    if(zhaoshi1>0&&zhaoshi1<=5){
        double num=[first pingA:second];//普通攻击
        [second setblood_value:[second getBlood_value]-num]; //设置被打的人生命值
        NSString *str=[NSString stringWithFormat:@"%@受到%.2f点伤害", [second getName],num];
        NSLog(@"%@",str);
    }
    else if(zhaoshi1>5&&zhaoshi1<=9){
        double num=[first skillone:second]; //一技能
        [second setblood_value:[second getBlood_value]-num];
        NSString *str=[NSString stringWithFormat:@"%@受到%.2f点伤害", [second getName],num];
        NSLog(@"%@",str);
    }
    else if(zhaoshi1==10){
        double num=[first skilltwo:second]; //二技能
        [second setblood_value:[second getBlood_value]-num];
        NSString *str=[NSString stringWithFormat:@"%@受到%.2f点伤害", [second getName],num];
        NSLog(@"%@",str);
    }
    
}
```

主函数的主要关系是main——PK——PKOneUnit——beat层层调用的关系，其中main还用到了choose函数选择出战的人

main函数如下所示：

```objective-c
int main(int argc, char * argv[]) {
    id onerole=choose();
    id tworole=choose();
    PK(onerole ,tworole);
    return 0;

}
```

整个main.m如下：

```objective-c
//
//  main.m
//  sanguosha
//
//  Created by feiylang on 2020/10/6.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Hero.h"
id choose(void);
void PK(id first,id second);
void PKOneUnit(id hero1,id hero2);
void beat(id  first,id second);
int main(int argc, char * argv[]) {
    id onerole=choose();
    id tworole=choose();
    PK(onerole ,tworole);
    return 0;

}
id choose(void){
    //随机选人
        int num=(int)(arc4random()%12) + 1;
        if(num==8) return [[Zhangfei alloc]init];
        else if(num==7) return [[Lvbu alloc]init];
        else if(num==6) return [[Guanyu alloc]init];
        else if(num==5) return [[Liubei alloc]init];
        else if(num==4) return [[Taishici alloc]init];
        else if(num==1) return [[Dongzhuo alloc]init];
        else if(num==2) return [[Diaochan alloc]init];
        else if(num==3) return [[Zhangliao alloc]init];
        else if(num==9) return [[Lusu alloc] init];
        else if(num==10) return [[Xiahoudun alloc] init];
        else if(num==11) return [[Luxun alloc ]init];
        else if(num==12) return [[Simayi alloc]init];
    return nil;
}
void PK(id hero1,id hero2){
    if([hero1 youxianji]<[hero2 youxianji]){ //优先级高的先打，如果顺序反了则反过来打
        PKOneUnit(hero1,hero2);
    }
    else
        PKOneUnit(hero2,hero1);
}
void PKOneUnit(id first,id second){
    int roundnum=1; //初始为第一轮
    NSString *str=[NSString stringWithFormat:@"%@ %@ VS%@ %@",[first getCountry],[first getName],[second getCountry],[second getName]];
    NSLog(@"%@",str);
    [first zhuangtai]; //展示初始状态
    [second zhuangtai]; //展示初始状态
    for(;roundnum<10;roundnum++){
        NSString *str=[NSString stringWithFormat:@"第%d回合",roundnum];
        NSLog(@"%@",str);
        beat(first,second); //进行战斗，优先级高的先打
        if([second getBlood_value]<0) { //生命值为零则失败，对方取得胜利
            NSString *str=[NSString stringWithFormat:@"%@战败，%@取得胜利", [second getName],[first getName]];
            NSLog(@"%@",str);
            break;
        }
        beat(second , first);//进行战斗，优先级低的后打
        if ([first getBlood_value]<0) {//生命值为零则失败，对方取得胜利
            NSString *str=[NSString stringWithFormat:@"%@战败,%@取得胜利", [first getName],[second getName]];
            NSLog(@"%@",str);
            break;
        }
        [first zhuangtai]; //战斗完成展示状态
        [second zhuangtai]; //战斗完成展示状态
        
    }
}
void beat(id first,id second){//打斗的过程，这里设置普通攻击的概率为0.5，一技能为0.4，二技能为0.1
    int zhaoshi1=arc4random()%10+1;
    if(zhaoshi1>0&&zhaoshi1<=5){
        double num=[first pingA:second];//普通攻击
        [second setblood_value:[second getBlood_value]-num]; //设置被打的人生命值
        NSString *str=[NSString stringWithFormat:@"%@受到%.2f点伤害", [second getName],num];
        NSLog(@"%@",str);
    }
    else if(zhaoshi1>5&&zhaoshi1<=9){
        double num=[first skillone:second]; //一技能
        [second setblood_value:[second getBlood_value]-num];
        NSString *str=[NSString stringWithFormat:@"%@受到%.2f点伤害", [second getName],num];
        NSLog(@"%@",str);
    }
    else if(zhaoshi1==10){
        double num=[first skilltwo:second]; 二技能
        [second setblood_value:[second getBlood_value]-num];
        NSString *str=[NSString stringWithFormat:@"%@受到%.2f点伤害", [second getName],num];
        NSLog(@"%@",str);
    }
    
}

```

## 实验结果：

进行多次试验发现实验结果均正确

以下截取部分片段：

##### 战斗一	

```
20-10-09 00:58:56.421401+0800 sanguosha[4634:340442] 蜀国 张飞 VS魏国 夏侯惇
2020-10-09 00:58:56.421787+0800 sanguosha[4634:340442] 张飞现在的生命值为5000.00 ,能量值为20
2020-10-09 00:58:56.421884+0800 sanguosha[4634:340442] 夏侯惇现在的生命值为5000.00 ,能量值为100
2020-10-09 00:58:56.421942+0800 sanguosha[4634:340442] 第1回合
2020-10-09 00:58:56.422014+0800 sanguosha[4634:340442] 张飞发动普通攻击，对方受到500点伤害
2020-10-09 00:58:56.422088+0800 sanguosha[4634:340442] 夏侯惇受到500.00点伤害
2020-10-09 00:58:56.422210+0800 sanguosha[4634:340442] 夏侯惇发动二技能，对方受到4815.00点伤害。能量剩余97
2020-10-09 00:58:56.422296+0800 sanguosha[4634:340442] 张飞受到2250.00点伤害
2020-10-09 00:58:56.422354+0800 sanguosha[4634:340442] 张飞现在的生命值为2750.00 ,能量值为20
2020-10-09 00:58:56.422422+0800 sanguosha[4634:340442] 夏侯惇现在的生命值为4500.00 ,能量值为97
2020-10-09 00:58:56.422538+0800 sanguosha[4634:340442] 第2回合
2020-10-09 00:58:56.422702+0800 sanguosha[4634:340442] 张飞发动普通攻击，对方受到500点伤害
2020-10-09 00:58:56.422825+0800 sanguosha[4634:340442] 夏侯惇受到500.00点伤害
2020-10-09 00:58:56.422933+0800 sanguosha[4634:340442] 夏侯惇发动普通攻击，对方受到450点伤害
2020-10-09 00:58:56.423058+0800 sanguosha[4634:340442] 张飞受到450.00点伤害
2020-10-09 00:58:56.423172+0800 sanguosha[4634:340442] 张飞现在的生命值为2300.00 ,能量值为20
2020-10-09 00:58:56.423286+0800 sanguosha[4634:340442] 夏侯惇现在的生命值为4000.00 ,能量值为97
2020-10-09 00:58:56.425787+0800 sanguosha[4634:340442] 第3回合
2020-10-09 00:58:56.425884+0800 sanguosha[4634:340442] 张飞发动一技能，对方受到590.00点伤害，能量剩余18
2020-10-09 00:58:56.425965+0800 sanguosha[4634:340442] 夏侯惇受到590.00点伤害
2020-10-09 00:58:56.426040+0800 sanguosha[4634:340442] 夏侯惇发动一技能，对方受到877.50点伤害，能量剩余95
2020-10-09 00:58:56.426108+0800 sanguosha[4634:340442] 张飞受到450.00点伤害
2020-10-09 00:58:56.426175+0800 sanguosha[4634:340442] 张飞现在的生命值为1850.00 ,能量值为18
2020-10-09 00:58:56.426240+0800 sanguosha[4634:340442] 夏侯惇现在的生命值为3410.00 ,能量值为95
2020-10-09 00:58:56.426298+0800 sanguosha[4634:340442] 第4回合
2020-10-09 00:58:56.426366+0800 sanguosha[4634:340442] 张飞发动普通攻击，对方受到500点伤害
2020-10-09 00:58:56.426480+0800 sanguosha[4634:340442] 夏侯惇受到500.00点伤害
2020-10-09 00:58:56.426640+0800 sanguosha[4634:340442] 夏侯惇发动普通攻击，对方受到450点伤害
2020-10-09 00:58:56.426803+0800 sanguosha[4634:340442] 张飞受到450.00点伤害
2020-10-09 00:58:56.426960+0800 sanguosha[4634:340442] 张飞现在的生命值为1400.00 ,能量值为18
2020-10-09 00:58:56.427103+0800 sanguosha[4634:340442] 夏侯惇现在的生命值为2910.00 ,能量值为95
2020-10-09 00:58:56.427244+0800 sanguosha[4634:340442] 第5回合
2020-10-09 00:58:56.427386+0800 sanguosha[4634:340442] 张飞发动普通攻击，对方受到500点伤害
2020-10-09 00:58:56.427574+0800 sanguosha[4634:340442] 夏侯惇受到500.00点伤害
2020-10-09 00:58:56.427700+0800 sanguosha[4634:340442] 夏侯惇发动普通攻击，对方受到450点伤害
2020-10-09 00:58:56.427857+0800 sanguosha[4634:340442] 张飞受到450.00点伤害
2020-10-09 00:58:56.427997+0800 sanguosha[4634:340442] 张飞现在的生命值为950.00 ,能量值为18
2020-10-09 00:58:56.428165+0800 sanguosha[4634:340442] 夏侯惇现在的生命值为2410.00 ,能量值为95
2020-10-09 00:58:56.428324+0800 sanguosha[4634:340442] 第6回合
2020-10-09 00:58:56.428467+0800 sanguosha[4634:340442] 张飞发动普通攻击，对方受到500点伤害
2020-10-09 00:58:56.428639+0800 sanguosha[4634:340442] 夏侯惇受到500.00点伤害
2020-10-09 00:58:56.428782+0800 sanguosha[4634:340442] 夏侯惇发动普通攻击，对方受到450点伤害
2020-10-09 00:58:56.428911+0800 sanguosha[4634:340442] 张飞受到450.00点伤害
2020-10-09 00:58:56.429067+0800 sanguosha[4634:340442] 张飞现在的生命值为500.00 ,能量值为18
2020-10-09 00:58:56.429200+0800 sanguosha[4634:340442] 夏侯惇现在的生命值为1910.00 ,能量值为95
2020-10-09 00:58:56.429347+0800 sanguosha[4634:340442] 第7回合
2020-10-09 00:58:56.429492+0800 sanguosha[4634:340442] 张飞发动二技能，对方受到1250.00点伤害。能量剩余15
2020-10-09 00:58:56.429670+0800 sanguosha[4634:340442] 夏侯惇受到1250.00点伤害
2020-10-09 00:58:56.429783+0800 sanguosha[4634:340442] 夏侯惇发动普通攻击，对方受到450点伤害
2020-10-09 00:58:56.429888+0800 sanguosha[4634:340442] 张飞受到450.00点伤害
2020-10-09 00:58:56.430071+0800 sanguosha[4634:340442] 张飞现在的生命值为50.00 ,能量值为15
2020-10-09 00:58:56.430277+0800 sanguosha[4634:340442] 夏侯惇现在的生命值为660.00 ,能量值为95
2020-10-09 00:58:56.430466+0800 sanguosha[4634:340442] 第8回合
2020-10-09 00:58:56.430628+0800 sanguosha[4634:340442] 张飞发动一技能，对方受到565.00点伤害，能量剩余13
2020-10-09 00:58:56.430799+0800 sanguosha[4634:340442] 夏侯惇受到565.00点伤害
2020-10-09 00:58:56.430939+0800 sanguosha[4634:340442] 夏侯惇发动普通攻击，对方受到450点伤害
2020-10-09 00:58:56.431086+0800 sanguosha[4634:340442] 张飞受到450.00点伤害
2020-10-09 00:58:56.431227+0800 sanguosha[4634:340442] 张飞战败,夏侯惇取得胜利
```

##### 战斗二

```
2020-10-09 00:59:46.839851+0800 sanguosha[4642:341338] 群雄 董卓 VS群雄 貂蝉
2020-10-09 00:59:46.840322+0800 sanguosha[4642:341338] 董卓现在的生命值为6000.00 ,能量值为50
2020-10-09 00:59:46.840420+0800 sanguosha[4642:341338] 貂蝉现在的生命值为2500.00 ,能量值为60
2020-10-09 00:59:46.840496+0800 sanguosha[4642:341338] 第1回合
2020-10-09 00:59:46.840572+0800 sanguosha[4642:341338] 董卓发动一技能，对方受到666.00点伤害，能量剩余48
2020-10-09 00:59:46.840638+0800 sanguosha[4642:341338] 貂蝉受到666.00点伤害
2020-10-09 00:59:46.840702+0800 sanguosha[4642:341338] 貂蝉发动普通攻击，对方受到800点伤害
2020-10-09 00:59:46.840764+0800 sanguosha[4642:341338] 董卓受到800.00点伤害
2020-10-09 00:59:46.840820+0800 sanguosha[4642:341338] 董卓现在的生命值为5200.00 ,能量值为48
2020-10-09 00:59:46.840886+0800 sanguosha[4642:341338] 貂蝉现在的生命值为1834.00 ,能量值为60
2020-10-09 00:59:46.840940+0800 sanguosha[4642:341338] 第2回合
2020-10-09 00:59:46.841004+0800 sanguosha[4642:341338] 董卓发动一技能，对方受到657.00点伤害，能量剩余46
2020-10-09 00:59:46.841133+0800 sanguosha[4642:341338] 貂蝉受到657.00点伤害
2020-10-09 00:59:46.843340+0800 sanguosha[4642:341338] 貂蝉发动一技能，对方受到1264.00点伤害，能量剩余58
2020-10-09 00:59:46.843423+0800 sanguosha[4642:341338] 董卓受到1264.00点伤害
2020-10-09 00:59:46.843479+0800 sanguosha[4642:341338] 董卓现在的生命值为3936.00 ,能量值为46
2020-10-09 00:59:46.843530+0800 sanguosha[4642:341338] 貂蝉现在的生命值为1177.00 ,能量值为58
2020-10-09 00:59:46.843605+0800 sanguosha[4642:341338] 第3回合
2020-10-09 00:59:46.843701+0800 sanguosha[4642:341338] 董卓发动二技能，对方受到2385.00点伤害。能量剩余43
2020-10-09 00:59:46.843762+0800 sanguosha[4642:341338] 貂蝉受到2385.00点伤害
2020-10-09 00:59:46.843813+0800 sanguosha[4642:341338] 貂蝉战败，董卓取得胜利
```

经过验证，实验结果均正确

## 实验心得：

虽然本次实验并不是特别难，但是在一开始上手的时候还是有不小的问题，一开始对于面向对象编程有点儿陌生了，后来先复习了一下c++的继承等知识，然后再在网上找了一些oc 的相应的知识，最终得以完成本次实验，经过本次实验，我大体上掌握了oc语言的基本语法，也对oc的面向对象编程有了一定的认识，同时自己也熟悉了oc中的继承，多态等操作，也找到了oc语言和c++，Java语言的一些共性，提升了自己的学习兴趣，也为接下来的学习夯实了基础，自己也对oc语言产生了浓厚的兴趣。
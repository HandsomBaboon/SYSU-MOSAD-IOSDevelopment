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
        double num=[first skilltwo:second]; //二技能
        [second setblood_value:[second getBlood_value]-num];
        NSString *str=[NSString stringWithFormat:@"%@受到%.2f点伤害", [second getName],num];
        NSLog(@"%@",str);
    }
    
}

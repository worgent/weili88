package cn.taiqiu8.service;

import cn.taiqiu8.model.AssistOrder;
import cn.taiqiu8.model.ChargeOrder;
import cn.taiqiu8.model.User;
import cn.taiqiu8.model.WithdrawlOrder;

/**
 * Created by worgen on 2015/8/3.
 */
public interface MoneyService {
    //充值
    public int charge(User user, int amount);
    public int doCharge(ChargeOrder chargeOrder);
    //提现
    public int withdrawl(User user, int amount);
    public int doWithdrawl(WithdrawlOrder withdrawlOrder);
    public int refuseWithdrawl(WithdrawlOrder withdrawlOrder);
    //订单支付
    public int pay(AssistOrder assistOrder);
}


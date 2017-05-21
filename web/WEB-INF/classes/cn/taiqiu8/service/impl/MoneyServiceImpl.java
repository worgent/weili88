package cn.taiqiu8.service.impl;

import cn.taiqiu8.model.AssistOrder;
import cn.taiqiu8.model.ChargeOrder;
import cn.taiqiu8.model.User;
import cn.taiqiu8.model.WithdrawlOrder;
import cn.taiqiu8.service.MoneyService;

/**
 * Created by worgen on 2015/8/3.
 */
public class MoneyServiceImpl implements MoneyService {
    public int charge(User user, int amount) {
        return 0;
    }

    public int doCharge(ChargeOrder chargeOrder) {
        return 0;
    }

    public int withdrawl(User user, int amount) {
        return 0;
    }

    public int doWithdrawl(WithdrawlOrder withdrawlOrder) {
        return 0;
    }

    public int refuseWithdrawl(WithdrawlOrder withdrawlOrder) {
        return 0;
    }

    public int pay(AssistOrder assistOrder) {
        return 0;
    }
}

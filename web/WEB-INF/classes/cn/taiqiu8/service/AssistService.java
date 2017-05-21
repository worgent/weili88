package cn.taiqiu8.service;

import cn.taiqiu8.model.AssistOrder;

/**
 * Created by worgen on 2015/8/3.
 */
public interface AssistService {
    //根据条件获得教练
    //助练认证

    //用户单人模式约助练
    public int createOrder();


    //用户群发模式约助练
    public int createBroadcastOrder();

    //助练接单
    public int acceptOrder(AssistOrder assistOrder);

    //取消订单
    public int cancelOrder(AssistOrder assistOrder);
    //结算订单
    public int completeOrder(AssistOrder assistOrder);
    //评价订单
    public int evaluateOrder(AssistOrder assistOrder);

}

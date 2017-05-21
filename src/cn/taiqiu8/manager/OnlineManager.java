package cn.taiqiu8.manager;

import cn.taiqiu8.model.AssistOrder;

import java.util.HashMap;
import java.util.HashSet;

/**
 * Created by worgen on 2015/8/3.
 * 在线数据管理
 */
public class OnlineManager {
    //在线用户
    private HashSet<Integer> onlineCustomer;

    //在线教练
    private HashSet<Integer> onlineAssist;

    //在线群发
    private HashMap<Integer, AssistOrder> onlineBroadcastAssist;

    //在线约助练
    private HashMap<Integer, AssistOrder> onlineAssistOrder;

    //用户是否在线
    public boolean isCustomerOnline(int userId){
        if( onlineCustomer.contains(userId) ){
            return true;
        }
        return false;
    }
    //用户下线
    public void customerOnline(int userId){
        onlineCustomer.add(userId);
    }
    //用户上线
    public void customerOffline(int userId){
        onlineCustomer.remove(userId);
    }

    //助教是否在线
    public boolean isAssistOnline(int userId){
        if( onlineAssist.contains(userId) ){
            return true;
        }
        return false;
    }
    //助教上线
    public void assistOnline(int userId){
        onlineAssist.add(userId);
    }
    //助教下线
    public void assistOffline(int userId){
        onlineAssist.remove(userId);
    }

    //根据ID查找订单
    public AssistOrder getOnlineAssistOrder(int orderId){
        return onlineAssistOrder.get(orderId);
    }
    //插入订单
    public void insertOnlineAssistOrder(int orderId, AssistOrder assistOrder){
        onlineAssistOrder.put(orderId, assistOrder);
    }
    //删除订单
    public void removeOnlineAssistOrder(int orderId){
        onlineAssistOrder.remove(orderId);
    }

    //根据ID查找广播订单
    public AssistOrder getOnlineBroadcastAssist(int orderId){
        return onlineBroadcastAssist.get(orderId);
    }
    //插入广播订单
    public void insertOnlineBroadcastAssist(int orderId, AssistOrder assistOrder){
        onlineBroadcastAssist.put(orderId, assistOrder);
    }
    //删除广播订单
    public void removeOnlineBroadcastAssist(int orderId){
        onlineBroadcastAssist.remove(orderId);
    }
}

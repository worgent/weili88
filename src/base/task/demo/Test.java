package base.task.demo;

import base.task.TaskExcutor;

/**
 * User: liuwentao
 * Time: 13-2-5 下午1:54
 */
public class Test {

    public static void main(String[] args){
        int cpuNums = Runtime.getRuntime().availableProcessors();
        System.out.println("cpuNums=" + cpuNums);
        DemoTask demoTask = new DemoTask("EEEEEEEEEEEEE1");
        TaskExcutor.addTask(demoTask);

        DemoTask demoTask2 = new DemoTask("EEEEEEEEEEEEE2");
        TaskExcutor.addTask(demoTask2);

        DemoTask demoTask3 = new DemoTask("EEEEEEEEEEEEE3");
        TaskExcutor.addTask(demoTask3);
        
    }
}

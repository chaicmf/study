package com.cmf.threadGroup;

public class ThreadGroupDemo1 {

    public static class TestThread extends Thread{
        @Override
        public void run() {
            super.run();
            System.out.println(String.format("当前执行的线程是：%s，优先级：%d",Thread.currentThread().getName(),Thread.currentThread().getPriority()));
        }
    }

    public static void main(String[] args) {
       ThreadGroup threadGroup=new ThreadGroup("t1");
        threadGroup.setMaxPriority(6);
            Thread thread=new Thread(threadGroup,"thread");
            thread.setPriority(9);
        System.out.println("我是线程组的优先级："+threadGroup.getMaxPriority());
        System.out.println("我是线程的优先级："+thread.getPriority());


        Thread[] threads=new Thread[threadGroup.activeCount()];
            ThreadGroup threadGroup1=new ThreadGroup("t2");
            threadGroup1.enumerate(threads);

    }
}

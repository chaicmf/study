package com.cmf.thread;

public class Demo1 {
    public static  class MyThread extends  Thread{

        @Override
        public void run() {
            System.out.println("myThread");
        }
    }
    public static  void main(String[] args){
        Thread myThread=new MyThread();
            myThread.start();

        myThread.start();
    }

}

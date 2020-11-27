package com.cmf.thread;

public class VolatileThread {
    private static volatile  int a=0;
    static class  ThreadA implements Runnable{

        @Override
        public void run() {
            while (a<5){
                    if(a%2==0){
                        synchronized (this) {

                            System.out.println("ThreadA:a=" + a);
                            a =a+ 1;
                        }
                    }

                }

            }

        }


    static class ThreadB implements  Runnable{

        @Override
        public  void run() {
            while (a<5){
                if(a%2==1){
                    synchronized(this){
                        System.out.println("ThreadB:a="+a);
                        a=a+1;

                    }
                }

            }


        }
    }


    public static void main(String[] args) {

        try {
            Thread thread =new Thread(new ThreadA(),"a");
            Thread threadB =new Thread(new ThreadB(),"b");
            thread.start();
            Thread.sleep(1000L);
            threadB.start();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
}

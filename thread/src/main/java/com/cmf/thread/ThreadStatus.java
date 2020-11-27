package com.cmf.thread;

import com.sun.org.apache.xerces.internal.parsers.CachingParserPool;

public class ThreadStatus {

    public static void main(String[] args) {

        try {
            Thread threadA=new Thread(new Runnable(){

                @Override
                public void run() {
                    testMothed();
                }
            },"a");
            Thread threadB=new Thread(new Runnable(){

                @Override
                public void run() {
                    testMothed();
                }
            },"b");
            threadA.start();
            threadA.join(1000L);
            threadB.start();
            System.out.println(threadA.getName()+":"+threadA.getState());

            System.out.println(threadB.getName()+":"+threadB.getState());
        } catch (InterruptedException e) {
            e.printStackTrace();
        }


    }

    private static synchronized    void testMothed(){
        try {
            Thread.sleep(2000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}

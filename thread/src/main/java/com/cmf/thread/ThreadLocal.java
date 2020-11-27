package com.cmf.thread;

public class ThreadLocal {

    static class ThreadA implements Runnable{

        private java.lang.ThreadLocal<String> threadLocal;

        public ThreadA(java.lang.ThreadLocal<String> threadLocal) {
            this.threadLocal = threadLocal;
        }

        @Override
        public void run() {
           threadLocal.set("A");
            try {
                Thread.sleep(1000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("ThreadA:"+threadLocal.get());
        }
    }

    static class  ThreadB implements  Runnable{

        private java.lang.ThreadLocal<String> threadLocal;

        public ThreadB(java.lang.ThreadLocal<String> threadLocal) {
            this.threadLocal = threadLocal;
        }
        @Override
        public void run() {
            threadLocal.set("B");
            try {
                Thread.sleep(1000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("ThreadB:"+threadLocal.get());
        }
    }

    public static void main(String[] args) {
        java.lang.ThreadLocal<String> threadLocal=new java.lang.ThreadLocal<>();
       new Thread(new ThreadA(threadLocal)).start();
        new Thread(new ThreadB(threadLocal)).start();

    }
}

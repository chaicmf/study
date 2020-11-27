package com.cmf.runable;

public class RunableDemo1 {
    public static class MyThread implements Runnable {
        @Override
        public void run() {
            System.out.println("MyThread");
        }
    }
    public static void main(String[] args) {
        new MyThread().run();
        // Java 8 函数式编程，可以省略MyThread类

    }
}

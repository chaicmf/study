package com.cmf.callable;

import java.util.concurrent.*;

public class CallableDEmo implements Callable<Integer> {

    @Override
    public Integer call() throws Exception {
        return 2 ;
    }

    public static void main(String[] args) {
        ExecutorService executorService= Executors.newCachedThreadPool();
        CallableDEmo dEmo=new CallableDEmo();
        Future<Integer> submit = executorService.submit(dEmo);
        try {
            System.out.println(submit.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

    }
}

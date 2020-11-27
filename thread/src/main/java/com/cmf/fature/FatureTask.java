package com.cmf.fature;

import java.util.concurrent.*;

public class FatureTask  implements Callable<Integer> {
    @Override
    public Integer call() throws Exception {
        return 2;
    }

    public static void main(String[] args) {
        ExecutorService executor= Executors.newCachedThreadPool();
        FutureTask<Integer> fatureTask=new FutureTask<Integer>(new FatureTask());
        executor.submit(fatureTask);
        try {
            System.out.println(fatureTask.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

    }
}

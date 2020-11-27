package com.cmf.pipe;

import java.io.IOException;
import java.io.PipedReader;
import java.io.PipedWriter;
import java.io.Reader;

public class PipeDemo {
    static  class ReaderThread implements Runnable{
        private PipedReader reader;

        public ReaderThread(PipedReader reader) {
            this.reader = reader;
        }

        @Override
        public void run() {
            System.out.println("this is reader");
            int receive=0;
            try {
                while((receive=reader.read())!=-1){
                    System.out.println("receive:"+(char)receive);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    static class WriterTread implements Runnable{
        private PipedWriter writer;

        public WriterTread(PipedWriter writer) {
            this.writer = writer;
        }

        @Override
        public void run() {
            System.out.println("this is PipeWriter");
            int receive=0;
            try {
                writer.write("test");
            } catch (IOException e) {
                e.printStackTrace();
            }finally {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void main(String[] args) throws IOException, InterruptedException {
        PipedWriter writer=new PipedWriter();
        PipedReader pipedReader=new PipedReader();
        writer.connect(pipedReader);

        new Thread(new ReaderThread(pipedReader)).start();
        Thread.sleep(1000L);
        new Thread(new WriterTread(writer)).start();
    }
}

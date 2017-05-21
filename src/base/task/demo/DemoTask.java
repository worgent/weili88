package base.task.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

/**
 * User: liuwentao
 * Time: 13-2-5 下午1:37
 */
public class DemoTask implements Runnable {
	private static AtomicLong sumCount = new AtomicLong();
	private static AtomicInteger curCount = new AtomicInteger();

    private String content;

	private static final Logger log = LoggerFactory.getLogger(DemoTask.class);
	public DemoTask(String content){
		this.content = content;
		sumCount.incrementAndGet();
		curCount.incrementAndGet();
	}

	@Override
	public void run() {
		System.out.println( "当前任务状况  "+ sumCount.get() + " " + curCount.get());
		System.out.println("this.content : " + this.content);
		curCount.decrementAndGet();
	}
}

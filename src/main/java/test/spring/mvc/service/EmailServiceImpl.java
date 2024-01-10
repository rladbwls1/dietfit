package test.spring.mvc.service;

import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import test.spring.mvc.bean.ProductDTO; // ProductDTO를 import 추가
import test.spring.mvc.repository.AdminMapper;

@Service
public class EmailServiceImpl implements EmailService {
    @Autowired
    private AdminMapper mapper;

    @Override
    public void sendMail(String companyid, String category, String category2, String flavor)
            throws MessagingException {
        String from = "dietfitdie@gmail.com";
        String password = "mbeoyyanzgsppied";

        // SMTP 프로토콜 설정
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");

        // 보내는 사람 계정 정보 설정
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        // 메일 내용에 필요한 companyemail, productName, stock
        String companyemail = mapper.getCompanyEmail(companyid);
        String productName = mapper.getProductName(companyid, category, category2, flavor);
        int stock = mapper.getProductStock(productName);

        String subject = "Dietfit입니다. 재고수량 관련 메일 드립니다.";
        String text = "<h1>안녕하세요 Dietfit입니다<h1>"
                + "<p>" + productName + "상품 재고수 " + stock + "개 미만으로 메일드립니다</p>";

        // 메일 내용 작성
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(from));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(companyemail));
        msg.setSubject(subject);
        msg.setContent(text, "text/html; charset=utf-8"); // html 보내기 위해서

        // 메일 보내기
        Transport.send(msg);
    }

}

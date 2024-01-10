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

import test.spring.mvc.bean.ProductDTO; // ProductDTO�� import �߰�
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

        // SMTP �������� ����
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");

        // ������ ��� ���� ���� ����
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        // ���� ���뿡 �ʿ��� companyemail, productName, stock
        String companyemail = mapper.getCompanyEmail(companyid);
        String productName = mapper.getProductName(companyid, category, category2, flavor);
        int stock = mapper.getProductStock(productName);

        String subject = "Dietfit�Դϴ�. ������ ���� ���� �帳�ϴ�.";
        String text = "<h1>�ȳ��ϼ��� Dietfit�Դϴ�<h1>"
                + "<p>" + productName + "��ǰ ���� " + stock + "�� �̸����� ���ϵ帳�ϴ�</p>";

        // ���� ���� �ۼ�
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(from));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(companyemail));
        msg.setSubject(subject);
        msg.setContent(text, "text/html; charset=utf-8"); // html ������ ���ؼ�

        // ���� ������
        Transport.send(msg);
    }

}

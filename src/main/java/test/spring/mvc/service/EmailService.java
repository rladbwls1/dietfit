package test.spring.mvc.service;

import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface EmailService {
   public void sendMail(String companyid, String category, String category2, String flavor) throws MessagingException;
}

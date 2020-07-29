package com.company.email;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
public class Email {
public static void main(String args[]) {
SimpleEmail email = new SimpleEmail();
// setHostName에 실제 메일서버정보
email.setCharset("euc-kr"); // 한글 인코딩
email.setHostName("smtp.gmail.com"); //SMTP서버 설정
email.setSmtpPort(465);
email.setAuthenticator(new DefaultAuthenticator("bang960527@gmail.com", "gddbsrqvetjlstms"));
email.setSSLOnConnect(true);
try {
email.addTo("agumon05@naver.com", "방석민"); // 수신자 추가
} catch (EmailException e) {
e.printStackTrace();
}
try {
email.setFrom("bang960527@gmail.com", "방석민"); // 보내는 사람
} catch (EmailException e) {
e.printStackTrace();
}
email.setSubject("메일전송테스트"); // 메일 제목
email.setContent("simple 메일 Test입니다", "text/plain; charset=euc-kr");
try {
email.send();
} catch (EmailException e) {
e.printStackTrace();
}
}
}
package com.example.StudentDemo.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Random;

@Service
public class OtpService {

	@Autowired
    private JavaMailSender mailSender;

	
    private final HashMap<String, String> otpStorage = new HashMap<>();

    public String generateOtp(String email) {
    	
        String otp = String.format("%06d", new Random().nextInt(999999));
        otpStorage.put(email, otp);
        return otp;
    }

    public boolean validateOtp(String email, String userInputOtp) {
        String actualOtp = otpStorage.get(email);
        System.out.println("Goutam");
        return actualOtp != null && actualOtp.equals(userInputOtp);
    }
    
    
    public void sendOtpEmail(String to, String otp) {
        String subject = "Your OTP Code";
        String text = "Your One-Time Password (OTP) is: " + otp + "\n\n" +
                      "Please use this OTP within 5 minutes to verify your email.";
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("gy9301794230@gmail.com"); // Same as spring.mail.username
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        mailSender.send(message);
    }
    
}

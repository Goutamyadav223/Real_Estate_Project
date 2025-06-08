package com.example.StudentDemo.StudentController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.example.StudentDemo.StudentServiceImpl.OtpService;

@RestController
@RequestMapping("/otp")
public class OtpController {

    @Autowired
    private OtpService otpService;

    @PostMapping("/send")
    public String sendOtp(@RequestParam("email") String mail) {
        String otp = otpService.generateOtp(mail);
        otpService.sendOtpEmail(mail, otp);
        System.out.println("call 3");
        return "OTP sent successfully to " + mail;
    }

    @PostMapping("/verify")
    public String verifyOtp(@RequestParam String email, @RequestParam String otp) {
    	System.out.println("call 6");
    	boolean isValid = otpService.validateOtp(email, otp);
        return isValid ? "OTP Verified Successfully" : "Invalid OTP";
    }
    
    
}

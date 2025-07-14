package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepo;

    @GetMapping("/login")
    public String home() {
        return "login";
    }

    @GetMapping("/signup")
    public String signupForm() {
        return "Signup";
    }

    @PostMapping("/signup")
    public String signup(User user, Model model) {
        // Check if someone is trying to register as admin
        if (user.getRole().equalsIgnoreCase("admin")) {
            // Only allow if no admin exists
            if (userRepo.findByRole("admin") != null) {
                model.addAttribute("error", "Admin already exists. You can only sign up as User.");
                return "Signup";
            }
        }

        userRepo.save(user);
        return "redirect:/login";
    }


    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        User user = userRepo.findByUsernameAndPassword(username, password);
        if (user != null && user.getRole() != null) {
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());

            if (user.getRole().equalsIgnoreCase("admin")) {
                return "redirect:/add-shipment";
            } else {
                return "redirect:/track-shipment";
            }
        } else {
            model.addAttribute("error", "Invalid Credentials");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
    @GetMapping("/")
    public String showHome() {
        return "home";  // your home.jsp
    }

    

}

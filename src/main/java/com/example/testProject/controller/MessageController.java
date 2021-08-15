package com.example.testProject.controller;

import com.example.testProject.domain.Message;
import com.example.testProject.domain.User;
import com.example.testProject.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/message")
@PreAuthorize("hasAuthority('ADMIN')")
public class MessageController {
    @Autowired
    MessageRepo messageRepo;

    @GetMapping("{message}")
    public String userEditForm(@PathVariable Message message, Model model) {
        model.addAttribute("message", message);

        return "messageEdit";
    }

    @PostMapping
    public String messageSave(
            @RequestParam String text,
            @RequestParam String tag,
            @RequestParam("messageId") Message message
    ) {
        message.setText(text);
        message.setTag(tag);

        messageRepo.save(message);

        return "redirect:/main";
    }

    @PostMapping("/delete")
    public String messageDelete(@RequestParam("messageId") Message message) {
        messageRepo.delete(message);

        return "redirect:/main";
    }
}

package com.example.demo.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Goods;
import com.example.demo.repository.LogisticsRepo;



@Controller
public class LogisticsController {
	
	

    @Autowired
    private LogisticsRepo repo;
    
    

    @GetMapping("/add-shipment")
    public String showAddForm(Model model) {
        model.addAttribute("shipment", new Goods());
        return "addShipment";
    }

    @PostMapping("/save-shipment")
    public String saveShipment(@ModelAttribute Goods shipment) {
    	shipment.setBookingDate(LocalDate.now().toString());

        shipment.setStatus("Pending");
        shipment.setTrackingId(UUID.randomUUID().toString().substring(0, 8));
        repo.save(shipment);
        return "redirect:/view-shipments";
    }

    @GetMapping("/view-shipments")
    public String viewShipments(Model model) {
        List<Goods> list = repo.findAll();
        model.addAttribute("shipments", list);
        return "viewShipments";
    }

    @GetMapping("/track-shipment")
    public String showTrackForm() {
    	 System.out.println("🟢 /track-shipment GET called");
        return "trackShipment";
    }
    
    @PostMapping("/track-shipment")
    public String trackShipment(@RequestParam String trackingId,
                                 @RequestParam String receiverName,
                                 Model model) {
        Optional<Goods> shipment = repo.findByTrackingIdAndReceiverName(trackingId, receiverName);
        if (shipment.isPresent()) {
            model.addAttribute("shipment", shipment.get());
            System.out.println("✅ Track found");
            return "viewTrackedShipment";
        } else {
            model.addAttribute("error", "No shipment found");
            return "trackShipment";
        }
    }

    
    
    @PostMapping("/get-tracking-id")
    public String getTrackingId(@RequestParam String receiverName,
                                @RequestParam String toLocation,
                                Model model) {
        Optional<Goods> shipment = repo.findByReceiverNameAndToLocation(receiverName, toLocation);
        if (shipment.isPresent()) {
            model.addAttribute("trackingIdFound", shipment.get().getTrackingId());
        } else {
            model.addAttribute("errorId", "No shipment found for the entered name and location.");
        }
        model.addAttribute("receiverName", receiverName);
        model.addAttribute("toLocation", toLocation);
        return "trackShipment";
    }


    @GetMapping("/update-shipment/{id}")
    public String updateStatusForm(@PathVariable Long id, Model model) {
        Goods shipment = repo.findById(id).orElseThrow();
        model.addAttribute("shipment", shipment);
        return "updateShipment";
    }

    @PostMapping("/update-shipment")
    public String updateStatus(@ModelAttribute Goods shipment) {
        repo.save(shipment);
        return "redirect:/view-shipments";
    }

}

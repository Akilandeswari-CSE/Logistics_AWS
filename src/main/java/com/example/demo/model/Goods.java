package com.example.demo.model;
import javax.persistence.*;

//import java.time.LocalDate;

@Entity

public class Goods {
	
	

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    private String trackingId;
	    private String senderName;
	    private String receiverName;
	    private String fromLocation;
	    private String toLocation;
	    private String status;
	    private String bookingDate;
	    



	    // Getters and Setters
	    public Long getId() { return id; }
	    public void setId(Long id) { this.id = id; }

	    public String getTrackingId() { return trackingId; }
	    public void setTrackingId(String trackingId) { this.trackingId = trackingId; }

	    public String getSenderName() { return senderName; }
	    public void setSenderName(String senderName) { this.senderName = senderName; }

	    public String getReceiverName() { return receiverName; }
	    public void setReceiverName(String receiverName) { this.receiverName = receiverName; }

	    public String getFromLocation() { return fromLocation; }
	    public void setFromLocation(String fromLocation) { this.fromLocation = fromLocation; }

	    public String getToLocation() { return toLocation; }
	    public void setToLocation(String toLocation) { this.toLocation = toLocation; }

	    public String getStatus() { return status; }
	    public void setStatus(String status) { this.status = status; }

	    public String getBookingDate() { return bookingDate; }
	    public void setBookingDate(String bookingDate) { this.bookingDate = bookingDate; }
	    
	   

	}



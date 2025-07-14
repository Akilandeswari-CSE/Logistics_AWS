package com.example.demo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Goods;

public interface LogisticsRepo  extends JpaRepository<Goods, Long> {
	Optional<Goods> findByTrackingIdAndReceiverName(String trackingId, String receiverName);
	Optional<Goods> findByReceiverNameAndToLocation(String receiverName, String toLocation);


}

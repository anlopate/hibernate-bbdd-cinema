package com.jacaranda.model;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Cine")
public class Cinema {
	
	@Id
	@Column(name = "cine")
	private String cinema;
	@Column(name = "ciudad_cine")
	private String city_cinema;
	@Column(name="direccion_cine")
	private String adress_cinema;
	
	
	public Cinema(String cinema, String city_cinema, String adress_cinema) {
		super();
		this.cinema = cinema;
		this.city_cinema = city_cinema;
		this.adress_cinema = adress_cinema;
	}
	
	public Cinema() {
		super();
		
	}
	public String getCinema() {
		return cinema;
	}
	public void setCinema(String cinema) {
		this.cinema = cinema;
	}
	public String getCity_cinema() {
		return city_cinema;
	}
	public void setCity_cinema(String city_cinema) {
		this.city_cinema = city_cinema;
	}
	public String getAdress_cinema() {
		return adress_cinema;
	}
	public void setAdress_cinema(String adress_cinema) {
		this.adress_cinema = adress_cinema;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cinema);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cinema other = (Cinema) obj;
		return Objects.equals(cinema, other.cinema);
	}

	@Override
	public String toString() {
		return "Cinema [cine=" + cinema + ", ciudad_cine=" + city_cinema + ", direccion_cine=" + adress_cinema + "]";
	}
	
	
	
	

}

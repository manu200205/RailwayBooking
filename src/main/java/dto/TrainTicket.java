package dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class TrainTicket {
@Id
int pnrNumber;
String from;
String to;
int trainNumber;
LocalDateTime time;
boolean status;
double price;
}

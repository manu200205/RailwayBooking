package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TrainDao;
import dao.UserDao;
import dto.Train;
import dto.TrainTicket;
import dto.User;

@WebServlet("/bookticket")
public class BookTicket extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("user");
		if (user == null) {
			resp.getWriter().print("<h1 style='color:red'>Session Expired Login Again</h1>");
			req.getRequestDispatcher("Home.html").include(req, resp);
		} else {
			int trainNumber = Integer.parseInt(req.getParameter("tnumber"));
			TrainDao dao = new TrainDao();
			Train train = dao.fetch(trainNumber);
			String source = req.getParameter("source");
			String destination = req.getParameter("destination");
			int numberOfSeats = Integer.parseInt(req.getParameter("seats"));
			Date doj = Date.valueOf(req.getParameter("doj"));
			Date dob = Date.valueOf(LocalDate.now());
			if (numberOfSeats <= 0) {
				resp.getWriter().print("<h1 style='color=red'>Seat can not be less than 1</h1>");
				req.getRequestDispatcher("UserHome.html").include(req, resp);
			} else {
				if (source.equals(destination)) {
					resp.getWriter().print("<h1 style='color:red'>Source and Destination can not be same</h1>");
					req.getRequestDispatcher("UserHome.html").include(req, resp);
				} else {
					int sourcePos = 0;
					int destinationPos = 0;
					for (int i = 0; i < train.getStations().length; i++) {
						if (train.getStations()[i].equals(source)) {
							sourcePos = i;
						}
						if (train.getStations()[i].equals(destination)) {
							destinationPos = i;
						}
					}
					if (sourcePos > destinationPos) {
						resp.getWriter().print("<h1 style='color:red'>Select Valid Source and Destination</h1>");
						req.getRequestDispatcher("UserHome.html").include(req, resp);
					} else {
						double price = Double.parseDouble(train.getPrice()[destinationPos])
								- Double.parseDouble(train.getPrice()[sourcePos]);
						double amount = numberOfSeats * price;

						boolean flag = true;
						for (String day : train.getDays()) {
							if (day.equalsIgnoreCase(
									doj.toLocalDate().getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH))) {
								flag = false;
							}
						}

						if (Period.between(dob.toLocalDate(), doj.toLocalDate()).getDays() < 0 || flag) {
							resp.getWriter().print("<h1 style='color:red'>Train Not Available in the selected date </h1>");
							req.getRequestDispatcher("UserHome.html").include(req, resp);
						} else {
							if (user.getWallet() < amount) {
								resp.getWriter().print("<h1 style='color:red'>Insufficient funds for booking ticket</h1>");
								req.getRequestDispatcher("UserHome.html").include(req, resp);
							} else {
								if (train.getSeat() < numberOfSeats) {
									resp.getWriter().print("<h1 style='color:red'>Seats not Available</h1>");
									req.getRequestDispatcher("UserHome.html").include(req, resp);
								} else {
									TrainTicket ticket = new TrainTicket();
									ticket.setAmount(amount);
									ticket.setDateOfBooking(dob);
									ticket.setDateOfJourney(doj);
									ticket.setSource(source);
									ticket.setNumberOfSeats(numberOfSeats);
									ticket.setDestination(destination);
									ticket.setTrainNumber(trainNumber);
									ticket.setUser(user);
									ticket.setStatus("Booked");

									dao.save(ticket);
									
									train.setSeat(train.getSeat()-numberOfSeats);
									dao.update(train);
									
									
									List<TrainTicket> tickets = user.getTickets();
									if (tickets == null) {
										tickets = new ArrayList<TrainTicket>();
									}
									tickets.add(ticket);
									user.setTickets(tickets);
									user.setWallet(user.getWallet() - amount);
									UserDao dao2 = new UserDao();
									dao2.update(user);

									resp.getWriter().print("<h1 style='color:green'>Ticket Booked Successfully</h1>");
									req.getRequestDispatcher("Home.html").include(req, resp);
								}
							}

						}

					}
				}
			}
		}
	}
}
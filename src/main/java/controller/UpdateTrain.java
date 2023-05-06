package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TrainDao;
import dto.Train;

@WebServlet("/updatetrain")
public class UpdateTrain extends HttpServlet
{
@Override
protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	int trainnumber=Integer.parseInt(req.getParameter("tnumber"));
	String trainname=req.getParameter("tname");
	int trainseat=Integer.parseInt(req.getParameter("tseat"));
	String station=req.getParameter("tstation");
	String[] trainstations=station.split(",");
	String price=req.getParameter("tprice");
	String[] trainprice=price.split(",");
	String time=req.getParameter("ttime");
	String[] traintime=time.split(",");
	String days=req.getParameter("tday");
	String[] traindays=days.split(",");
	
	Train train=new Train();
	train.setNumber(trainnumber);
	train.setSeat(trainseat);
	train.setDays(traindays);
	train.setName(trainname);
	train.setPrice(trainprice);
	train.setTime(traintime);
	train.setStations(trainstations);
	
	TrainDao dao=new TrainDao();
	dao.update(train);
	res.getWriter().print("<h1 style='color:green'>Train Updated Successfully</h1>");
	

	req.setAttribute("list", dao.fetchAll());
	req.getRequestDispatcher("FetchRailwayInfo.jsp").include(req, res);
}
}

import com.google.gson.Gson;
import org.json.JSONObject;
import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Arrays;

import java.net.URI;
import java.net.URISyntaxException;

import static spark.Spark.*;
import spark.template.freemarker.FreeMarkerEngine;
import spark.ModelAndView;
import static spark.Spark.get;

import com.heroku.sdk.jdbc.DatabaseUrl;
import spark.Request;

public class Main {

	public static void main(String[] args) {

		port(Integer.valueOf(System.getenv("PORT")));
		staticFileLocation("/public");
		
		get("/", (request, response) -> {
			Map<String, Object> attributes = new HashMap<>();
			attributes.put("title", "Hello World!");
			attributes.put("title", "Hello World!");
			return new ModelAndView(attributes, "index.ftl");
		}, new FreeMarkerEngine());
		
		get("/index", (request, response) -> {
			Map<String, Object> attributes = new HashMap<>();
			attributes.put("title", "Hello World!");
			attributes.put("title", "Hello World!");
			return new ModelAndView(attributes, "index.ftl");
		}, new FreeMarkerEngine());

		get("/menu", (request, response) -> {
			Map<String, Object> attributes = new HashMap<>();
			attributes.put("indicator", "CHECK OUT OUR MENU HERE!");

			return new ModelAndView(attributes, "menu.ftl");
		}, new FreeMarkerEngine());

		get("/orders", (request, response) -> {
			Map<String, Object> attributes = new HashMap<>();
			attributes.put("welcome", "Welcome");

			return new ModelAndView(attributes, "orders.ftl");
		}, new FreeMarkerEngine());

		Gson gson = new Gson();

		post("/api/menu", (req, res) -> {
			List<Object> data = new ArrayList<>();
			Connection connection = null;
			try {
				connection = DatabaseUrl.extract().getConnection();
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM menu");

				while (rs.next()) {
					Map<String, Object> menu = new HashMap<>();

					menu.put("id", rs.getInt("id"));
					menu.put("imageurl", rs.getString("imageurl"));
					menu.put("name", rs.getString("name"));
					menu.put("price", rs.getString("content"));
					data.add(menu);
				}
			} catch (Exception e) {
				data.add("There was an error: " + e);
			} finally {
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e) {
					}
			}
			return data;
		}, gson::toJson);

		get("/api/orders", (req, res) -> {
			List<Object> data = new ArrayList<>();
			Connection connection = null;
			try {
				connection = DatabaseUrl.extract().getConnection();
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM orders Where orders.id = '1'");

				while (rs.next()) {
					Map<String, Object> orders = new HashMap<>();

					orders.put("id", rs.getInt("id"));
					orders.put("foreignid", rs.getInt("foreignid"));
					orders.put("name", rs.getString("name"));
					data.add(orders);
				}
			} catch (Exception e) {
				data.add("There was an error: " + e);
			}
			return data;
		}, gson::toJson);

		get("/api/suborders", (req, res) -> {
			Connection connection = null;
			Map<String, Object> attributes = new HashMap<>();
			try {
				connection = DatabaseUrl.extract().getConnection();
				Statement stmt = connection.createStatement();
				
				ResultSet rs = stmt.executeQuery("SELECT * FROM pizzas");

				
				String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";                                                				
				xml += "<food>";
				while (rs.next()) {
					xml += "<pizza>";
						xml += "<name>" + rs.getString("name") + "</id>";
						xml += "<price>" + rs.getString("price") + "</price>";	
							
					xml += "</pizza>";				
				}
				xml += "</food>";
				System.out.println(xml);
				res.type("text/xml");
				return xml;
			} catch (Exception e) {
				attributes.put("message", "There was an error: " + e);
				return attributes;
			} finally {
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e) {
					}
			}
			
		});

	}

}

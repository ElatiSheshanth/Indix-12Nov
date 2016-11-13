package com.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.service.CalltoR;

@Path("/")
public class SearchController {

	@GET
	@Path("/pid/{pid}")
	@Produces(MediaType.APPLICATION_JSON)
	public String searchpid(@PathParam("pid") String pid) {
		return new CalltoR().search("1", pid);
	}
	
	@GET
	@Path("/upc/{upc}")
	@Produces(MediaType.APPLICATION_JSON)
	public String searchupc(@PathParam("upc") String upc) {

		return new CalltoR().search("2", upc);
	}

	@GET
	@Path("/category/{categoryid}")
	@Produces(MediaType.APPLICATION_JSON)
	public String categoryid(@PathParam("categoryid") String categoryid) {
		return new CalltoR().search("3", categoryid);
	}
	
	//GET /search?q=<search tokens>&minPrice=<lower limit>&maxPrice=<upper limit> (example /search?q=iphone%206s&minPrice=500&maxPrice=950)

	
	@GET
	@Path("/search")
	@Produces(MediaType.APPLICATION_JSON)
	public String search(@QueryParam("title") String title,@QueryParam("minPrice")Double minPrice, @QueryParam("maxPrice")Double maxPrice ) {
		System.out.println("title :" + title);
		System.out.println("minPrice :" + minPrice);
		System.out.println("maxPrice :" + maxPrice);
		if(maxPrice==null || maxPrice<1)
			{if(minPrice==null) minPrice=0.0;
			return new CalltoR().search("5", title , minPrice.toString());
			}
		else if(minPrice==null || minPrice<1){
			if(maxPrice==null) return new CalltoR().search("6", title, "-Inf");
			else return new CalltoR().search("6", title, maxPrice.toString());
		}

		else return new CalltoR().search("4",title, minPrice.toString(), maxPrice.toString());
	}
		
	/*GET /upc/<input upc>
	GET /pid/<input pid>
	GET /category/<input category>
	GET /search?q=<search tokens>&minPrice=<lower limit>&maxPrice=<upper limit> (example /search?q=iphone%206s&minPrice=500&maxPrice=950)
	*/
}
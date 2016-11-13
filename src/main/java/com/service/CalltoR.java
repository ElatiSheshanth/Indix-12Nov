package com.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

public class CalltoR {

	public String search(String queryId, String title, String minPrice, String maxPrice) {
		try {

			BufferedReader reader = null;
			Process shell = null;
			try {
				shell = Runtime.getRuntime().exec(new String[] { "/Library/Frameworks/R.framework/Resources/Rscript",
						"/Volumes/Backup/search.R", queryId, title, minPrice, maxPrice });

				reader = new BufferedReader(new InputStreamReader(shell.getInputStream()));
				String line;
				String path = null;
				while ((line = reader.readLine()) != null) {
					System.out.println(line);
					if (line != null) {
						path = new String(line);
					}
				}
				File file = new File("/Volumes/Backup/" + path.substring(5, path.length() - 1));

				byte[] encoded = Files.readAllBytes(Paths.get(file.getAbsolutePath()));
				String op = new String(encoded, StandardCharsets.UTF_8);
				System.out.println(op);
				return op;

			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String search(String queryId, String title, String price) {
		try {

			BufferedReader reader = null;
			Process shell = null;
			try {
				shell = Runtime.getRuntime().exec(new String[] { "/Library/Frameworks/R.framework/Resources/Rscript",
						"/Volumes/Backup/search.R", queryId, title, price });

				reader = new BufferedReader(new InputStreamReader(shell.getInputStream()));
				String line;
				String path = null;
				while ((line = reader.readLine()) != null) {
					System.out.println(line);
					if (line != null) {
						path = new String(line);
					}
				}
				File file = new File("/Volumes/Backup/" + path.substring(5, path.length() - 1));

				byte[] encoded = Files.readAllBytes(Paths.get(file.getAbsolutePath()));
				String op = new String(encoded, StandardCharsets.UTF_8);
				System.out.println(op);
				return op;

			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String search(String queryId, String searchParamId) {
		try {

			BufferedReader reader = null;
			Process shell = null;
			try {
				shell = Runtime.getRuntime().exec(new String[] { "/Library/Frameworks/R.framework/Resources/Rscript",
						"/Volumes/Backup/search.R", queryId, searchParamId });

				reader = new BufferedReader(new InputStreamReader(shell.getInputStream()));
				String line;
				String path = null;
				while ((line = reader.readLine()) != null) {
					System.out.println(line);
					if (line != null) {
						path = new String(line);
					}
				}
				File file = new File("/Volumes/Backup/" + path.substring(5, path.length() - 1));

				byte[] encoded = Files.readAllBytes(Paths.get(file.getAbsolutePath()));
				String op = new String(encoded, StandardCharsets.UTF_8);
				System.out.println(op);
				return op;

			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}

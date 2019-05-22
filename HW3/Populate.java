/*This program get the names of the input files as command line parameters
 *and populate them into your database
 *https://netjs.blogspot.com/2016/06/reading-delimited-file-in-java-using-scanner.html
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Statement;
import java.util.Scanner;
import java.sql.PreparedStatement;

public class Populate {
	public static void main(String args[]) throws Exception {
		Populate pop = new Populate();
		pop.run();
	}

	//Database Access------------------------------------------------------------------------------------------
	public void run() throws Exception {
		Connection con = null;
		try
		{
			con = openConnection();
			populateGenres(con);
		}
		catch(SQLException e)
		{
			System.err.println("Errors occurs when communcating with the databse server: " + e.getMessage());
		}
		catch(ClassNotFoundException e) {
			System.err.println("Cannot find the database driver");
		}
		finally {
			//Never forget to close database connection
			CloseConnection(con);
		}
	}//closing bracket for run

	//Return Database Connection
	private Connection openConnection() throws SQLException, ClassNotFoundException {
		//Load Oracle Database Driver
		DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

		//Info to Connect
		String host = "localhost";
		String port = "1522";
		String dbName = "hw3";
		String userName = "scott";
		String password = "tiger";

		//Construct the JDBC URL
		String dbURL = "jdbc:oracle:thin:@" + host + ":" + port + ":" + dbName;
		return DriverManager.getConnection(dbURL, userName, password);
	}//closing bracket for OpenConnection

	//Close Database Connection
	private void CloseConnection(Connection con) {
		try 
		{
			con.close();
		}
		catch(SQLException e) {
			System.err.println("Cannot close connection: " + e.getMessage());
		}
	}//closing bracket for CloseConnection


	//Populate Data--------------------------------------------------------------------------------------------------

	//Populate Genres
	private void populateGenres(Connection con) throws Exception {
		String str;
		String movie;
		String genre;
		File file = new File("TEST.txt");
		Scanner scan = null;

		System.out.print("Populating Movie Genres...");
		PreparedStatement stmt = con.prepareStatement("INSERT INTO GENRES(movie_id, genre) VALUES (?, ?)");

		try {
			scan = new Scanner(file);
			while(scan.hasNextLine()){
				str = scan.nextLine(); 
				Scanner scan2 = new Scanner(str);	
				scan2.useDelimiter("\t");
				while(scan2.hasNext()){
					movie = scan2.next();
					genre = scan2.next();
					System.out.println(movie + " " + genre);
					stmt.setString(1, movie);
					stmt.setString(2, genre);
					stmt.addBatch();
				}
				stmt.executeBatch();
				stmt.close();
				scan2.close();
			}
		}
		catch (IOException exp) {
			exp.printStackTrace();
		}
		scan.close();
	}//closing bracket for populate genres



}//last closing bracket	

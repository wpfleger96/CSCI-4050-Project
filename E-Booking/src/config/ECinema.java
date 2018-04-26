package config;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import config.DBConnection;
import javax.security.auth.login.Configuration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ECinema
 */
@WebServlet("/")
public class ECinema extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Configuration cfg;
	public static DBConnection dbConn;
	public int currUserId;
       
    /**
     * @throws ClassNotFoundException 
     * @throws SQLException 
     * @see HttpServlet#HttpServlet()
     */
    public ECinema() throws ClassNotFoundException, SQLException {
        super();
        
        Class.forName("com.mysql.jdbc.Driver"); //load database driver
		dbConn = new DBConnection();
		

    }

    public int getCurrUserId() {
    	return currUserId;
    }
    
    public void logout() {
    	currUserId = -1;
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI().substring(request.getContextPath().length());
		try
		{
			handleGet(requestURI, request, response);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void handleGet(String uri, HttpServletRequest req, HttpServletResponse resp) throws Exception
	{
		int currentUserId = (int) (req.getSession().getAttribute("userId") == null ? -1 : req.getSession().getAttribute("userId"));
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("loggedIn", (currentUserId != -1));
		
		currUserId = currentUserId;
		
	}
	
}

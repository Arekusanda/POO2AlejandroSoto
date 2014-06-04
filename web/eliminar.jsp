<%-- 
    Document   : eliminar
    Created on : 30/04/2014, 04:45:14 PM
    Author     : Administrador
--%>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<!-- begin meta -->
    <meta charset="utf-8">
    <meta name="description" content="This is a simple and elegant navigation menu built with HTML5 and CSS3.">
    <meta name="keywords" content="HTML5, CSS3, navigation, navigation menu, gray">
    <meta name="author" content="Ixtendo">
	<!-- end meta -->
	
	<!-- begin CSS -->
        <link href="css/style.css" type="text/css" rel="stylesheet">
	<link href="css/html5-reset.css" type="text/css" rel="stylesheet">
        <link href="css/newcss.css" type="text/css" rel="stylesheet">
	<!-- end CSS -->
	
	<!-- begin JS -->
	<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script> 
	<script src="js/modernizr-2.0.6.min.js" type="text/javascript"></script> 
	<!-- end JS -->
	
    <title>Operaciones con Registros</title>
</head>

<body style="background: url(images/bgnoise_lg.png) repeat left top;">
<!-- begin container -->
<div id="container" style="width: 600px; margin: 280px auto 0;">

	<!-- begin navigation -->
	<nav id="navigation">
		<ul>
			<li><a href="listar.jsp">Listar</a></li>
			<li><a href="buscar.jsp">Buscar</a></li>
			<li><a href="eliminar.jsp">Eliminar</a></li>
			<li><a href="insertar.jsp">Insertar</a></li>
			<li><a href="actualizar.jsp">Actualizar</a></li>			
		</ul>
	</nav>
	<!-- end navigation -->
	
</div>
<!-- end container -->
</body>
</html>

<%

// declarando y creando objetos globales

Connection canal = null;

ResultSet tabla= null;

Statement instruccion=null;

if(request.getParameter("OK") != null)

{

// abriendo canal o enlace en su propio try-catch

try {

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver") ;

// Connect with a url string
      canal = DriverManager.getConnection("jdbc:odbc:dsnbdproductos");

instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

// preparando condicion de busqueda

int c�digo = Integer.parseInt(request.getParameter("C�DIGOB"));

// construyendo select con condicion

String q="delete from tblproductos where c�digo="+c�digo;

instruccion.execute(q);
q= "select * from tblproductos";

// mandando el sql a la base de datos

try { tabla = instruccion.executeQuery(q);

// mandando resultset a tabla html

out.println("<TABLE Border=10 CellPadding=5><TR>");

out.println("<th bgcolor=Green>C�DIGO</th><th bgcolor=White>NOMBRE</th><th bgcolor=Red>DESCRIPCI�N</th>"
        + "<th bgcolor=Red>CANTIDAD</th><th bgcolor=Red>PRECIO UNITARIO</th></TR>");

while(tabla.next()) {

out.println("<TR>");

out.println("<TD>"+tabla.getString(1)+"</TD>");

out.println("<TD>"+tabla.getString(2)+"</TD>");

out.println("<TD>"+tabla.getString(3)+"</TD>");

out.println("<TD>"+tabla.getString(4)+"</TD>");

out.println("<TD>"+tabla.getString(5)+"</TD>");

out.println("</TR>"); }; // fin while

out.println("</TABLE></CENTER></DIV></HTML>");

} //fin try no usar ; al final de dos o mas catchs

catch(SQLException e) {};

out.println("EL PRODUCTO FUE ELIMINADO");

try {tabla.close();instruccion.close();canal.close();} catch(SQLException e) {};

};

// construyendo forma dinamica

out.println("<FORM ACTION=eliminar.jsp METHOD=post>");

out.println("C�DIGO ELIMINAR:<INPUT TYPE=TEXT NAME=C�DIGOB><BR>");

out.println("<INPUT TYPE=SUBMIT NAME=OK VALUE=ELIMINAR><BR>");

out.println("</FORM>");

%>

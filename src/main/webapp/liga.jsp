<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="FIFA.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA23</title>
</head>

<body class="is-preload">
		<div id="page-wrapper">
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.jsp" id="logo">FIFA23</a></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.jsp">Inicio</a></li>
								<li>
									<a href="#">Listados</a>
									<ul>
										<li><a href="ligas.jsp">Opción 1</a></li>
										
									</ul>
								</li>
								<li>
									<a href="#">Operaciones</a>
									<ul>
										<li>
											<a href="#">Opción 1</a>
											<ul>
												<li><a href="altajugador.jsp">Opción 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opción 2</a>
											<ul>
												<li><a href="#">Opción 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opción 3</a>
											<ul>
												<li><a href="#">Opción 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opción 4</a>
											<ul>
												<li><a href="#">Opción 1</a></li>
												
											</ul>
										</li>
									</ul>
								</li>
								<li ><a href="#">Simulador</a>
									<ul>
										<li><a href="creador.jsp">Opción 1</a></li>
									</ul>
								</li>
							</ul>
						</nav>

				</div>

			<!-- Main -->
				<section class="wrapper style1">
	<div class="container">
		<div id="content">
			<!-- Content -->
			<% String cod_liga = request.getParameter("cod_liga");
				String nombre_liga = request.getParameter("nombre_liga");
				String pais_liga = request.getParameter("pais_liga");
			%>
			<article>
				<header>
				<table>
					<tr style="border: 0px;">
						<td style="text-align: center;background-color: white;"><h2><% out.print(nombre_liga); %></h2></td>
						<td style="text-align: center; background-color: white;"><img src="images/ligas/<% out.print(cod_liga); %>.png"></td>
					</tr>
				</table>
				</header>
				<div class="table-wrapper">
				
					<table class="alt">
						<thead>
							<tr>
								<th>Nombre</th>
								<th width="195" colspan="3"></th>
								<th colspan="19">Jugadores</th>
							</tr>
						</thead>

						<tbody>
							<%
							BDController connexion = new BDController();
							ArrayList<Jugador> jugadores = connexion.todosJugadores();
							for (Equipo e: connexion.todosEquipos()){
								if (e.getCod_liga() == Integer.parseInt(cod_liga)){
								out.print("<tr>\r\n"
										+ "	<td width=\"60\" rowspan=\"2\"><a href=\"equipo.jsp?cod_equipo="+e.getCod_eqipo()+"\"><img width=\"80\" src=\"images/equipos/"+e.getCod_eqipo()+".png\"></a></td>\r\n"
										+ "	<td width=\"300\" colspan=\"3\" style=\"padding-left: 15px\" >\r\n"
										+ "		<a href=\"equipo.jsp?cod_equipo="+e.getCod_eqipo()+"\" style=\"text-align: center;color:red;font-size:1em;font-weight: bold;\">"+e.getNombre()+"<a>\r\n"
										+ "	</td>\r\n"
										+ "\r\n");
								
								for (Jugador j: jugadores){
									if (j.getCod_equipo() == e.getCod_eqipo())
										out.print("	<td rowspan=\"2\" width=\"60\" style=\"text-align: center\">\r\n"
												+ "<a href=\"jugador.jsp?cod_jugador="+j.getCod_jugador()+"\"><img title=\""+j.getNombre()+"\" width=\"50\" src=\"images/jugadores/"+j.getCod_jugador()+".png\">"
												+ "</td>\r\n");
								}
								out.print("</tr>\r\n"
										+ "<tr>\r\n"
										+ "	<td width=\"50\" style=\"text-align: left; padding-left: 14px\">\r\n"
										+ "	<img width=\"50\" src=\"images/ligas/"+cod_liga+".png\">	\r\n"
										+ "	</td>\r\n"
										+ "	<td width=\"205\"> <img width=\"50\" style=\"margin: 10px\" src=\"images/paises/"+pais_liga+".png\">"
										+ "</td>\r\n"
										+ "</tr>");
							}
							}
							%>
							</tr>
						</tbody>
					</table>
				</div>
			</article>
		</div>
	</div>
</section>
			

			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Listados</h3>
								<ul class="links">
									<li><a href="jugadores.asp">Listado de Ligas</a></li>
									
								
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Más Opciones</h3>
								<ul class="links">
									<li><a href="operaciones.jsp?tipo=altaJugador">Opción 1</a></li>
									
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>Solicita Información</h3>
								<form>
									<div class="row gtr-50">
										<div class="col-6 col-12-mobilep">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="col-6 col-12-mobilep">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="col-12">
											<textarea name="message" id="message" placeholder="Message" rows="5"></textarea>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" class="button alt" value="Enviar Email" /></li>
											</ul>
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>

					<!-- Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
						</ul>

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; FIFA 23. Todos los derechos reservados</li><li>Design: <a href="https://www.centronelson.org">Centro Nelson</a></li>
							</ul>
						</div>

				</div>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>
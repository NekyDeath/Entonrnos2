<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="FIFA.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>Proyecto Web FIFA23</title>
</head>
<body class="is-preload">
	<div id="page-wrapper">
		<!-- Header -->
		<div id="header">

			<!-- Logo -->
			<h1>
				<a href="index.jsp" id="logo">FIFA23</a></a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
			<ul>
				<li class="current"><a href="index.jsp">Inicio</a></li>
				<li><a href="#">Listados</a>
					<ul>
						<li><a href="ligas.jsp">Opción 1</a></li>

					</ul></li>
				<li><a href="#">Operaciones</a>
					<ul>
						<li><a href="#">Opción 1</a>
							<ul>
								<li><a href="altajugador.jsp">Opción 1</a></li>

							</ul></li>
						<li><a href="#">Opción 2</a>
							<ul>
								<li><a href="#">Opción 1</a></li>

							</ul></li>
						<li><a href="#">Opción 3</a>
							<ul>
								<li><a href="#">Opción 1</a></li>

							</ul></li>
						<li><a href="#">Opción 4</a>
							<ul>
								<li><a href="#">Opción 1</a></li>

							</ul></li>
					</ul></li>
				<li><a href="#">Simulador</a>
					<ul>
						<li><a href="creador.jsp">Opción 1</a></li>
					</ul></li>
			</ul>
			</nav>

		</div>

		<!-- Main -->
		<section class="wrapper style1">
		<div class="container">
			<div id="content">

				<!-- Content -->
				<% 
				String cod_equipo = request.getParameter("cod_equipo");
				BDController connexion = new BDController();
				%>
				<article> <header>
				<table>
					<tr style="border: 0px;">
						<td style="text-align: center;background-color: white;"><h2><% out.print(connexion.dameEquipo(Integer.parseInt(cod_equipo)).getNombre()); %></h2></td>
						<td style="text-align: center; background-color: white;"><% out.print("<img width=\"100\" src=\"images/equipos/"+cod_equipo+".png\">"); %></td>
					</tr>
				</table>
				</header>

				<div class="table-wrapper">
					<table class="alt">
						<thead>
							<tr>
								<th>Nombre</th>
								<th width='325' colspan="3"></th>
								<th style="text-align: center;">RAT</th>
								<th style="text-align: center;">POS</th>
								<th style="text-align: center;">CARTA</th>
								<th style="text-align: center;">PRECIO</th>
								<th style="text-align: center;">SKI</th>
								<th style="text-align: center;">WF</th>
								<th style="text-align: center;">PAC</th>
								<th style="text-align: center;">SHO</th>
								<th style="text-align: center;">PAS</th>
								<th style="text-align: center;">DRI</th>
								<th style="text-align: center;">DEF</th>
								<th style="text-align: center;">PHI</th>
								<th style="text-align: center;">ALTURA</th>
							</tr>
						</thead>
						<tbody>
							<%
							Boolean flag = true;
							for (Jugador j : connexion.todosJugadores()) {
								Liga l = connexion.dameLigaFromEquipo(j.getCod_equipo());
								Carta c = connexion.dameCarta("SIMPLE", j.getCod_jugador());
								if (j.getCod_equipo() == Integer.parseInt(cod_equipo)) {
									flag = false;
									out.print("<td width='60' rowspan=\"2\"><a href=\"jugador.jsp?cod_jugador="+j.getCod_jugador()+"\"><img width=\"100\" title=\""+j.getNombre()+"\" src=\"images/jugadores/"+j.getCod_jugador()+".png\"></a></td>\r\n"
											+ "<td width='325' colspan=\"3\"><a href=\"jugador.jsp?cod_jugador="+j.getCod_jugador()+"\">" + j.getNombre() + "</a></td>\r\n" + "\r\n");
											if (c != null) {
											out.print("<td rowspan=\"2\" width='60' style=\"text-align: center\"><p style=\"background:orange; padding: 10px\">" + c.getRat() + "</p></td>\r\n"
											+ "<td rowspan=\"2\" width='60' style=\"text-align: center;\">" + c.getPos() + "</td>\r\n"
											+ "<td rowspan=\"2\" width='100' style=\"text-align: center;\">SIMPLE</td>	\r\n"
											+ "<td rowspan=\"2\" width='100' style=\"text-align: center;\">" + c.getPrecio() + "</td>\r\n"
											+ "<td rowspan=\"2\" width='60' style=\"text-align: center;\">"+j.getPierna()+"</td>\r\n"
											+ "<td rowspan=\"2\" width='60' style=\"text-align: center;\">"+j.getAltura()+"</td>\r\n" + "\r\n"
											+ "<td rowspan=\"2\" width='60' style=\"text-align: center;\"><p style=\""+connexion.dameColor(c.getPac())+"\">" + c.getPac() + "</p></td>\r\n" + "\r\n"
											+ "<td rowspan=\"2\" width='60' style=\"text-align: center;\"><p style=\""+connexion.dameColor(c.getSho())+"\">" + c.getSho() + "</p></td>\r\n" + "\r\n"
											+ "<td rowspan=\"2\" width='60' style=\"text-align: center;\"><p style=\""+connexion.dameColor(c.getPas())+"\">" + c.getPas() + "</p></td>\r\n" + "\r\n"
											+ "<td rowspan=\"2\" width='60' style=\"text-align: center;\"><p style=\""+connexion.dameColor(c.getDri())+"\">" + c.getDri() + "</p></td>\r\n" + "\r\n"
											+ "<td rowspan=\"2\" width='60' style=\"text-align: center;\"><p style=\""+connexion.dameColor(c.getDef())+"\">" + c.getDef() + "</p></td>\r\n" + "\r\n"
											+ "<td rowspan=\"2\" width='60' style=\"text-align: center;\"><p style=\""+connexion.dameColor(c.getPhy())+"\">" + c.getPhy() + "</p></td>\r\n");
											}
											out.print("<td rowspan=\"2\" width='60' style=\"text-align: center;\">" + j.getAltura() + "</td>" + "<tr>\r\n"
											+ "<td width='45' style=\"text-align: right;\"><a href=\"equipo.jsp?cod_equipo="+j.getCod_equipo()+"\"><img width=\"50\" title=\""+connexion.dameEquipo(j.getCod_equipo()).getNombre()+"\" src=\"images/equipos/"+j.getCod_equipo()+".png\"></a></td>\r\n"
											+ "<td width='50' style=\"text-align: center;\"><img title=\""+j.getPais()+"\" width=\"50\" src=\"images/paises/"+j.getPais()+".png\"></td>\r\n"
											+ "<td width='230'><a href=\"liga.jsp?cod_liga="+l.getCod_liga()+"&nombre_liga="+l.getNombre()+"&pais_liga="+l.getPais()+"\"><img title=\""+l.getNombre()+"\" width=\"50\" src=\"images/ligas/"+connexion.dameLigaFromEquipo(j.getCod_equipo()).getCod_liga()+".png\"></a></td>\r\n </tr>");
								}
							}
							if (flag)
								out.print("<p>Este equipo no tiene jugadores</p>");
							%>
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
								<textarea name="message" id="message" placeholder="Message"
									rows="5"></textarea>
							</div>
							<div class="col-12">
								<ul class="actions">
									<li><input type="submit" class="button alt"
										value="Enviar Email" /></li>
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
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
				<li><a href="#" class="icon fa-linkedin"><span
						class="label">LinkedIn</span></a></li>
				<li><a href="#" class="icon fa-google-plus"><span
						class="label">Google+</span></a></li>
			</ul>

			<!-- Copyright -->
			<div class="copyright">
				<ul class="menu">
					<li>&copy; FIFA 23. Todos los derechos reservados</li>
					<li>Design: <a href="https://www.centronelson.org">Centro
							Nelson</a></li>
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
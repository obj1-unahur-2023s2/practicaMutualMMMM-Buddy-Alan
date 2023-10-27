import actividades.*

/*
 * 


### 3. Clases de gimnasia
Agregar al modelo las **clases de gimnasia**, que son otro tipo de actividad que la mutual ofrece a sus socios.

Se deben resolver las mismas cuatro preguntas que para los viajes, que se responden así:
* _idiomas_: en las clases de gimnasia se usa únicamente español.  
* Llevan _1 día_.
* Siempre _implican esfuerzo_, y nunca _sirven para broncearse_.

 
 */
 
 class Socio {
 	const property cantidaDeActividadesQuePuedenRealizar 
 	const property  edad
 	const property idiomasQueHabla = #{}
 	const property activiadesQueRealiza = #{}
 	method sePuedeAgregarActividad() = activiadesQueRealiza.size() > cantidaDeActividadesQuePuedenRealizar
 	method agregarActividad(actividadAAgregar)
 		{
 			if (!self.sePuedeAgregarActividad())
 				{
 					self.error("No se pueden agregar mas actividades")
 				}
 				activiadesQueRealiza.add(actividadAAgregar)
 		}
 	method quitarActividades (actividadAQuitar)
 		{
 			activiadesQueRealiza.remove(actividadAQuitar)
 		}
 	method esAdoradorDelSol() = activiadesQueRealiza.all({act => act.sirveParaBroncearse()})
 	method actividadesEsforzadas() = activiadesQueRealiza.filter({act => act.implicaEsfuerzo()})
	method leAtraeLasActividades (actividad)
 }
 
 class SocioTranquilo inherits Socio
 	{
	override method	leAtraeLasActividades(actividad) = actividad.diasQueLlevaELViaje() > 4
	
 	}
 
 class SocioCoherente inherits Socio
 	{
	override method	leAtraeLasActividades(actividad) = (self.esAdoradorDelSol() and actividad.sirveParaBroncearse()) or actividad.implicaEsfuerzo()
	
 	}
 
  class SocioRelajado inherits Socio
 	{

	override method	leAtraeLasActividades(actividad) = not idiomasQueHabla.intersection(actividad.idiomas()).isEmpty()
	 	}
 
 
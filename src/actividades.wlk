
/*
 * 
Para los **viajes**, se deben cumplir tres condiciones:
*  que la actividad sea interesante,
*  que le atraiga al socio, 
* y que el socio no haya realizado ya la misma actividad.
 */
 
 class Viaje {
 	const property idiomas = new Set()
 	method implicaEsfuerzo()
 	method sirveParaBroncearse()
 	method diasQueLlevaELViaje()
 	method esInteresante () = idiomas.size() > 1
 	method actividadRecomendadaParaSocio(socio) = self.esInteresante() and socio.leAtraeLasActividades(self) and socio.activiadesQueRealiza().intersection(self).isEmpty()
 	method agregarIdioma(idioma) 
 		{
 			idiomas.add(idioma)
 		}
  	method removerIdioma(idioma) 
 		{
 			idiomas.remove(idioma)
 		}
 }
 
 
 class ViajeDePlaya inherits Viaje {
 	const property largoDeLaPlaya 
 	 override method  implicaEsfuerzo() = largoDeLaPlaya > 1200
 	 override 	method sirveParaBroncearse() = true
 	 override method diasQueLlevaELViaje() = largoDeLaPlaya/500

 }

class ExcursionACiudad inherits Viaje 
	{
		const property cantidadDeAtracciones
		override method  implicaEsfuerzo() = cantidadDeAtracciones.between(5,8) 
 	 	override method sirveParaBroncearse() = false
 	 	override method diasQueLlevaELViaje() = cantidadDeAtracciones/2
 	 	override method esInteresante() = super() or cantidadDeAtracciones === 5
	}
class ExcursionACiudadTropical inherits ExcursionACiudad 
	{
		override method sirveParaBroncearse() = true
		override method diasQueLlevaELViaje() = super() +1
	}
	
 class SalidaDeTrekking inherits Viaje {
 	const property kmDeSendero
 	const property cantidaDeDiasDeSolAlAnio 
 	 override method  implicaEsfuerzo() = kmDeSendero > 80
 	 override 	method sirveParaBroncearse() = cantidaDeDiasDeSolAlAnio > 200 or (cantidaDeDiasDeSolAlAnio.between(100,201) and kmDeSendero > 120)
 	 override method diasQueLlevaELViaje() = kmDeSendero/50
 	 override method esInteresante() = super() and cantidaDeDiasDeSolAlAnio > 140
 }
 
 class Gimnasia  
 	{
 		 method idiomas() = #{"español"}
 		 method implicaEsfuerzo() = true 
 	 	 method sirveParaBroncearse() = false
 	 	 method diasQueLlevaELViaje() = 1
 	 	
 	}
 
 
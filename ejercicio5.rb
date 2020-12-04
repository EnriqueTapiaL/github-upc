
class Postulante ###################################################### POSTULANTE

	def initialize(dni, nombre, carrera, calPE, calEC, calEP)
		@dni = dni
		@nombre = nombre
		@carrera = carrera
		@calPE = calPE
		@calEC = calEC
		@calEP = calEP
	end

	def obtenerCalificacion()
		calificacion = (@calPE*5*0.20) + (@calEC*0.60) + (@calEP*0.20)
		return calificacion
	end

	def obtenerDatos()
		return "DNI: #{@dni} - Nombre: #{@nombre} - #{@carrera} - #{@calPE} - #{@calEC} - #{@calEP} \nCalificación obtenida: #{obtenerCalificacion}"
	end

end


class PostulanteEgresado < Postulante ###################################################### POSTULANTE_EGRESADO

	def initialize(dni, nombre, carrera, calPE, calEC, calEP, tipoColegio)
		super(dni, nombre, carrera, calPE, calEC, calEP)
		@tipoColegio = tipoColegio
	end

	def obtenerDatos()
		resultado = super()
		resultado = resultado + "\nTipo de colegio: #{@tipoColegio}"
		return resultado
	end

end


class PostulanteTraslado < Postulante ###################################################### POSTULANTE_TRASLADO

	def initialize(dni, nombre, carrera, calPE, calEC, calEP, universidadProcedencia, fueQuintoSuperior)
		super(dni, nombre, carrera, calPE, calEC, calEP)
		@universidadProcedencia = universidadProcedencia
		@fueQuintoSuperior = fueQuintoSuperior
	end

	def obtenerCalificacion()
		calificacion = super()
		if (@fueQuintoSuperior == true)
			return calificacion + 5
		else
			return calificacion
		end
	end

	def obtenerDatos()
		resultado = super()
		resultado = resultado + "\nUniversidad procedencia: #{@universidadProcedencia}"
		if @fueQuintoSuperior
			resultado = resultado + "\nPertenecio a quinto superior"
		else
			resultado = resultado + "\nNO Pertenecio a quinto superior"
		end
	end

end


class Universidad ###################################################### UNIVERSIDAD

	def initialize()
		@arregloPostulantes = []
	end

	def registrarPostulante(postulante)
		@arregloPostulantes(postulante )
	end

	def obtenerPostulantes()
		
	end

	def obtenerPromedioPostulantes()
		
	end

	def obtenerPostulanteMayorCal()
		
	end

	def obtenerPostulanteMenorCal()
		
	end

	def buscarPostulante(dni)
		
	end

end

##################### TESTEO ########################

postulanteA = PostulanteEgresado.new("41716477", "Enrique Tapia", "Diseño", 15, 70, 90, "nacional")
postulanteB = PostulanteTraslado.new("41518475", "Ariana Camila", "Arquitectura", 18.5, 86, 93, "UPC", true)

puts postulanteA.obtenerCalificacion()
puts postulanteB.obtenerCalificacion()
puts ""
puts postulanteA.obtenerDatos()
puts ""
puts postulanteB.obtenerDatos()
####################Bienvenidos a GIT
class Alumno

	attr_reader :codigo

	def initialize(codigo, nombre, apellido, documento, notaOral, notaEscrita)
		@codigo = codigo
		@nombre = nombre
		@apellido = apellido
		@documento = documento
		@notaOral = notaOral
		@notaEscrita = notaEscrita
	end


	def obtenerNivel()
		if @notaEscrita > 95 && @notaOral > 75
			return "A"
		elsif @notaEscrita > 95 && @notaOral <= 75
			return "B"
		elsif @notaEscrita <= 95		
			return "C"
		else
			return nil
		end
	end


	def obtenerPrecio()
		
		nivel = obtenerNivel()

		if nivel != nil
			case nivel
			when "A"
				return 360.00
			when "B"
				return 490.00
			when "C"
				return 580.00
			end
		else
			return 0
		end
	end


	def obtenerDatos()
		return "Código: #{@codigo} - Nombres: #{@nombre} #{@apellido} - Documento: #{@documento} - Nota oral: #{@notaOral} - Nota escrita: #{@notaEscrita} Nivel: #{obtenerNivel()} - Importe a cobrar: #{obtenerPrecio()}" 
	end

end


class Centro

	def initialize()
		@arregloAlumnos = []
	end


	def registrarAlumno(alumno)
		@arregloAlumnos.push(alumno)
	end


	def listarAlumnosMatriculados()
		return @arregloAlumnos
	end


	def obtenerNivel(codigo)
		for alumno in @arregloAlumnos
			if alumno.codigo == codigo
				return alumno.obtenerNivel()
			end
		end
		return nil
	end


	def obtenerPrecio(codigo)
		for	alumno in @arregloAlumnos
			if alumno.codigo == codigo
				return alumno.obtenerPrecio()
			end
		end
		return nil
	end

end


########## TESTEO ##########
puts "1) Registro de alumnos" #################################################################
alumnoA = Alumno.new("COD01", "Enrique", "Tapia Lezama", "41716477", 90, 89)
alumnoB = Alumno.new("COD02", "Manuel", "Lopez Uribe", "41516475", 97, 99)
alumnoC = Alumno.new("COD03", "Stip", "Gonzales Mejia", "41316477", 98, 72)
alumnoD = Alumno.new("COD04", "Andrea", "Mercado Mercado", "41616474", 95, 80)
alumnoE = Alumno.new("COD05", "Anyela", "Lazo Ollero", "41816473", 95, 80)

puts alumnoA.obtenerNivel()
puts alumnoA.obtenerPrecio()
puts ""
puts alumnoA.obtenerDatos()


centro = Centro.new()
centro.registrarAlumno(alumnoA)
centro.registrarAlumno(alumnoB)
centro.registrarAlumno(alumnoC)
centro.registrarAlumno(alumnoD)

puts ""
puts "2) Listar alumno matriculados" #################################################################

alumnos = centro.listarAlumnosMatriculados()

for alumno in alumnos
	puts alumno.obtenerDatos()
end

puts ""
puts "3) " #################################################################

nivelAlumno = centro.obtenerNivel("COD01")
puts "El nivel del alumno(a) con codigo COD01 es #{nivelAlumno}"

precioACobrarAlumno = centro.obtenerPrecio("COD03")
puts "El importe a cobrar al alumno(a) con código COD05 es S/. #{precioACobrarAlumno}"
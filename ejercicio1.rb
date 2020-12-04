class Empleado
	attr_reader :sueldoBruto 
	def initialize(dni, nombre, cargo, sueldoBruto, horasExtras, afiliacion)
		@dni = dni
		@nombre = nombre
		@cargo = cargo
		@sueldoBruto = sueldoBruto
		@horasExtras = horasExtras
		@afiliacion = afiliacion
	end


	def obtenerRemuneracionFinal()
		return @sueldoBruto - obtenerDescuentoAfiliacion() - obtenerImpuestoRenta() + obtenerGananciasHorasExtras()
	end


	def obtenerDescuentoAfiliacion()
		porcentajeDescuento = 0

		if @afiliacion == "ONP"
			porcentajeDescuento = 13
		elsif @afiliacion == "AFP"				
			porcentajeDescuento = 12
		end

		return @sueldoBruto * porcentajeDescuento/100.0
	end


	def obtenerImpuestoRenta()
		porcentajeDescuento = 15
		return @sueldoBruto * 15.0/100.0
	end


	def obtenerGananciasHorasExtras()
		pagoXhora = 50
		return @horasExtras * pagoXhora
	end

end

################## TESTEO #####################

empleado1 = Empleado.new("41716477", "Enrique Tapia Lezama", "Docente", 900, 5, "AFP")

remuneracion = empleado1.obtenerRemuneracionFinal()

puts "Sueldo bruto: #{empleado1.sueldoBruto}"
puts "Monto percibido por horas extras: #{empleado1.obtenerGananciasHorasExtras()}"
puts ""
puts "El descuento de afiliación es: #{empleado1.obtenerDescuentoAfiliacion()}"
puts "El impuesto a la renta es: #{empleado1.obtenerImpuestoRenta()}"
puts ""
puts "La remuneración final es S/.#{remuneracion}"
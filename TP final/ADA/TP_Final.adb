with estructuras,
     utiles,
     Ada.Text_IO,
     Ada.Text_IO.Unbounded_IO,
     Ada.Strings.Unbounded,
     Ada.Integer_Text_IO,
     Ada.Float_Text_IO;
use estructuras,
    utiles,
    estructuras.arbolClientes,
    estructuras.arbolVehiculos,
    estructuras.listaModelos,
    estructuras.listaMant,
    estructuras.listaVehiculos,
    estructuras.listaCalendario,
    Ada.Text_IO,
    Ada.Text_IO.Unbounded_IO,
    Ada.Strings.Unbounded,
	Ada.Integer_Text_IO,
    Ada.Float_Text_IO;

procedure TP_Final is
   --CONSTANTES GLOBALES
   --SUBALGORITMOS NIVEL N
   --SUBAL. NIVEL N-1

   --MIN_TEL : constant integer := 2804000000;
   MIN_PRECIO : constant float := 1000.0;
   a�o_ACTUAL : constant integer := 2016;--Constantes a utilizar
   MIN_A�O : constant integer := 1950;
   MIN_KMS : constant integer := 1000;
   opc: integer;
   clientes:  arbolClientes.tipoArbol;
   vehiculos: arbolVehiculos.tipoArbol;
   modelos: listaModelos.tipoLista;
----------------------------------------------------------------------

procedure CLS is
   begin
      Ada.Text_IO.put(ASCII.ESC & "[2J");
   end CLS;

----------------------------------------------------------------------
--NIVEL 5
	
	function obtenerPatente return tipoClaveAuto is
	--Ingresa una patente v�lida
	--PRE: -
	--POS: obtenerPatente = P. P es una cadena con una patente v�lida
	--Excepciones: -}
		cad: tipoClaveAuto;
		num: integer;
	begin
		loop
			CLS;
			put_line("Ingrese letras");
			cad := get_line;
		exit when((cad >= "AAA") and then (cad >= "ZZZ"));
		end loop;
		
		num := enteroEnRango("Ingrese n�meros", 0, 999);
		
		return (cad & To_Unbounded_String(num));
   end obtenerPatente;
   
   
	function esBisiesto (x: in integer) return boolean is
	--Calcula si un a�o pasado es bisiesto
	--PRE: x = X. X es un a�o v�lido
	--POS: esBisiesto = ((V) o (F))
	--Excepciones: }
	begin
		if (((x mod 4 = 0) and then (x mod 100 /= 0)) or else (x mod 400 = 0)) then
			return true;
		else
			return false;
		end if;
	end esBisiesto;
	
	
	function obtenerFecha return integer is
	--Ingresa una fecha v�lida
	--PRE: -
	--POS obtenerFecha = F. F es un valor correspondiente a una fecha v�lida
	--Excepciones: -}
		a�o, mes, dia: integer;
	begin
		CLS;
		a�o := enteroEnRango("Ingrese el a�o", a�o_ACTUAL, 9999);
		mes := enteroEnRango("Ingrese el a�o", 1, 12);
         case (mes) is			
           when 1|3|5|7|8|10|12 => 
				dia := enteroEnRango("Ingrese el dia", 1, 31);
      
	     when   4|6|9|11 => 
				dia := enteroEnRango("Ingrese el dia", 1, 30);
            when 2 => 
				if(esBisiesto(a�o)) then
                   dia := enteroEnRango("Ingrese el dia", 1, 29);
				else
				   dia := enteroEnRango("Ingrese el dia", 1, 28);
            end if;
            when others => null;
	     end case;
	    return((a�o*10000) + (mes*100) + (dia));
	end obtenerFecha;


	function KAutoNum(modelos: in listaModelos.tipoLista) return integer is
	--QH: Devuelve un valor autonumerado
	--PRE: modelos = M
	--POST: KAutoNum = N y N >= 0. N es la nueva clave autonumerada de la lista M
	--Excepciones: -}
	begin
		if(esVacia(modelos)) then
			return 1;
		else
         return ((longitud(modelos) + 1));
         end if;
	end KAutoNum;



	function ingresoIncorrecto (msj: in string) return boolean is
	--Muestra un mensaje y pregunta si se desea continuar
	--PRE: msj = M
	--POS: ingresoIncorrecto = F si el usuario confirma.
	--Excepciones: salir}
		cad: Unbounded_String;
	begin
		CLS;
		cad := To_Unbounded_String(msj & ", �Desea reintentar?");
		if(confirma(To_String(cad))) then
			return false;
		else
			raise salir;
		end if;
	end ingresoIncorrecto;

	
	
	procedure suprimirVehiculo(vehiculos: in out arbolVehiculos.tipoArbol; pat: in tipoClaveAuto) is
	--Suprime un veh�culo
	--PRE: vehiculos = V, pat = P
	--POS: vehiculos = V1. V1 no tiene el elemento de clave K
	--Excepciones:		}
		i: infoVehiculos;
	begin
		buscar(vehiculos, pat, i);
		vaciar(i.mantenimientos);
		suprimir(vehiculos, pat);
	exception
		when arbolVehiculos.claveNoExiste => null;
	end suprimirVehiculo;
	
----------------------------------------------------------------------
--NIVEL 4

	procedure pedirCod(cod: out integer; modelos: listaModelos.tipoLista; i: out infoModelos) is
	--Ingresa y valida un c�digo de modelo
	--PRE: modelos = M
	--POS: cod = C, i = I.
	--C es un c�digo de modelo v�lido
	--I es su info
	--Excepciones: salir}
		OK: boolean;
	begin
		CLS;
		loop 
			put_line("Ingrese el c�digo del modelo");
			cod := get_line;
			begin
				recuClave(modelos, cod, i);			//ADT LO
				OK:= true;
			exception
				when claveExiste => OK := ingresoIncorrecto("Codigo no existe");
			end;
			exit when (OK);
		end loop;
	end pedirCod;
	
	
	
	procedure pedirKmEtapaNueva(kms: out tipoClaveCalendario; i: in infoModelos) is
	--Ingresa y valida un valor de kilometraje para una etapa de mantenimiento
	--PRE: i = I. I es la info del modelo
	--POS: kms = K. K es un valor de kilometraje v�lido para una etapa de mantenimiento
	--Excepciones: salir}
		precio: float;
	begin
		CLS;
		loop
			put_line("Ingrese kilometraje de la etapa");
			get_line(kms);
			Begin
				recuClave(i.calendario, kms, precio);			--ADT LO 
				OK := ingresoIncorrecto("Etapa ya existe");
			exception
				when claveNoExiste => OK:= true;
			end;
			exit when OK;
		end loop;
	end pedirKmEtapaNueva;
	
	
	
	
	procedure pedirPrecio (precio: out float; tope: in float) is
	--Ingresa y valida un precio
	--PRE: tope = T
	--POS: precio = P. P es un valor de precio v�lido
	--Excepciones: salir}
		OK: boolean;
	begin
		CLS;
		loop
			put_line("Ingrese precio del servicio");
			get_line(precio);
			
			if (precio < tope) then	
				OK := ingresoIncorrecto("Precio incorrecto");
			else
				OK := true;
			end if;
			exit when (OK);
		end loop;
	end pedirPrecio;
	
	
	
	
	procedure pedirDNI (clientes: in arbolClientes.tipoArbol; DNI: out tipoClaveClientes) is
	--Ingresa y valida un DNI
	--PRE: clientes = C
	--POS: DNI = D. D es un documento registrado en el ABB
	--Excepciones: salir}
		i: infoClientes;
		OK: boolean;
	begin
		CLS;
		loop
			put_line("Ingrese el DNI del cliente");
			get_line(DNI);
			
			begin	
				recuClave(clientes, DNI, i);
				OK := ingresoIncorrecto("Cliente ya existe");
			exception
				when claveNoExiste => OK := true;
			end
			exit when (OK) and (DNI >= 0);
		end loop;
	end pedirDNI;
	
	
	
	procedure pedirNombre(nombre: out Unbounded_String; apellido: out Unbounded_String) is
	--Ingresa un nombre y apellido
	--PRE: -
	--POS: nombre = N, apellido = A
	--Excepciones:-}
	begin
		CLS;
		put_line("Ingrese nombre del cliente");
		get_line(nombre);
		put_line("Ingrese apellido del cliente");
		get_line(apellido);
	end pedirNombre;
	
	
	
	
	procedure pedirTel(tel: out integer) is
	--Ingresa y valida un n�mero de tel�fono
	--PRE:
	--POS: tel = T. T es un n�mero de tel�fono v�lido
	--Excepciones: salir}
		OK: boolean;
	begin
		CLS;
		loop
			put_line("Ingrese n�mero de tel�fono celular del cliente");
			get_line(tel);
			
			if (i.tel < MIN_TEL) then
				OK := ingresoIncorrecto("N�mero incorrecto");
			else
				OK := true;
			end if;
			exit when (OK)
		end loop;
	end pedirTel;
	
	
	
	procedure pedirEmail(email: out Unbounded_String) is
	--Ingresa una direcci�n de email
	--PRE: -
	--POS: email = E. E tiene una direcci�n de email
	--Excepciones: -}
	begin
		CLS;
		put_line("Ingrese email del cliente");
		get_line(email);
	end pedirEmail;
	
	
	
	procedure pedirPatente(vehiculos: in arbolVehiculos.tipoArbol; pat: out tipoClaveAuto) is
	--Ingresa y valida una patente nueva
	--PRE: vehiculos: V
	--POS: pat = P
	--P es una patente nueva para vehiculos.
	--Excepciones: salir}
		OK: boolean;
		i: infoVehiculos;
	begin
		CLS;
		loop	
			pat := obtenerPatente();
			begin
				buscar(vehiculos, pat, i);
				OK := true;
			exception
				when arbolVehiculos.claveNoExiste => OK := true;
			end;
			exit when (OK);
		end loop;
	end pedirPatente;
	
	
	
	procedure pedirA�o(a�o: out integer; min: in integer) is
	--Ingresa y valida un a�o
	--PRE: tope = T
	--POS: a�o = A. A es un a�o v�lido
	--Excepciones: salir}
		OK: boolean;
	begin
		CLS;
		loop
			put_line("Ingrese a�o de fabricaci�n");
			get_line(a�o);
			
			if (a�o < min) then	
				OK := ingresoIncorrecto("A�o incorrecto");
			else	
				OK := true;
			end if;
			exit when (OK);
		end loop;
	end pedirA�o;
	
	
	
	procedure buscarDue�o (clientes: in arbolClientes.tipoArbol; iClien: out infoClientes) is
	--Ingresa un DNI y verifica si el cliente est� registrado
	--PRE: clientes = C
	--POS: iClien = I, DNI = D. I tiene la info de un cliente registrado. D es el DNI de un cliente registrado.
	--Excepciones: salir}
		OK: boolean;
		DNI: tipoClaveClientes;
	begin
		loop	
			put_line("Ingrese DNI del due�o del veh�culo");
			get_line(DNI);
			
			begin
				buscar(clientes, DNI, iClien);
				--Si el cliente no est� registrado tira claveNoExiste	
				OK := true;
			exception
				when claveNoExiste => OK := ingresoIncorrecto("Cliente no registrado");
			end;
			exit when (OK);
		end loop;
	end buscarDue�o;
	
	
	
	procedure pedirKmsReal(kms: out integer; min: in integer) is
	--Ingresa y valida un kilometraje real de un veh�culo
	--PRE: min = M, M es el valor m�nimo que puede tener el veh�culo para realizar un mantenimiento
	--POS: kms = K. K >= M
	--Excepciones: salir}
		OK: boolean;
	begin
		CLS;
		loop	
			put_line("Ingrese kilometraje real del veh�culo");
			get_line(kms);
			
			if (kms >= min) then	
				OK := true;
			else	
				OK := ingresoIncorrecto("Kilometraje incorrecto");
			end if:
			exit when (OK);
		end loop;
	end pedirKmsReal;
	
	
	
	
	procedure ingresarEtapa(modelos: in listaModelos.tipoLista; iVehi: in infoVehiculos; j: out infoListaMant; etapa: out tipoClaveCalendario) is
	--Ingresa una etapa de servicio de un veh�culo registrado
	--PRE: modelos = M, codMod = C. C es el c�digo de modelo del veh�culo
	--POS: j = J, etapa = E.
	--J tiene la info de un servicio
	--E es una etapa de mantenimiento
	--Excepciones:  salir}
		OK: boolean;
		infoMod: infoModelos;
		primEtapa: tipoClaveCalendario;
		iEtapa: float;
	begin
		recuClave(modelos, iVehi.cod, infoMod);
		recuPrim(infoMod.calendario, primEtapa);
		--Recuperamos la primer etapa de mantenimiento del modelo del vehiculo
		
		pedirKmsReal(j.kmReal, primEtapa);
		
		loop
			pedirEtapa(etapa, iEtapa, modelos, codMod);
			if (j.kmReal < etapa) then
				OK := ingresoIncorrecto("La etapa d mantenimiento no corresponde con el kilometraje del veh�culo");
			else	
				OK := true;
			end if;
			exit when (OK);
		end loop;
		
		--primero pedir el kilometraje, y despues la etapa
		--si la etapa es menor al kilometraje, incorrecto
		
		j.fecha := obtenerFecha();
		
		pedirObs(j.obs);
		
		pedirPrecio(j.precio, iEtapa);
	end ingresarEtapa;
	
	
	
	
	procedure pedirEtapa(etapa: out tipoClaveCalendario; iEtapa: out float; modelos: in listaModelos.tipoLista; codMod: in integer) is
	--Ingresa y v�lida una etapa de servicio de un veh�culo
	--PRE: modelos = M, codMod = C
	--POS: etapa = E, iEtapa = I.
	--E corresponde a una etapa de servicio del modelo de c�digo C
	--I es la info de la etapa}
	begin
		CLS;
		loop
			put_line("Ingrese etapa del servicio");
			get_line(etapa);
			
			begin
				recuClave(modelos, codMod, iMod);
				--Sabemos que el modelo est� registrado, no tira claveNoExiste
				recuClave(iMod.calendario, etapa, iEtapa)
				--Si la etapa no est� registrada para el modelo ingresado, tira claveNoExiste
				OK := true;
			exception
				when claveNoExiste => OK := ingresoIncorrecto("Etapa no registrada");
			end;
			exit when (OK);
		end loop;
	end pedirEtapa;
	
	
	
	procedure pedirObs(obs: out Unbounded_String) is
	--Ingresa una observaci�n
	--PRE: -
	--POS: obs = O
	--Excepciones: -}
	begin
		CLS;
		put_line("Ingrese las observaciones del servicio");
		get_line(obs);
	end pedirObs;
	
	
	
	procedure vaciarListaVehiculos (lista: in out listaVehiculos.tipoLista; vehiculos: in out arbolVehiculos.tipoArbol) is
	--Elimina los veh�culos de la lista de veh�culos de un cliente y del ABB de veh�culos
	--PRE: lista: L, vehiculos = V
	--POS: lista = L1, vehiculos = V1. L1 est� vac�a. V1 no tiene los elementos de L
	--Excepciones:		}
		k, aux: tipoClaveAuto;
		OK, i: boolean;
	begin
		OK := true;
		recuPrim(lista, k);				--ADT LO
		While OK do
		begin
			recuClave(lista, k, i);		--ADT LO
			aux := k;
			recuSig(lista,k,k);			--ADT LO
			begin
				suprimirVehiculo(vehiculos, aux);	--Nivel 5
				suprimir(lista, aux);				--ADT LO
			exception
				when claveNoExiste => null;
				--No tendr�a que tirar claveNoExiste porque
				--se supone que el veh�culo se carg� tanto 
				--en el ABB como en la lista del cliente
			end;
		end:
		end while;
	exception
		when claveEsUltima => OK := false;
								suprimirVehiculo(vehiculos, aux);		--Nivel 5
								suprimir(lista, aux);					--ADT LO
	end vaciarListaVehiculos;
	
	
	
	procedure eliminarVehiculosModelo(clientes: in out arbolClientes.tipoArbol; vehiculos: arbolVehiculos.tipoArbol; cod: in integer) is
	--Elimina todos los vehiculos de un modelo
	--PRE: clientes = C, vehiculos = V, cod = M
	--POS: clientes = C1, vehiculos = V1. V1 no tiene los vehiculos de modelo de c�digo M. 
	--Los clientes de C1 no tienen veh�culos de modelo de c�digo M en sus listas de veh�culos
	--Excepciones: salir}
		qVehiculos: arbolVehiculos.ColaRecorridos.tipoCola;
		qClientes: arbolClientes.ColaRecorridos.tipoCola;
		pat: tipoClaveAuto;
		k: integer;
		i: infoVehiculos;
		j: infoClientes;
	begin
		crear(qVehiculos);						--ADT Cola
		inOrder(vehiculos, qVehiculos);			--ADT ABB
	
		while not(esVacia(qVehiculos)) do		--ADT Cola
			frente(qVehiculos, pat);					--ADT Cola
			desencolar(qVehiculos);					--ADT Cola
			buscar(vehiculos, pat, i);				--ADT ABB
			if (i.cod = cod) then
			begin
			--Si encuentra un veh�culo del modelo que se quiere eliminar, primero lo elimina 
			--de la lista de veh�culos de su due�o y despu�s del arbol
				buscar(clientes, i.due�o, j);		--ADT ABB
				suprimir(j.vehiculos, pat);			--ADT ABB
				suprimirVehiculo(vehiculos, pat);	--Nivel 5
			exception
				when claveNoExiste => null;
				--no tendr�a que suceder
			end if;
		end while;
	exception
		when arbolClientes.errorEnCola => raise salir;
		when arbolVehiculos.errorEnCola => raise salir;
	end eliminarVehiculosModelo;
	
	
	
	
	procedure eliminarServiciosEtapa(vehiculos: in out arbolVehiculos.tipoArbol; cod: in integer; etapa: in tipoClaveCalendario) is
	--Elimina los servicios de una etapa en los veh�culo de un modelo
	--PRE: vehiculos = V, cod = C, etapa = E
	--POS: vehiculos = V1. Los veh�culos de V1 no tiene registrado el servicio de la etapa E
	--Excepciones: salir}
		qVehiculos: arbolVehiculos.ColaRecorridos.tipoCola;
		k: integer;
		i: infoVehiculos;
	begin
		crear(qVehiculos);							--ADT Cola
		inOrder(vehiculos, qVehiculos);				--ADT ABB
	
		while not(esVacia(qVehiculos)) do			--ADT Cola
			frente(qVehiculos, k);					--ADT Cola
			desencolar(qVehiculos);					--ADT Cola
			
			buscar(vehiculos, k, i);				--ADT ABB
			if (i.cod = cod) then
				begin
					suprimir(i.mantenimientos, etapa);	--ADT LO
				exception
					when claveNoExiste => null;
					--Puede ser que el veh�culo no tenga el servicio de esa etapa realizado
				end;
			end if;
		end while;
	exception
		when arbolVehiculos.errorEnCola => raise salir;
	end eliminarServiciosEtapa;
	
	
	procedure menuModifCliente is
	--Muestra menu para seleccionar qu� modificar de un cliente
	begin
		CLS;
		put_line("Que desea modificar? ");
		put_line("----------------------");
		put_line("1. Nombre y Apellido");
		put_line("2. Telefono de contacto");
		put_line("3. Email");
		put_line("4. Listado de Vehiculos");
		put_line("5. Salir");
	end menuModifCliente;
	
	
	
	procedure menuModifVehiculo is
	--Muestra menu para seleccionar qu� modificar de un vehiculo
	begin
		CLS;
		put_line("�Qu� desea modificar? ");
		put_line("----------------------");
		put_line("1. Patente");
		put_line("2. A�o de Fabricaci�n");
		put_line("3. C�digo de modelo");
		put_line("4. Cambiar due�o");
		put_line("5. Salir");
	end menuModifVehiculo;
	
	
	--VERIFICAR DE DONDE SALE VARIABLE "DUE�O"--
	procedure cambioDue�o(clientes: in arbolClientes.tipoArbol; pat: in tipoClaveAuto; iDue�o: in out infoVehiculos) is
	--Cambia el due�o de un veh�culo
	--PRE: clientes = C, pat = P, iDue�o = D
	--POS: iDue�o = D1. D1 es la info del veh�culo con due�o nuevo
	--Excepciones: salir}
		i: infoClientes;
		tieneMant: boolean;
	begin
		buscar(clientes, due�o, i);
		recuClave(i.vehiculos, pat, tieneMant);
		suprimir(i.vehiculos, pat);
	
		pedirDatosClienteExistente(clientes, due�o, i);
	
		insertar(i.vehiculos, pat, tieneMant);
	end cambioDue�o;
	
	
	procedure menuModifServicio is
	--Menu para modificar informacion de un servicio realizado
	begin
		CLS;
		put_line("�Qu� desea modificar? ");
		put_line("----------------------");
		put_line("1. Etapa");
		put_line("2. Kilometraje real del veh�culo");
		put_line("3. Fecha en que se realiz� el servicio");
		put_line("4. Observaciones del servicio");
		put_line("5. Precio final del servicio");
		put_line("6. Salir");
	end menuModifServicio;
	
	
	
	procedure mostrarMant(pat: in tipoClaveAuto; infoVehi: infoVehiculos) is
	--Muestra los mantenimientos de un veh�culo
	--PRE: pat = P, infoVehi = I. I es la info del veh�culo de patente P
	--POS: -
	--Excepciones: }
		k: integer;
		infoLM: infoListaMant;
		OK: Boolean;
	begin
		ok := true;

		recuPrim(infoVehi.mantenimientos, k);
	
		while OK do
			recuClave(infoVehi.mantenimientos, k, infoLM);
			put_line("Patente del veh�culo: ", pat);
			put_line("Etapa de mantenimiento: ", k," kil�metros");
			put_line("Kilometraje real: ", infoLM.kmReal);
			put_line("Fecha de realizaci�n de servicio: ", infoLM.fecha);
			put_line("Observaciones hechas: ", infoLM.obs);
			put_line("Precio final: ", infoLM.precio);
			
			begin
				recuSig(infoVehi.mantenimientos,k,k);
			exception
				when claveEsUltima => OK := false;
			end;
		end while;
	exception
		when listaMant.listaVacia => put_line("No se registr� ning�n mantenimiento sobre el veh�culo de patente ingresada");
	end mostrarMant;
	
	
	
	
	function tieneMant (i: in infoClientes) return boolean is
	--Verifica si el cliente reaiz� mantenimientos en todos sus veh�culos
	--PRE: i = I. I es la info del cliente
	--POS: tieneMant <- V � F. Ser� V cuando todos sus veh�culos tengan alg�n servicio realizado
	--Excepciones: }
		pat: tipoClaveAuto;
		OK, info: boolean;
	begin
		OK := true;
		recuPrim(i.vehiculos);				--ADT LO
		
		while OK do
			recuClave(i.vehiculos, pat, info);		--ADT LO
			if not(info) then
				OK := false;
			end if;
			--Si el vehiculo no tiene mantenimientos realizados,
			--se corta el bucle y la funcion devuelve Falso
			begin
				recuSig(i.vehiculos,pat,pat);	--ADT LO
			exception
				when claveEsUltima => OK := false;
			end;
		end while;
		
		tieneMant := info; 
		--Si fueron todas V (si todos los veh�culos tienen al menos un servicio realizado),
		--la funci�n devuelve V.
		--Si se encontr� un veh�culo sin mantenimientos, devuelve Falso
	exception
		when listaVehiculos.listaVacia => return false;
	end tieneMant;
	
	
	
	
	
	
	
	
	
----------------------------------------------------------------------
--NIVEL 3
	
	procedure pedirDatosAltaModelo(modelos: in listaModelos.tipoLista; k: out integer; info: out infoModelos) is
	--Ingresa los datos para cargar un modelo nuevo
	--PRE: modelos = M
	--POS: info = I, k = K. 
	--I tiene la info correspondiente al modelo nuevo. 
	--K tiene el c�digo de modelo
	--Excepciones: }
	begin
		CLS;
		put_line("Ingrese nombre del modelo");
		info.nomMod := get_line;
		k := KAutoNum(modelos);
		crear(info.calendario);
	end pedirDatosAltaModelo;
	
	
	
	procedure pedirDatosAltaEtapas (modelos: in listaModelos.tipoLista; cod: out integer; kms: out integer; precio: out float; i: out infoModelos) is
	--Ingresa y valida los datos a insertar en una etapa de mantenimiento
	--PRE: modelos = M
	--POS: cod = C, kms = K, precio = P, i = I
	--C es una clave v�lida de la lista modelos, 
	--K es un kilometraje v�lido
	--P es un precio v�lido
	--I es la info del modelo
	--Excepciones: salir}
	begin
		pedirCod(cod, modelos, i);
		
		pedirKmEtapaNueva(kms, i);
		
		pedirPrecio(precio, MIN_PRECIO);
		
	end pedirDatosAltaEtapas;
	
	
	
	
	procedure pedirDatosAltaClientes(clientes: in arbolClientes.tipoArbol; DNI: out tipoClaveClientes; i: out infoClientes) is
	--Ingresa y valida los datos a insertar en un cliente nuevo
	--PRE: clientes = C
	--POS: DNI = D, i = I. 
	--D tiene un DNI v�lido de un cliente nuevo. 
	--I tiene la info correspondiente del cliente nuevo
	--Excepciones: salir}
	begin
		pedirDNI(clientes, DNI);
		
		pedirNombre(i.nombre, i.apellido);
		
		pedirTel(i.tel);
		
		pedirEmail(i.email);
		
		crear(i.vehiculos);
	end pedirDatosAltaClientes;
	
	
	
	procedure pedirDatosAltaVehiculos(pat: out tipoClaveAuto; i: out infoVehiculos; l: out infoClientes; modelos: in listaModelos.tipoLista; clientes: in arbolClientes.tipoArbol; vehiculo: in arbolVehiculos.tipoArbol) is
	--Ingresa y valida los datos para cargar un veh�culo nuevo
	--PRE: modelos = M, clientes = C, vehiculos = V
	--POS: patente = P, i = I, l = L. 
	--P tiene una patente v�lida. 
	--I tiene la info del veh�culo nuevo. 
	-- tiene la info del due�o del veh�culo
	--Excepciones: salir}
		j: infoModelos;
	begin
		pedirPatente(vehiculos, pat);
		
		pedirA�o(i.a�o, MIN_A�O);
		
		pedirCod(i.cod, modelos, j);
		
		crear(i.mantenimientos);
		
		buscarDue�o(clientes, l);
	end pedirDatosAltaVehiculos;
	
	
	
	procedure pedirDatosVehiculosExistente(vehiculos: in arbolVehiculos.tipoArbol; pat: out tipoClaveAuto; i: out infoVehiculos) is
	--Ingresa datos de un veh�culo existente
	--PRE: vehiculos = V
	--POS: pat = P, i = I. P es una patente existente. I es su info
	--Excepciones: salir}
		OK: boolean;
	begin
		if (not(esVacio(vehiculos))) then
			loop
				pat := obtenerPatente;
				begin
					buscar(vehiculos,pat, i);
					OK := true;
				exception
					when arbolVehiculos.claveNoExiste =>
						OK := ingresoIncorrecto("Patente no existe");
				end;
			exit when(OK);
			end loop;
		else
			put_line("No hay ning�n veh�culo cargado");
			raise salir;
		end if;
		
	end pedirDatosVehiculosExistente;
	
	
	
	procedure pedirDatosAltaServicio(clientes: in arbolClientes.tipoArbol; vehiculos: in arbolVehiculos.tipoArbol; modelos: in listaModelos.tipoLista; pat: out tipoClaveAuto; j: out infoListaMant; etapa: out tipoClaveCalendario; lista: out listaVehiculos.tipoLista) is
	--Ingresa y valida los datos de un servicio realizado en un vehiculo
	--PRE: clientes = C, vehiculos = V, modelos = M
	--POS: pat = P, lista = L, etapa = E
	--L tiene la lista de veh�culos registrado del cliente. 
	--P tiene una patente v�lida.
	--E es una etapa v�lida para el modelo de veh�culo.
	--Excepciones: salir}
		iClien: infoClientes;
		iVehi: infoVehiculos;
	begin
		pedirDatosVehiculosExistente(vehiculos,pat, iVehi);
		
		ingresarEtapa(modelos, iVehi, j, etapa);
		
		lista := iClien.vehiculos;
	end pedirDatosAltaServicio;
	
	
	
	procedure pedirDatosModeloExistente(modelos: in listaModelos.tipoLista; cod: out integer; i: out infoModelos) is
	--Ingresa un c�digo existente al usuario
	--PRE: modelos = M
	--POS: cod = C, i = I. C es un c�digo que existe en la lista de modelos. 
	--I es su info.
	--Excepciones: salir}
		OK: boolean;
	begin
		If (not(esVacia(modelos))) then
			
			put_line("Si no desea continuar, ingrese 0");
			pedirCod(cod, modelos, i);
		else
			put_line("No hay ning�n modelo cargado");
			raise salir;
		end if;
	end pedirDatosModeloExistente;
	
	
	
	procedure pedirDatosEtapaExistente(modelos: in listaModelos.tipoLista; cod: out integer; etapa: out tipoClaveCalendario) is
	--Ingresa y valida una etapa de mantenimiento de un modelo
	--PRE: modelos = M
	--POS: cod = C, etapa = E. C es un c�digo de modelo y E es una etapa de --mantenimiento del modelo C
	--Excepciones: salir}
		OK: boolean;
		i: infoModelos;
		iEtapa: float;
	begin
		if (not(esVacia(modelos))) then
			pedirCod(cod, modelos, i);
			if(not(esVacia(i.calendario))) then
				put_line("Si no desea continuar, ingrese 0");
				pedirEtapa(etapa, iEtapa, modelos, cod);
			else
				put_line("El modelo no tiene ninguna etapa de mantenimiento cargada");
				raise salir;
			end if;
		else
			put_line("No hay ning�n modelo cargado");
			raise salir;
		end if;
	end pedirDatosEtapaExistente;
	
	
	
	
	procedure pedirDatosClienteExistente(clientes: in arbolClientes.tipoArbol; DNI: out tipoClaveClientes; i: out infoClientes) is
	--Ingresa datos de un cliente a existente
	--PRE: clientes = C.
	--POS: DNI = D. D es el DNI de un cliente a eliminar
	--Excepciones: salir}
		OK: boolean;
	begin
		if(not(esVacio(clientes))) then
			loop
			begin
				put_line("Ingrese el DNI del cliente existente");
				get(DNI);
				skip_line;
				buscar(clientes, DNI, i);
				OK := true;
			exception
				when arbolClientes.claveNoExiste => OK := ingresoIncorrecto("Cliente no existe");
				when DATA_ERROR => OK := ingresoIncorrecto("Valor ingresado incorrecto");
			end;
			exit when(OK);
			end loop;
		else
			put_line("No hay ning�n cliente cargado");
			raise salir;
		end if;
	end pedirDatosClienteExistente;
	
	
	
	
	
	
	procedure pedirDatosServicioExistente(vehiculos: in arbolVehiculos.tipoArbol; modelos: in listaModelos.tipoLista; pat: out tipoClaveAuto; info: out infoVehiculos; etapa: out tipoClaveCalendario) is
	--Ingresa los datos de una etapa de mantenimiento existente
	--PRE: vehiculos = V, modelos = M
	--POS: pat = P, info = I, etapa = E.
	--P es la patente del veh�culo a eliminar la etapa
	--I es su info.
	--E es la etapa de mantenimiento a eliminar
	--Excepciones: salir}
		i: infoListaMant;
		iEtapa: float;
		OK: boolean;
	begin
		pedirDatosVehiculosExistente(vehiculos, pat, info);
		
		if (not(esVacia(info.mantenimientos))) then
			loop
				pedirEtapa(etapa, iEtapa, modelos, info.cod);
				begin
					recuClave(info.mantenimientos, etapa, i);
					OK:= true;
				exception
					when listaMant.claveNoExiste => OK := ingresoIncorrecto("Servicio de esa etapa no fue realizado");
				end;
			exit when (OK);
			end loop;
		else
			put_line("No hay ning�n servicio realizado sobre el veh�culo");
			raise salir;
		end if;
	end pedirDatosServicioExistente;
	
	
	
	procedure mostrarMantClientes(vehiculos: in arbolVehiculos.tipoArbol; i: in infoClientes) is
	--Muestra los mantenimientos de los veh�culos de un cliente
	--PRE: vehiculos = V, i = I. I es la info del cliente
	--POS: -
	--Excepciones: }
	
		pat: tipoClaveAuto;
		OK, tieneMant: boolean;
		j: infoVehiculos;
		
	begin
		OK := true;
		recuPrim(i.vehiculos, pat);
		put_line("Matenimientos solicitados por el cliente " & i.nombre &" " & i.apellido);
		while (OK) loop	
			recuClave(i.vehiculos, pat, tieneMant);
			if (tieneMant) then
				buscar(vehiculos, pat, j);
				mostrarMant(pat, j);
			end if;
			begin
				recuSig(i.vehiculos, pat, pat);
			exception
				when listaVehiculos.claveEsUltima => OK := false;
			end;
		end loop;
	exception
		when listaVehiculos.listaVacia => put_line("El cliente no solicit� ning�n servicio");
	end mostrarMantClientes;
	
	
	procedure pedirDatosModifModelos(modelos: in listaModelos.tipoLista; cod: out integer; i: out infoModelos) is
	--Ingresa los datos para modificar un modelo
	--PRE: modelos = M
	--POS: cod = C, i = I. C es el c�digo del modelo a modificar. I es su info
	--Excepciones: salir}
	begin
		pedirCod(cod, modelos, i);
		
		put_line("Ingrese el nuevo nombre del modelo");
		i.nomMod := get_line;
	end pedirDatosModifModelos;
	
	
	
	procedure pedirDatosModifEtapas(modelos: listaModelos.tipoLista; etapa: out tipoClaveCalendario; iEtapa: out float; i: out infoModelos) is
	--Ingresa los datos para modificar una etapa de mantenimiento de un modelo
	--PRE: modelos = M
	--POS: etapa = E, iEtapa = I, i = M.
	--E es la etapa de modificar.
	--I es la info de la etapa (precio base)
	--M es la info del modelo.
	--Excepciones: salir}
		cod: integer;
	begin
		pedirCod(cod, modelos, i);
		
		if(not(esVacia(i.calendario))) then
			pedirEtapa(etapa, iEtapa, modelos, cod);
			pedirPrecio(iEtapa, MIN_PRECIO);
		else
			put_line("El modelo de c�digo " & Integer'Image(cod) & " no tiene etapas de mantenimientos cargadas");
			raise salir;
		end if;
	end pedirDatosModifEtapas;
	
	
	
	procedure pedirDatosModifClientes(clientes: arbolClientes.tipoArbol; i: out infoClientes; salida: out boolean) is
	--Ingresa los datos para modificar un cliente
	--PRE: clientes = C
	--POS: i = I, salida = S. 
	--I es la info nueva del cliente a modificar
	--S un valor de salida
	--Excepciones: salir}
		opc: integer;
	begin
		salida := false;
		menuModifCliente;
		
		opc:= enteroEnRango("Ingrese su opci�n", 1, 4);
		
		case(opc)is
			when 1 => pedirNombre(i.nombre, i.apellido);
			when 2 => pedirTel(i.tel);
			when 3 => pedirEmail(i.email);
			when 4 => salida := true;
			when others => null;
		end case;
	end pedirDatosModifClientes;
	
	
	
	procedure pedirDatosModifVehiculos(clientes: in arbolClientes.tipoArbol; modelos: listaModelos.tipoLista; datos: in out infoVehiculos; pat: in out tipoClaveAuto; salida: out boolean) is
	--Ingresa los datos para modificar un veh�culo
	--PRE: clientes = C, modelos = M, datos = D, pat = P.
	--POS: datos = D1, salida = S.
	--D1 es la info nueva del veh�culo
	--S es un valor de salida
	--Excepciones: salir}
		j: infoModelos;
		opc: integer;
	begin
		salida:= false;
		menuModifVehiculo;
		
		opc:= enteroEnRango("Ingrese su opci�n", 1, 5);
		
		case(opc)is
			when 1 => pat := obtenerPatente;
			when 2 => pedirA�o(datos.a�o, MIN_A�O);
			when 3 => pedirCod(datos.cod, modelos, j);
			when 4 => cambioDue�o(clientes, pat, datos);
			when 5 => salida:= true;
			when others => null;
		end case;
	end pedirDatosModifVehiculos;
	
	
	
	procedure pedirDatosModifServicio(modelos: in listaModelos.tipoLista; etapa: out tipoClaveCalendario; cod: in integer; i: out infoListaMant; salida: out boolean) is
	--Ingresa los datos para modificar un servicio realizado
	--PRE: modelos = M, cod = C
	--POS: etapa = E, i = I, salida = S.
	--E es la etapa de mantenimiento a modificar
	--I es la info nueva
	--S es un valor de salida
	--Excepciones: salir}
		opc: integer;
		iEtapa: float;
	begin
		salida:= false;
		menuModifServicio;
		
		opc:= enteroEnRango("Ingrese su opci�n", 1, 6);
		
		case(opc)is
			when 1 => pedirEtapa(etapa, iEtapa, modelos, cod);
			when 2 => pedirKmsReal(i.kmReal, MIN_KMS);
			when 3 => i.fecha := obtenerFecha;
			when 4 => pedirObs(i.obs);
			when 5 => pedirPrecio(i.precio, MIN_PRECIO);
			when 6 => salida:= true;
			when others => null;
		end case;
	end pedirDatosModifServicio;
	
	
	
	procedure mostrarMantModelo(vehiculos: in arbolVehiculos.tipoArbol; cod: in integer) is
	--Muestra los mantenimientos de los veh�culos de un modelo
	--PRE: vehiculos = V, cod = C
	--POS: -
	--Excepciones: salir }
		use arbolVehiculos.ColaRecorridos;
		qVehiculos: arbolVehiculos.ColaRecorridos.tipoCola;
		pat: tipoClaveAuto;
		i: infoVehiculos;
	begin
		crear(qVehiculos);
		inOrder(vehiculos, qVehiculos);
		
		put_line("Matenimientos realizados sobre el modelo de c�digo & Integer'Image(cod)");
		
		while(not(esVacia(qVehiculos))) loop
			frente(qVehiculos, pat);
			desencolar(qVehiculos);
			
			buscar(vehiculos, pat, i);
			
			if(i.cod = cod)then
				mostrarMant(pat, i);
			end if;
		end loop;
	exception
		when arbolVehiculos.errorEnCola => raise salir;
	end mostrarMantModelo;
	
	
	
	procedure conseguirClientesSinMant(clientes: in arbolClientes.tipoArbol; q: out arbolClientes.ColaRecorridos.tipoCola) is
	--Devuelve en una cola los clientes que no haya solicitado mantenimiento en alguno de sus veh�culos registrados
	--PRE: clientes = C
	--POS: q = Q. Q tiene los DNI de los clientes que no solicitaron al menos un mantenimiento en alguno de sus veh�culos
	--Excepciones: salir}
		use arbolClientes.ColaRecorridos;
		qAux: arbolClientes.ColaRecorridos.tipoCola;
		DNI: tipoClaveClientes;
		i: infoClientes;
	begin
		crear(qAux);
		crear(q);
		
		inOrder(clientes, qAux);
		
		while(not(esVacia(qAux))) loop
			frente(qAux, DNI);
			desencolar(qAux);
			
			buscar(clientes, DNI, i);
			
			If(not(tieneMant(i))) then
				encolar(q, DNI);
			end if;
		end loop;
	exception
		when arbolClientes.errorEnCola => raise salir;
	end conseguirClientesSinMant;
	
	
	procedure mostrarDatosClientes(clientes: in arbolClientes.tipoArbol; q: in out arbolClientes.ColaRecorridos.tipoCola) is
	--Muestra los datos de los clientes de la cola
	--PRE: clientes = C, q = Q. Q tiene los DNI de los clientes a mostrar
	--POS: -
	--Excepciones: }
		use arbolClientes.ColaRecorridos;
		DNI: tipoClaveClientes;
		i: infoClientes;
	begin
		while(not(esVacia(q))) loop
			frente(q, DNI);
			desencolar(q);
			
			buscar(clientes, DNI, i);
			put_line("Nombre: " & i.nombre);
			put_line("Apellido: " & i.apellido);
			put_line("Tel�fono: " & integer'image(i.tel));
			put_line("E-Mail: " & i.email);
		end loop;
	end mostrarDatosClientes;
	
	
	
	
	
	
	
	
	
	
	
	
----------------------------------------------------------------------
--NIVEL 2	
	procedure mostrarMenuABM is
	--Muestra men� de Altas, Bajas y Modificaciones
	--PRE: -
	--POS: -
	--Excepciones: -}
	begin
		CLS;
		put_line("1. Modelos");
		put_line("2. Etapas");
		put_line("3. Clientes");
		put_line("4. Veh�culos de un cliente");
		put_line("5. Servicios realizados sobre un veh�culo");
		put_line("6. Salir");
	end mostrarMenuABM;
	
	
	
	procedure mostrarMenuConsultas is
	--Muestra men� de Consultas
	--PRE: -
	--POS: -
	--Excepciones: -}
	begin
		CLS;
		put_line("1. Mantenimientos de un cliente");
		put_line("2. Mantenimientos por modelo");
		put_line("3. Datos de clientes sin mantenimientos realizados");
		put_line("4. Salir");
	end mostrarMenuConsultas;
	
	
	procedure altaModelo(modelos: in out listaModelos.tipoLista) is
	--QH: A�ade un nuevo modelo.
	--PRE: modelos = M
	--POST: modelos = M' y M' tiene un nuevo modelo.
	--Excepciones: -
		i: infoModelos;
		k: integer;
	begin
		pedirDatosAltaModelo(modelos, k, i);
		
		insertar(modelos, k, i);
	exception
		when listaModelos.listaLlena => put_line("No se pudo ingresar nuevo modelo");
		when salir => put_line("No se complet� la operaci�n");
    end altaModelo;
	
	
	
	procedure altaEtapas(modelos: in out listaModelos.tipoLista) is
	--Agrega una etapa de mantenimiento en el calendario de un modelo
	--PRE: modelos = M
	--POS: modelos = M1, el nodo i de M1 tiene una etapa de mantenimiento nueva
	--Excepciones:	-
		cod: integer;
		kms: integer;
		precio: float;
		i:infoModelos;
	begin
		pedirDatosAltaEtapas(modelos, cod, kms, precio, i);
		
		insertar(i.calendario, kms, precio);
	exception
		when listaModelos.listaLlena => put_line("No se pudo insertar la nueva etapa de mantenimiento");
		when salir => put_line("No se complet� la operaci�n");
	end altaEtapas;
	
	
	
	procedure altaClientes(clientes: in out arbolClientes.tipoArbol) is
	--Ingresa un cliente nuevo
	--PRE: clientes = C
	--POS: clientes = C1, C1 tiene un cliente nuevo
	--Excepciones:	-
		DNI: tipoClaveClientes;
		i: infoClientes;
	begin
		pedirDatosAltaClientes(clientes, DNI, i);
		
		insertar(clientes, DNI, i);
	exception
		when arbolClientes.arbolLleno => put_line("No se pudo agregar el cliente nuevo");
		when salir => put_line("No se complet� la operaci�n");
	end altaClientes;
	
	
	
	procedure altaVehiculos(vehiculos: in out arbolVehiculos.tipoArbol; clientes: in out arbolClientes.tipoArbol; modelos: in listaModelos.tipoLista) is
	--QH: Ingresa un nuevo veh�culo y lo asocia con su due�o
	--PRE: vehiculos = V, modelos = M, clientes = C
	--POST: vehiculos = V1. V1 tiene un nuevo veh�culo. La lista del nodo de C que corresponde al cliente ingresado tiene un elemento nuevo
	--EXC: -
		pat: tipoClaveAuto;
		i: infoVehiculos;
		l: infoClientes;
	begin
		pedirDatosAltaVehiculos(pat, i, l, modelos, clientes, vehiculos);
		
		insertar(vehiculos, pat, i);
		
		insertar(l.vehiculos, pat, false);
		
		--Agrega un nuevo veh�culo a lista lista de veh�culos del cliente
		--(Sin servicios realizados)
	exception
		when listaVehiculos.listaLlena => put_line("No se pudo ingresar nuevo veh�culo");
		when arbolVehiculos.arbolLleno => put_line("No se pudo ingresar nuevo veh�culo");
		when listaVehiculos.claveExiste => put_line("Servicio ya existe");
		when salir => put_line("No se complet� la operaci�n");
	end altaVehiculos;
		
		
	
	procedure altaServicios(clientes: in arbolClientes.tipoArbol; vehiculos: in out arbolVehiculos.tipoArbol; modelos: in listaModelos.tipoLista) is
	--Ingresa un servicio nuevo a un veh�culo
	--PRE: clientes = C, vehiculos = V, modelos = M
	--POS: clientes = C1, vehiculos = V1.
	--La lista de mantenimiento del veh�culo ingresado de V1 tiene un nodo nuevo.
	--El nodo correspondiente al veh�culo ingresado en la lista de veh�culos del cliente ingresado indica que se le realiz� un servicio
	--Excepciones: -
		pat: tipoClaveAuto;
		i: infoVehiculos;
		j: infoListaMant;
		etapa: tipoClaveCalendario;
		lista: listaVehiculos.tipoLista;
		tieneMant: boolean;
	begin
		pedirDatosAltaServicio(clientes, vehiculos, modelos, pat, j, etapa, lista);
		
		buscar(vehiculos, pat, i);
		
		insertar(i.mantenimientos, etapa, j);
		
		recuClave(lista, pat, tieneMant);
		
		If not(tieneMant) then
			suprimir(lista,pat);
			insertar(lista, pat, true);			
		end if;
		
		--Si el veh�culo no tiene servicios registrados (tieneMant = F)
		--Se indica que tiene por lo menos uno
		
	exception
		when listaVehiculos.listaLlena => put_line("No se pudo agregar el servicio de la etapa ingresada");
		when listaVehiculos.claveExiste => put_line("Servicio ya existe");
		when salir => put_line("No se complet� la operaci�n");
	end altaServicios;
	
	
	
	procedure bajaModelo(modelos: in out listaModelos.tipoLista; cliente: in out arbolClientes.tipoArbol; vehiculo: in out arbolVehiculos.tipoArbol) is
	--Elimina un modelo registrado
	--PRE: modelos = M, clientes = C, vehiculos = V
	--POS: modelos = M1, clientes = C1, vehiculos = V1.
	--M1 tiene un elemento menos
	--Las listas de los clientes de C1 no tienen veh�culos del modelo ingresado.
	--V1 no tiene veh�culos del modelo ingresado
	--Excepciones:	-
		cod: integer;
		i: infoModelos;
	begin
		put_line("Se eliminar�n todos los veh�culos registrados de ese modelo");
		pedirDatosModeloExistente(modelos, cod, i);
		
		eliminarVehiculosModelo(clientes, vehiculos, cod);
		
		vaciar(i.calendario);
		suprimir(modelos,cod);
	exception
		when salir => put_line("No se complet� la operaci�n");
	end bajaModelo;
	
	
	procedure bajaEtapas(modelos: in out listaModelos.tipoLista; vehiculos: in out arbolVehiculos.tipoArbol) is
	--Elimina una etapa de mantenimiento del calendario de un modelo
	--PRE: modelos = M
	--POS: modelos = M1. La lista de calendario correspondiente al c�digo de modelo ingresado tiene un elemento menos
	--Excepciones:	-
		cod: integer;
		etapa: tipoClaveCalendario;
		i: infoModelos;
	begin
		put_line("Se eliminar�n todos los servicios de la etapa que se ingrese.");
		pedirDatosEtapaExistente(modelos, cod, etapa);
		
		eliminarServiciosEtapa(vehiculos, cod, etapa);
		
		recuClave(modelos, cod, i);
		
		suprimir(i.calendario, etapa);
	exception
		when salir => put_line("No se complet� la operaci�n");
	end bajaEtapas;
	
	
	
	procedure bajaClientes(clientes: in out arbolClientes.tipoArbol; vehiculos: in out arbolVehiculos.tipoArbol) is
	--Elimina un cliente
	--PRE: clientes = C, vehiculos = V
	--POS: clientes = C1, vehiculos = V1. C1 no tiene el cliente ingresado por el usuario. V1 no tiene los veh�culos registrados a nombre del cliente ingresado por el usuario
	--Excepciones:		}
		DNI: tipoClaveClientes;
		i: infoClientes;
	begin
		pedirDatosClienteExistente(clientes, DNI, i);
		
		vaciarListaVehiculos(i.vehiculos, vehiculos);
		
		suprimir(clientes, DNI);
	exception
		when salir => put_line("No se complet� la operaci�n");
	end bajaClientes;

	
	
	procedure bajaVehiculos(clientes: in out arbolClientes.tipoArbol; vehiculos: in out arbolVehiculos.tipoArbol) is
	--Elimina un veh�culo
	--PRE: clientes = C, vehiculos = V
	--POS: clientes = C1, vehiculos = V1.
	--V1 no tiene el veh�culo ingresado por el usuario.
	--La lista de veh�culos del cliente registrado en C1 no tiene
	--el veh�culos ingresado por el usuario
	--Excepciones:		}
		pat: tipoClaveAuto;
		i: infoVehiculos;
		j: infoClientes;
	begin
		pedirDatosVehiculosExistente(vehiculos, pat, i);
		
		buscar(clientes, i.due�o, j);
		suprimir(j.vehiculos, pat);
		
		vaciar(i.mantenimientos);
		suprimir(vehiculos,pat);
	exception
		when salir => put_line("No se complet� la operaci�n");
	end bajaVehiculos;
	
	
	
	procedure bajaServicios(vehiculos: in out arbolVehiculos.tipoArbol; clientes: in out arbolClientes.tipoArbol; modelos: in listaModelos.tipoLista) is
	--Elimina un servicio realizado de un veh�culo registrado
	--PRE: vehiculos = V
	--POS: vehiculos = V1.
	--A la lista de mantenimientos del vehiculos ingresado por el usuario le falta un elemento
	--Excepciones:	-
		pat: tipoClaveAuto;
		i: infoVehiculos;
		etapa: tipoClaveCalendario;
		j: infoClientes;
	begin
		pedirDatosServicioExistente(vehiculos, modelos, pat, i, etapa);
		
		suprimir(i.mantenimientos, etapa);
		
		if (esVacia(i.mantenimientos)) then
			buscar(clientes, i.due�o, j);
			suprimir(j.vehiculos, pat);
			insertar(j.vehiculos, pat, false);
			modificar(clientes, i.due�o, j);
		end if;
		--Si el veh�culo no tiene mantenimientos registrados,
		--lo indicamos en la info de la lista de veh�culos
		--de su due�o
		
		modificar(vehiculos, pat, i);
	exception
		when salir => put_line("No se complet� la operaci�n");
	end bajaServicios;	
	
	
	
	procedure modModelo(modelos: in out listaModelos.tipoLista) is
	--Modifica los datos de un modelo.
	--PRE: modelos = M
	--POST: modelos = M' y M' tiene un nodo modificado}
	--Excepciones: -
		cod: integer;
		info: infoModelos;
	begin
		pedirDatosModifModelos(modelos, cod, info);
		
		suprimir(modelos, cod);
		insertar(modelos, cod, info);
	exception
		when salir => put_line("No se complet� la operaci�n");
	end modModelo;
		
	
	
	procedure modEtapas(modelos: in out listaModelos.tipoLista) is
	--Modifica una etapa de mantenimiento de un modelo. 
	--PRE: modelos = M
	--POST: modelos = M' y el modelo x (ingresado por el usuario) de M' tiene modificado su calentario de etapas
	--Excepciones: -
		cod: integer;
		kEtapa: tipoClaveCalendario;
		pEtapa: float;
		i: infoModelos;
	begin
		pedirDatosModifEtapas(modelos, kEtapa, pEtapa, i);
		
		suprimir(i.calendario, kEtapa);
		
		insertar(i.calendario, kEtapa, pEtapa);
	exception
		when salir => put_line("No se complet� la operaci�n");
	end modEtapas;
	
	
	
	procedure modClientes (clientes: in out arbolClientes.tipoArbol) is
	--Modifca los datos de un cliente
	--PRE: clientes = C 
	--POST: clientes = C' y C' tiene un cliente modificado
	--Excepciones: -
		DNI: tipoClaveClientes;
		infoC: infoClientes;
		salida: boolean;
	begin
		pedirDatosClienteExistente(clientes, DNI, infoC);
		
		loop
			pedirDatosModifClientes(clientes, infoC, salida);
			
			modificar(clientes, DNI, infoC);
		exit when(salida);
		end loop;
	exception
		when salir => put_line("No se complet� la operaci�n");
	end modClientes;
	
	
	
	procedure modVehiculos (vehiculos: in out arbolVehiculos.tipoArbol; clientes: in arbolClientes.tipoArbol; modelos: in listaModelos.tipoLista) is
	--Modifica los datos de un vehiculo 
	--PRE: vehiculos = V, clientes = C, modelos = M.
	--POST: vehiculos = V' y V' tiene un nodo modificado
	--Excepciones: -
		auto: tipoClaveAuto;
		datos, j: infoVehiculos;
		i: infoClientes;
		salida: Boolean;
	begin
		pedirDatosVehiculosExistente(vehiculos, auto, datos);
		
		loop
			pedirDatosModifVehiculos(clientes, modelos, datos, auto, salida);
			
			modificar(vehiculos, auto, datos);
		exit when(salida);
		end loop;
	exception
		when salir => put_line("No se complet� la operaci�n");
	end modVehiculos;
	
	
	
	procedure modServicios(vehiculos: in out arbolVehiculos.tipoArbol; modelos: in listaModelos.tipoLista) is
	--Modifica los servicios realizados sobre un vehiculo
	--PRE: vehiculos = V, modelos = M
	--POST: vehiculos = V', y V' tiene un servicio modificado}
	--Excepciones: -
		salida: boolean;
		info: infoVehiculos;
	    pat: tipoClaveAuto;
		etapa: tipoClaveCalendario;
		iServicio: infoListaMant;
		
	begin
		pedirDatosServicioExistente(vehiculos, modelos, pat, info, etapa);
		
		loop
			pedirDatosModifServicio(modelos, etapa, info.cod, iServicio, salida);
			begin
				insertar(info.mantenimientos, etapa, iServicio);
			--exception
				--when listaMant.claveExiste => salida:= ingresoIncorrecto("La nueva --etapa ingresada ya existe");
			end;
			
			--Al modifica el mantenimiento, puede ser que el veh�culo
			--que se quiera modificar su lista de mantenimientos ya tenga 
			--el servicio de la etapa ingresada
		exit when(salida);
		end loop;
	exception
		when salir => put_line("No se complet� la operaci�n");
	end modServicios;
	
	
	
	procedure mantXCliente(cliente: in arbolClientes.tipoArbol; vehiculos: arbolVehiculos.tipoArbol) is
	--Muestra los mantenimientos que solicit� un cliente ingresado por usuario
	--PRE: clientes = C, vehiculos = V
	--POS: -
	--Excepciones:	--
		DNI: tipoClaveClientes;
		i: infoClientes;
	begin
		pedirDatosClienteExistente(clientes, DNI, i);
		
		mostrarMantClientes(vehiculos, i);
		
		--en i est� la lista de veh�culos. Nos fijamos si
		--cada veh�culo tiene al menos un mant
		--(info de la lista de mant), y lo mostramos
		
	exception
		when salir => put_line("No se complet� la operaci�n");
	end mantXCliente;
	
	
	
	procedure mantXMod(modelos: in listaModelos.tipoLista; vehiculos: in arbolVehiculos.tipoArbol) is
	--Muestra los mantenimientos de un modelo ingresado por el usuario
	--PRE: modelos = M, vehiculos = V
	--POS: -
	--Excepciones:	-
		cod: integer;
		i: infoModelos;
	begin
		pedirDatosModeloExistente(modelos, cod, i);
		
		mostrarMantModelo(vehiculos, cod);
		
		--buscamos en el ABB los veh�culos del modelo ingresado
		--y mostramos sus mantenimientos
	exception
		when salir => put_line("No se complet� la operaci�n");
	end mantXMod;
	
	
	procedure datosClientes(clientes: in arbolClientes.tipoArbol) is
	--Muestra los datos de los clientes que no han realizado mantenimientos en alguno de sus veh�culos registrados
	--PRE: clientes = C
	--POS: -
	--Excepciones: -
		qClientes: arbolClientes.ColaRecorridos.tipoCola;
	begin
		conseguirClientesSinMant(clientes, qClientes);
		
		put_line("Clientes que no registraron ning�n mantenimiento en alguno de sus veh�culos registrados: ");
		
		mostrarDatosClientes(clientes, qClientes);
	exception
		when salir => put_line("No se complet� la operaci�n");
	end datosClientes;
	
	
	
	
	
	
	
	
	
	

----------------------------------------------------------------------
--NIVEL 1.

   procedure Consultas(clientes: in arbolClientes.tipoArbol; vehiculos: in arbolVehiculos.tipoArbol; modelos: in listaModelos.tipoLista) is
   --Realiza consultas sobre los datos cargados
   --PRE: clientes = C, vehiculos = V, modelos = M
   --POS: -
   --Excepciones: -}
	opc: integer;
   begin
		loop
			mostrarMenuConsultas;
			opc := enteroEnRango("Ingrese su opci�n", 1, 4);
			case (opc) is
				when 1 => mantXCliente(clientes, vehiculos);
				when 2 => mantXMod(modelos, vehiculos);
				when 3 => datosClientes(clientes);
				when others => null;
			end case;
		exit when (opc = 4);
		end loop;
   end Consultas;


   procedure ABM(opc: in integer; clientes: in out arbolClientes.tipoArbol; vehiculos: in out arbolVehiculos.tipoArbol; modelos: in out listaModelos.tipoLista) is
   --Realiza una modificaci�n en alguna de las estructuras
   --PRE: opc = O, clientes = C, vehiculos = V, modelos = M
   --POS: clientes = C1, vehiculos = V1, modelos = V1.
   --Se realizaron modificaciones en alguna de las estructuras (definido por usuario)
   --Excepciones: -
      opc1: Integer;
   begin
      loop
         mostrarMenuABM;
         opc1 := enteroEnRango("Ingrese su opci�n", 1, 6);
		 opc1 := opc*10 + opc1;
         case (opc1) is
            when 11 => altaModelo(modelos);
            when 12 => altaEtapas(modelos);
            when 13 => altaClientes(clientes);
            when 14 => altaVehiculos(vehiculos, clientes, modelos);
            when 15 => altaServicios(clientes, vehiculos, modelos);
            when 21 => bajaModelo(modelos, clientes, vehiculos);
            when 22 => bajaEtapas(modelos, vehiculos);
            when 23 => bajaClientes(clientes, vehiculos);
            when 24 => bajaVehiculos(clientes, vehiculos);
            when 25 => bajaServicios(vehiculos, clientes, modelos);
            when 31 => modModelo(modelos);
            when 32 => modEtapas(modelos);
            when 33 => modClientes(clientes);
            when 34 => modVehiculos(vehiculos, clientes, modelos);
            when 35 => modServicios(vehiculos, modelos);
			when others => null;
         end case;

      exit when ((opc1 = 16) or else (opc1 = 26) or else (opc1 = 36));
      end loop;
   end ABM;



   procedure crearEstructuras(clientes: out arbolClientes.tipoArbol; vehiculos: out arbolVehiculos.tipoArbol; modelos: out listaModelos.tipoLista) is
   --Crea estructuras para almacenar los datos
   --PRE: -
   --POS: clientes = C, vehiculos = V, modelos = M. C, V y M est�n vac�as}
   --Excepciones: -

   begin
                 crear(clientes);
                 crear(vehiculos);
                 crear(modelos);
   end crearEstructuras;

   procedure mostrarMenuPpal is
   --Muestra men� principal
   --PRE: -
   --POS: -
   --Excepciones: -

   begin
      CLS;
      put_line("�Qu� desea hacer?");
      put_line("");
      put_line("1. Agregar...");
      put_line("2. Quitar...");
      put_line("3. Modificar...");
      put_line("4. Realizar una consulta");
      put_line("5. Salir");

   end mostrarMenuPpal;




begin  --Programa Pricipal
   loop
      crearEstructuras(clientes, vehiculos, modelos);
      mostrarMenuPpal;
      opc := enteroEnRango("Ingrese su opci�n", 1, 5);
      if(opc >= 1) and then (opc <= 3) then

         ABM(opc, clientes, vehiculos, modelos);
      else
         if (opc = 4) then
            Consultas(clientes, vehiculos, modelos);
         end if;
      end if;
   exit when (opc = 5);
   end loop;

end;

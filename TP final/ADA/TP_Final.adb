with estructuras,
     utiles,
     Ada.Text_IO;
use estructuras,
    utiles,
    estructuras.arbolClientes,
    estructuras.arbolVehiculos,
    estructuras.listaModelos,
    estructuras.listaMant,
    estructuras.listaVehiculos,
    estructuras.listaCalendario,
    Ada.Text_IO;

procedure TP_Final is
   --CONSTANTES GLOBALES
   --SUBALGORITMOS NIVEL N
   --SUBAL. NIVEL N-1

   --MIN_TEL : constant integer := 2804000000;
   MIN_PRECIO : constant integer := 1000;		--Constantes a utilizar
   MIN_AÑO : constant integer := 1950;
   MIN_KMS : constant integer := 1000;
   opc: integer;
   clientes:  arbolClientes.tipoArbol;
   vehiculos: arbolVehiculos.tipoArbol;
   modelos: listaModelos.tipoLista;
----------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
----------------------------------------------------------------------
--NIVEL 3
	
	procedure pedirDatosAltaModelo(modelos: in listaModelos.tipoLista; k: out integer; info: out infoModelos) is
	--Ingresa los datos para cargar un modelo nuevo
	--PRE: modelos = M
	--POS: info = I, k = K. 
	--I tiene la info correspondiente al modelo nuevo. 
	--K tiene el código de modelo
	--Excepciones: }
	begin
		null;
	end pedirDatosAltaModelo;
	
	
	
	procedure pedirDatosAltaEtapas (modelos: in listaModelos.tipoLista; cod: out integer; kms: out integer; precio: out float; i: out infoModelos) is
	--Ingresa y valida los datos a insertar en una etapa de mantenimiento
	--PRE: modelos = M
	--POS: cod = C, kms = K, precio = P, i = I
	--C es una clave válida de la lista modelos, 
	--K es un kilometraje válido
	--P es un precio válido
	--I es la info del modelo
	--Excepciones: salir}
	begin
		null;
	end pedirDatosAltaEtapas;
	
	
	
	
	procedure pedirDatosAltaClientes(clientes: in arbolClientes.tipoArbol; DNI: out tipoClaveClientes; i: out infoClientes) is
	--Ingresa y valida los datos a insertar en un cliente nuevo
	--PRE: clientes = C
	--POS: DNI = D, i = I. 
	--D tiene un DNI válido de un cliente nuevo. 
	--I tiene la info correspondiente del cliente nuevo
	--Excepciones: salir}
	begin
		null;
	end pedirDatosAltaClientes;
	
	
	
	procedure pedirDatosAltaVehiculos(pat: out tipoClaveAuto; i: out infoVehiculos; l: out infoClientes; modelos: in listaModelos.tipoLista; clientes: in arbolClientes.tipoArbol; vehiculo: in arbolVehiculos.tipoArbol) is
	--Ingresa y valida los datos para cargar un vehículo nuevo
	--PRE: modelos = M, clientes = C, vehiculos = V
	--POS: patente = P, i = I, l = L. 
	--P tiene una patente válida. 
	--I tiene la info del vehículo nuevo. 
	-- tiene la info del dueño del vehículo
	--Excepciones: salir}
	begin
		null;
	end pedirDatosAltaVehiculos;
	
	
	procedure pedirDatosAltaServicio(clientes: in arbolClientes.tipoArbol; vehiculos: in arbolVehiculos.tipoArbol; modelos: in listaModelos.tipoLista; pat: out tipoClaveAuto; j: out infoListaMant; etapa: out tipoClaveCalendario; lista: out listaVehiculos.tipoLista) is
	--Ingresa y valida los datos de un servicio realizado en un vehiculo
	--PRE: clientes = C, vehiculos = V, modelos = M
	--POS: pat = P, lista = L, etapa = E
	--L tiene la lista de vehículos registrado del cliente. 
	--P tiene una patente válida.
	--E es una etapa válida para el modelo de vehículo.
	--Excepciones: salir}
		iClien: infoClientes;
		iVehi: infoVehiculos;
	begin
		null;
	end pedirDatosAltaServicio;
	
	
	
	procedure pedirDatosModeloExistente(modelos: in listaModelos.tipoLista; cod: out integer; i: out infoModelos) is
	--Ingresa un código existente al usuario
	--PRE: modelos = M
	--POS: cod = C, i = I. C es un código que existe en la lista de modelos. 
	--I es su info.
	--Excepciones: salir}
		OK: boolean;
	begin
		null;
	end pedirDatosModeloExistente;
	
	
	procedure pedirDatosEtapaExistente(modelos: in listaModelos.tipoLista; cod: out integer; etapa: out tipoClaveCalendario) is
	--Ingresa y valida una etapa de mantenimiento de un modelo
	--PRE: modelos = M
	--POS: cod = C, etapa = E. C es un código de modelo y E es una etapa de --mantenimiento del modelo C
	--Excepciones: salir}
		OK: boolean;
		i: infoModelos;
		iEtapa: float;
	begin
		null;
	end pedirDatosEtapaExistente;
	
	
	
	
	procedure pedirDatosClienteExistente(clientes: in arbolClientes.tipoArbol; DNI: out tipoClaveClientes; i: out infoClientes) is
	--Ingresa datos de un cliente a existente
	--PRE: clientes = C.
	--POS: DNI = D. D es el DNI de un cliente a eliminar
	--Excepciones: salir}
		OK: boolean;
	begin
		null;
	end pedirDatosClienteExistente;
	
	
	procedure pedirDatosVehiculosExistente(vehiculos: in arbolVehiculos.tipoArbol; pat: out tipoClaveAuto; i: out infoVehiculos) is
	--Ingresa datos de un vehículo existente
	--PRE: vehiculos = V
	--POS: pat = P, i = I. P es una patente existente. I es su info
	--Excepciones: salir}
		OK: boolean;
	begin
		null;
	end pedirDatosVehiculosExistente;
	
	
	
	procedure pedirDatosServicioExistente(vehiculos: in arbolVehiculos.tipoArbol; modelos: in listaModelos.tipoLista; pat: out tipoClaveAuto; info: out infoVehiculos; etapa: out tipoClaveCalendario) is
	--Ingresa los datos de una etapa de mantenimiento existente
	--PRE: vehiculos = V, modelos = M
	--POS: pat = P, info = I, etapa = E.
	--P es la patente del vehículo a eliminar la etapa
	--I es su info.
	--E es la etapa de mantenimiento a eliminar
	--Excepciones: salir}
		i: infoListaMant;
		iEtapa: float;
	begin
		null;
	end pedirDatosServicioExistente;
	
	
	
	procedure mostrarMantClientes(vehiculos: in arbolVehiculos.tipoArbol; i: in infoClientes) is
	--Muestra los mantenimientos de los vehículos de un cliente
	--PRE: vehiculos = V, i = I. I es la info del cliente
	--POS: -
	--Excepciones: }
	
		pat: tipoClaveAuto;
		OK, tieneMant: boolean;
		j: infoVehiculos;
		
	begin
		null;
	exception
		when listaVehiculos.listaVacia => put_line("El cliente no solicitó ningún servicio");
	end mostrarMantClientes;
	
	
	procedure pedirDatosModifModelos(modelos: in listaModelos.tipoLista; cod: out integer; i: out infoModelos) is
	--Ingresa los datos para modificar un modelo
	--PRE: modelos = M
	--POS: cod = C, i = I. C es el código del modelo a modificar. I es su info
	--Excepciones: salir}
	begin
		null;
	end pedirDatosModifModelos;
	
	
	
	procedure pedirDatosModifEtapas(modelos: listaModelos.tipoLista; etapa: out tipoClaveCalendario; iEtapa: out float; info: out infoModelos) is
	--Ingresa los datos para modificar una etapa de mantenimiento de un modelo
	--PRE: modelos = M
	--POS: etapa = E, iEtapa = I, i = M.
	--E es la etapa de modificar.
	--I es la info de la etapa (precio base)
	--M es la info del modelo.
	--Excepciones: salir}
	begin
		null;
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
		null;
	end pedirDatosModifClientes;
	
	
	
	procedure pedirDatosModifVehiculos(clientes: in arbolClientes.tipoArbol; modelos: listaModelos.tipoLista; datos: in out infoVehiculos; pat: in tipoClaveAuto; salida: out boolean) is
	--Ingresa los datos para modificar un vehículo
	--PRE: clientes = C, modelos = M, datos = D, pat = P.
	--POS: datos = D1, salida = S.
	--D1 es la info nueva del vehículo
	--S es un valor de salida
	--Excepciones: salir}
	begin
		null;
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
		null;
	end pedirDatosModifServicio;
	
	
	
	procedure mostrarMantModelo(vehiculos: in arbolVehiculos.tipoArbol; cod: in integer) is
	--Muestra los mantenimientos de los vehículos de un modelo
	--PRE: vehiculos = V, cod = C
	--POS: -
	--Excepciones: salir }
		qVehiculos: arbolVehiculos.ColaRecorridos.tipoCola;
		pat: tipoClaveAuto;
		i: infoVehiculos;
	begin
		null;
	exception
		when arbolVehiculos.errorEnCola => raise salir;
	end mostrarMantModelo;
	
	
	
	procedure conseguirClientesSinMant(clientes: in arbolClientes.tipoArbol; q:in arbolClientes.ColaRecorridos.tipoCola) is
	--Devuelve en una cola los clientes que no haya solicitado mantenimiento en alguno de sus vehículos registrados
	--PRE: clientes = C
	--POS: q = Q. Q tiene los DNI de los clientes que no solicitaron al menos un mantenimiento en alguno de sus vehículos
	--Excepciones: salir}
		qAux: arbolClientes.ColaRecorridos.tipoCola;
		DNI: tipoClaveClientes;
		i: infoClientes;
	begin
		null;
	exception
		when arbolClientes.errorEnCola => raise salir;
	end conseguirClientesSinMant;
	
	
	procedure mostrarDatosClientes(clientes: in arbolClientes.tipoArbol; q: in arbolClientes.ColaRecorridos.tipoCola) is
	--Muestra los datos de los clientes de la cola
	--PRE: clientes = C, q = Q. Q tiene los DNI de los clientes a mostrar
	--POS: -
	--Excepciones: }
		DNI: tipoClaveClientes;
		i: infoClientes;
	begin
		null;
	end mostrarDatosClientes;
	
	
	
	
	
	
	
	
	
	
	
	
----------------------------------------------------------------------
--NIVEL 2	
	procedure mostrarMenuABM is
	--Muestra menú de Altas, Bajas y Modificaciones
	--PRE: -
	--POS: -
	--Excepciones: -}
	begin
		put_line("1. Modelos");
		put_line("2. Etapas");
		put_line("3. Clientes");
		put_line("4. Vehículos de un cliente");
		put_line("5. Servicios realizados sobre un vehículo");
		put_line("6. Salir");
	end mostrarMenuABM;
	
	
	
	procedure mostrarMenuConsultas is
	--Muestra menú de Consultas
	--PRE: -
	--POS: -
	--Excepciones: -}
	begin
		put_line("1. Mantenimientos de un cliente");
		put_line("2. Mantenimientos por modelo");
		put_line("3. Datos de clientes sin mantenimientos realizados");
		put_line("4. Salir");
	end mostrarMenuConsultas;
	
	
	procedure altaModelo(modelos: in out listaModelos.tipoLista) is
	--QH: Añade un nuevo modelo.
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
		when salir => put_line("No se completó la operación");
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
		when salir => put_line("No se completó la operación");
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
		when salir => put_line("No se completó la operación");
	end altaClientes;
	
	
	
	procedure altaVehiculos(vehiculos: in out arbolVehiculos.tipoArbol; clientes: in out arbolClientes.tipoArbol; modelos: in listaModelos.tipoLista) is
	--QH: Ingresa un nuevo vehículo y lo asocia con su dueño
	--PRE: vehiculos = V, modelos = M, clientes = C
	--POST: vehiculos = V1. V1 tiene un nuevo vehículo. La lista del nodo de C que corresponde al cliente ingresado tiene un elemento nuevo
	--EXC: -
		pat: tipoClaveAuto;
		i: infoVehiculos;
		l: infoClientes;
	begin
		pedirDatosAltaVehiculos(pat, i, l, modelos, clientes, vehiculos);
		
		insertar(vehiculos, pat, i);
		
		insertar(l.vehiculos, pat, false);
		
		--Agrega un nuevo vehículo a lista lista de vehículos del cliente
		--(Sin servicios realizados)
	exception
		when listaVehiculos.listaLlena => put_line("No se pudo ingresar nuevo vehículo");
		when arbolVehiculos.arbolLleno => put_line("No se pudo ingresar nuevo vehículo");
		when listaVehiculos.claveExiste => put_line("Servicio ya existe");
		when salir => put_line("No se completó la operación");
	end altaVehiculos;
		
		
	
	procedure altaServicios(clientes: in arbolClientes.tipoArbol; vehiculos: in out arbolVehiculos.tipoArbol; modelos: in listaModelos.tipoLista) is
	--Ingresa un servicio nuevo a un vehículo
	--PRE: clientes = C, vehiculos = V, modelos = M
	--POS: clientes = C1, vehiculos = V1.
	--La lista de mantenimiento del vehículo ingresado de V1 tiene un nodo nuevo.
	--El nodo correspondiente al vehículo ingresado en la lista de vehículos del cliente ingresado indica que se le realizó un servicio
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
		
		--Si el vehículo no tiene servicios registrados (tieneMant = F)
		--Se indica que tiene por lo menos uno
		
	exception
		when listaVehiculos.listaLlena => put_line("No se pudo agregar el servicio de la etapa ingresada");
		when listaVehiculos.claveExiste => put_line("Servicio ya existe");
		when salir => put_line("No se completó la operación");
	end altaServicios;
	
	
	
	procedure bajaModelo(modelos: in out listaModelos.tipoLista; cliente: in out arbolClientes.tipoArbol; vehiculo: in out arbolVehiculos.tipoArbol) is
	--Elimina un modelo registrado
	--PRE: modelos = M, clientes = C, vehiculos = V
	--POS: modelos = M1, clientes = C1, vehiculos = V1.
	--M1 tiene un elemento menos
	--Las listas de los clientes de C1 no tienen vehículos del modelo ingresado.
	--V1 no tiene vehículos del modelo ingresado
	--Excepciones:	-
		cod: integer;
		i: infoModelos;
	begin
		pedirDatosModeloExistente(modelos, cod, i);
		
		--eliminaVehiculosModelo(clientes, arbol, col);
		
		vaciar(i.calendario);
		suprimir(modelos,cod);
	exception
		when salir => put_line("No se completó la operación");
	end bajaModelo;
	
	
	procedure bajaEtapas(modelos: in out listaModelos.tipoLista; vehiculos: in out arbolVehiculos.tipoArbol) is
	--Elimina una etapa de mantenimiento del calendario de un modelo
	--PRE: modelos = M
	--POS: modelos = M1. La lista de calendario correspondiente al código de modelo ingresado tiene un elemento menos
	--Excepciones:	-
		cod: integer;
		etapa: tipoClaveCalendario;
		i: infoModelos;
	begin
		pedirDatosEtapaExistente(modelos, cod, etapa);
		
		--eliminarServiciosEtapa(vehiculos, cod, etapa);
		
		recuClave(modelos, cod, i);
		
		suprimir(i.calendario, etapa);
	exception
		when salir => put_line("No se completó la operación");
	end bajaEtapas;
	
	
	
	procedure bajaClientes(clientes: in out arbolClientes.tipoArbol; vehiculos: in out arbolVehiculos.tipoArbol) is
	--Elimina un cliente
	--PRE: clientes = C, vehiculos = V
	--POS: clientes = C1, vehiculos = V1. C1 no tiene el cliente ingresado por el usuario. V1 no tiene los vehículos registrados a nombre del cliente ingresado por el usuario
	--Excepciones:		}
		DNI: tipoClaveClientes;
		i: infoClientes;
	begin
		pedirDatosClienteExistente(clientes, DNI, i);
		
		--vaciarListaVehiculos(i.vehiculos, vehiculos);
		
		suprimir(clientes, DNI);
	exception
		when salir => put_line("No se completó la operación");
	end bajaClientes;

	
	
	procedure bajaVehiculos(clientes: in out arbolClientes.tipoArbol; vehiculos: in out arbolVehiculos.tipoArbol) is
	--Elimina un vehículo
	--PRE: clientes = C, vehiculos = V
	--POS: clientes = C1, vehiculos = V1.
	--V1 no tiene el vehículo ingresado por el usuario.
	--La lista de vehículos del cliente registrado en C1 no tiene
	--el vehículos ingresado por el usuario
	--Excepciones:		}
		pat: tipoClaveAuto;
		i: infoVehiculos;
		j: infoClientes;
	begin
		pedirDatosVehiculosExistente(vehiculos, pat, i);
		
		buscar(clientes, i.dueño, j);
		suprimir(j.vehiculos, pat);
		
		vaciar(i.mantenimientos);
		suprimir(vehiculos,pat);
	exception
		when salir => put_line("No se completó la operación");
	end bajaVehiculos;
	
	
	
	procedure bajaServicios(vehiculos: in out arbolVehiculos.tipoArbol; clientes: in out arbolClientes.tipoArbol; modelos: in listaModelos.tipoLista) is
	--Elimina un servicio realizado de un vehículo registrado
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
			buscar(clientes, i.dueño, j);
			suprimir(j.vehiculos, pat);
			insertar(j.vehiculos, pat, false);
			modificar(clientes, i.dueño, j);
		end if;
		--Si el vehículo no tiene mantenimientos registrados,
		--lo indicamos en la info de la lista de vehículos
		--de su dueño
		
		modificar(vehiculos, pat, i);
	exception
		when salir => put_line("No se completó la operación");
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
		when salir => put_line("No se completó la operación");
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
		when salir => put_line("No se completó la operación");
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
		when salir => put_line("No se completó la operación");
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
		when salir => put_line("No se completó la operación");
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
			
			--Al modifica el mantenimiento, puede ser que el vehículo
			--que se quiera modificar su lista de mantenimientos ya tenga 
			--el servicio de la etapa ingresada
		exit when(salida);
		end loop;
	exception
		when salir => put_line("No se completó la operación");
	end modServicios;
	
	
	
	procedure mantXCliente(cliente: in arbolClientes.tipoArbol; vehiculos: arbolVehiculos.tipoArbol) is
	--Muestra los mantenimientos que solicitó un cliente ingresado por usuario
	--PRE: clientes = C, vehiculos = V
	--POS: -
	--Excepciones:	--
		DNI: tipoClaveClientes;
		i: infoClientes;
	begin
		pedirDatosClienteExistente(clientes, DNI, i);
		
		mostrarMantClientes(vehiculos, i);
		
		--en i está la lista de vehículos. Nos fijamos si
		--cada vehículo tiene al menos un mant
		--(info de la lista de mant), y lo mostramos
		
	exception
		when salir => put_line("No se completó la operación");
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
		
		--buscamos en el ABB los vehículos del modelo ingresado
		--y mostramos sus mantenimientos
	exception
		when salir => put_line("No se completó la operación");
	end mantXMod;
	
	
	procedure datosClientes(clientes: in arbolClientes.tipoArbol) is
	--Muestra los datos de los clientes que no han realizado mantenimientos en alguno de sus vehículos registrados
	--PRE: clientes = C
	--POS: -
	--Excepciones: -
		qClientes: arbolClientes.ColaRecorridos.tipoCola;
	begin
		conseguirClientesSinMant(clientes, qClientes);
		
		put_line("Clientes que no registraron ningún mantenimiento en alguno de sus vehículos registrados: ");
		
		mostrarDatosClientes(clientes, qClientes);
	exception
		when salir => put_line("No se completó la operación");
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
			opc := enteroEnRango("Ingrese su opción", 1, 4);
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
   --Realiza una modificación en alguna de las estructuras
   --PRE: opc = O, clientes = C, vehiculos = V, modelos = M
   --POS: clientes = C1, vehiculos = V1, modelos = V1.
   --Se realizaron modificaciones en alguna de las estructuras (definido por usuario)
   --Excepciones: -
      opc1: Integer;
   begin
      loop
         mostrarMenuABM;
         opc1 := enteroEnRango("Ingrese su opción", 1, 6);
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
   --POS: clientes = C, vehiculos = V, modelos = M. C, V y M están vacías}
   --Excepciones: -

   begin
                 crear(clientes);
                 crear(vehiculos);
                 crear(modelos);
   end crearEstructuras;

   procedure mostrarMenuPpal is
   --Muestra menú principal
   --PRE: -
   --POS: -
   --Excepciones: -

   begin
      put_line("¿Qué desea hacer?");
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
      opc := enteroEnRango("Ingrese su opción", 1, 5);
      if(opc >= 1) and then (opc <= 3) then
         null;
         --ABM(opc, clientes, vehiculos, modelos);
      else
         if (opc = 4) then
            null;
            --Consultas(clientes, vehiculos, modelos);
         end if;
      end if;
   exit when (opc = 5);
   end loop;

end;

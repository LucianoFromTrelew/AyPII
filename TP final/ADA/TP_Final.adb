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
	begin
		null;
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
		null;
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
		null;
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
		null;
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
		null;
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
		null;
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
		null;
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
		null;
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
		null;
	exception
		when salir => put_line("No se completó la operación");
	end bajaVehiculos;
	
	
	
	procedure bajaServicios(vehiculos: in out arbolVehiculos.tipoArbol; clientes: arbolClientes.tipoArbol; modelos: in listaModelos.tipoLista) is
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
		null;
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
		null;
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
		null;
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
		null;
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
	begin
		null;
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
		null;
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
		null;
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
		null;
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
		null;
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




begin
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

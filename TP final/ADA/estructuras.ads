with arbol,
     lista,
     ada.Strings.Unbounded;
use  ada.Strings.Unbounded;



package estructuras is
   
   subtype tipoClaveAuto is Unbounded_string;
   subtype tipoClaveClientes is integer;
   subtype tipoClaveCalendario is integer;


   package listaVehiculos is new lista(tipoClaveAuto, boolean, "<", "=");
   --el logico indica si se realizo o no al menos un mantenimiento en el vehiculo

   type InfoClientes is record
      nombre:		Unbounded_string;
      apellido:	Unbounded_string;
      tel:		integer;
      email:		Unbounded_string;
      vehiculos:	listaVehiculos.tipoLista;
   end record;


   type infoListaMant is record
      kmReal:		integer;
      fecha:		integer;
      obs:		Unbounded_string;
      precio:		integer;
   end record;

   package listaMant is new lista(tipoClaveCalendario, infoListaMant, "<", "=");


   type infoVehiculos is record
      año: 			integer;
      cod:			integer;
      mantenimientos: listaMant.tipoLista;
      dueño:			tipoClaveClientes;
   end record;

   package listaCalendario is new lista(tipoClaveCalendario, float, "<", "=");
   --la info es el precio base del mantenimientos

   type infoModelos is record
      calendario: listaCalendario.tipoLista;
      nomMod:		Unbounded_string;
   end record;



   package arbolClientes is new arbol(tipoClaveClientes, InfoClientes, ">", "<", "=");


   package arbolVehiculos is new arbol (tipoClaveAuto, infoVehiculos, ">", "<", "=");


   package listaModelos is new lista(integer, infoModelos,  "<", "=");
   --clave autonumerada



   salir: exception;

end estructuras;





	

	

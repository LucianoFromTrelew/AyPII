with arbol,
     lista,
     ada.Strings.Unbounded;
use  ada.Strings.Unbounded;



package estructuras is
   
   type tipoClaveAuto is record
	letras: string(1..3);
	num: integer;
   end record;
   subtype tipoClaveClientes is Long_Long_Integer;
   subtype tipoClaveCalendario is integer;

   function patenteMayor (patA, patB: in tipoClaveAuto) return boolean;
   function patenteMenor (patA, patB: in tipoClaveAuto) return boolean;
   function patenteIgual (patA, patB: in tipoClaveAuto) return boolean;

   package listaVehiculos is new lista(tipoClaveAuto, boolean, patenteMenor, patenteIgual);
   --el logico indica si se realizo o no al menos un mantenimiento en el vehiculo

   type InfoClientes is record
      nombre:		Unbounded_string;
      apellido:	Unbounded_string;
      tel:		Long_Long_Integer;
      email:		Unbounded_string;
      vehiculos:	listaVehiculos.tipoLista;
   end record;


   type infoListaMant is record
      kmReal:		integer;
      fecha:		integer;
      obs:		Unbounded_string;
      precio:		Integer;
   end record;

   package listaMant is new lista(tipoClaveCalendario, infoListaMant, "<", "=");


   type infoVehiculos is record
      año: 			integer;
      cod:			integer;
      mantenimientos: listaMant.tipoLista;
      dueño:			tipoClaveClientes;
   end record;

   package listaCalendario is new lista(tipoClaveCalendario, Integer, "<", "=");
   --la info es el precio base del mantenimientos

   type infoModelos is record
      calendario: listaCalendario.tipoLista;
      nomMod:		Unbounded_string;
   end record;



   package arbolClientes is new arbol(tipoClaveClientes, InfoClientes, ">", "<", "=");


   package arbolVehiculos is new arbol (tipoClaveAuto, infoVehiculos, patenteMayor, patenteMenor, patenteIgual);


   package listaModelos is new lista(integer, infoModelos,  "<", "=");
   --clave autonumerada



   salir: exception;

end estructuras;





	

	

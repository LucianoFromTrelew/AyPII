with estructuras,
     utiles;
use estructuras,
    utiles;

procedure TP_Final is
   --CONSTANTES GLOBALES
   --SUBALGORITMOS NIVEL N
   --SUBAL. NIVEL N-1

   opc: integer;
   clientes:  arbolClientes.tipoArbol;
   vehiculos: arbolVehiculos.tipoArbol;
   modelos: listaModelos.tipoLista;

begin
   loop
      --crearEstructuras(clientes, vehiculos, modelos);
      --mostrarMenuPpal();
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

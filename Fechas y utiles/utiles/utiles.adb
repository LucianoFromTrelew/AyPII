with Ada.Text_IO,
     Ada.Strings.Unbounded,
     Ada.Text_IO.Unbounded_IO,
     Ada.Integer_Text_IO,
     ada.Long_Long_Integer_Text_IO,
     Ada.Float_Text_IO;

use Ada.Text_IO,
    Ada.Strings.Unbounded,
    Ada.Text_IO.Unbounded_IO,
    Ada.Integer_Text_IO,
    ada.Long_Long_Integer_Text_IO,
    Ada.Float_Text_IO;


package body utiles is


   -- Que hace: Muestra un mensaje al usuario y devuelve verdadero o falso.
   -- Precondiciones: m=M
   -- Poscondiciones: confirma = V si el usuario confirma, falso sino.
   function confirma(mensaje: in string) return boolean is
      resp:string(1..1);
   begin
      loop begin
            put_line(mensaje & " (s/n)");
            resp:=get_line;
            exit when resp="s" or resp="S" or resp="n" or resp="N";
         exception
            when CONSTRAINT_ERROR=>
               put_line("Respuesta no valida.");
         end;
      end loop;
      return resp="s" or resp="S";
   end confirma;

   -- Que hace: Muestra un mensaje al usuario y espera a que presione una tecla.
   -- Precondiciones: m = M
   -- Poscondiciones: no tiene.
   procedure continua(mensaje: in string) is
      resp: Unbounded_String;
   begin

      loop begin

            put_line(mensaje);
            resp := get_line;
            exit when (Length(resp) >= 0);
         exception
            when CONSTRAINT_ERROR => Put_Line ("Respuesta no valida");
         end;
      end loop;

	--null; -- IMPLEMENTAR
   end continua;

   -- Que hace: Muestra un mensaje al usuario y devuelve el entero ingresado.
   -- Precondiciones: m=M
   -- Poscondiciones: numeroEnt = N y N es entero.
   function numeroEnt(mensaje: in string) return integer is
           val: Integer;
           ok: Boolean;

   begin

      ok:= False;

      loop begin

            Put_Line(mensaje);
            get(val);
            Skip_Line;

            ok := True;
            exit when (ok);
      exception
            when DATA_ERROR => Skip_Line;
               put_line("Valor incorrecto");

      end;
      end loop;

      return val;

            --null; -- IMPLEMENTAR
   end numeroEnt;

   -- Que hace: Muestra un mensaje al usuario y devuelve el real ingresado.
   -- Precondiciones: m=M
   -- Poscondiciones: numeroReal = R y R es un float.
   function numeroReal(mensaje: in string) return float is
      ok: boolean;
      val: float;
         begin

            ok:= False;

            loop begin

               Put_Line(mensaje);
            get(val);
            Skip_Line;

               ok := True;
               exit when (ok);
            exception
         	when DATA_ERROR => put_line("Valor incorrecto");
               Skip_Line;
            end;

            end loop;

            return val;
      --null; -- IMPLEMENTAR
   end numeroReal;

   -- Que hace: Muestra un mensaje al usuario y devuelve el entero ingresado.
   -- Precondiciones: m=M, rangoInf= RI, rangoSup= RS
   -- Poscondiciones: enteroEnRango = N y RI <= N <= RS.
   function enteroEnRango(mensaje: in string; rangoInf, rangoSup: in integer) return integer is
      resp:integer;
   begin
      loop
         begin
            put_line(mensaje & Integer'image(rangoinf) & " y " & Integer'image(rangosup) & ": ");
            get(resp);

            exit when rangoInf <= resp and resp<=rangoSup;
         exception
            when Data_Error =>
               skip_line;
         end;
      end loop;
      skip_line;
      return resp;
   end enteroEnRango;


    -- Que hace: Muestra un mensaje al usuario y devuelve el entero ingresado.
   -- Precondiciones: m=M
   -- Poscondiciones: mayorCero = N. N>0
   function mayorCero(mensaje: in string) return integer is
      resp:integer;
   begin
      loop
         begin
            put_line(mensaje);
            get(resp);

            exit when resp > 0;
         exception
            when Data_Error =>
               skip_line;
		   when CONSTRAINT_ERROR =>
               skip_line;
         end;
      end loop;
      skip_line;
      return resp;
   end mayorCero;


    -- Que hace: Muestra un mensaje al usuario y devuelve el entero ingresado.
   -- Precondiciones: m=M
   -- Poscondiciones: mayorCero = N. N>0
   function mayorCeroLL(mensaje: in string) return Long_Long_Integer is
      resp:Long_Long_Integer;
   begin
      loop
         begin
            put_line(mensaje);
            get(resp);

            exit when resp > 0;
         exception
            when Data_Error =>
               skip_line;
		   when CONSTRAINT_ERROR =>
               skip_line;
         end;
      end loop;
      skip_line;
      return resp;
   end mayorCeroLL;

    -- Que hace: Muestra un mensaje al usuario y devuelve el entero ingresado.
   -- Precondiciones: m=M
   -- Poscondiciones: mayorCero = N. N>0
   function mayorCeroReal(mensaje: in string) return Float is
      resp:Float;
   begin
      loop
         begin
            put_line(mensaje);
            get(resp);

            exit when resp > 0.0;
         exception
            when Data_Error =>
               skip_line;
		   when CONSTRAINT_ERROR =>
               skip_line;
         end;
      end loop;
      skip_line;
      return resp;
   end mayorCeroReal;


   -- Que hace: Muestra un mensaje al usuario y devuelve el real ingresado.
   -- Precondiciones: m=M, rangoInf= RI, rangoSup= RS
   -- Poscondiciones: realEnRango = R y RI <= R <= RS.
   function realEnRango(mensaje: in string; rangoInf, rangoSup: in float) return float is
      resp:float;
        begin
            loop begin
				put_line(mensaje & Float'image(rangoInf) & " y " & Float'image(rangoSup) & ": ");
            			get(resp);

				exit when ((rangoInf <= resp) and (resp <= rangoSup));
            exception
            	when Data_Error => Skip_Line;
            end;
            end loop;
			Skip_Line;
			return resp;

      --null; -- IMPLEMENTAR
		end realEnRango;

   -- Que hace: Muestra un mensaje al usuario y devuelve una cadena ingresada.
   -- Precondiciones: m=M
   -- Poscondiciones: textoNoVacio = S y longitud(S) > 0.
   function textoNoVacio(mensaje: in string) return Unbounded_String is
		cad: Unbounded_String;
   begin
		loop begin
			put_line(mensaje);
			cad := get_line;
                        exit when (length(cad) > 0);
                end;
		end loop;

		return cad;

	--null; -- IMPLEMENTAR
   end textoNoVacio;

   -- Que hace: Limpia la pantalla.
   -- Precondiciones: no tiene.
   -- Poscondiciones: no tiene.
   procedure CLS is
   begin
      Ada.Text_IO.put(ASCII.ESC & "[2J");
   end CLS;

end utiles;

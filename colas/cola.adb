with text_IO, unchecked_Deallocation;
use text_IO;

package body cola is

   procedure free is new Unchecked_Deallocation (tipoNodo, tipoPunt);

   procedure crear (q:out tipoCola) is
   begin
      q.frente:=null;
      q.final:=null;
   end crear;


   procedure encolar (q: in out tipoCola; i: in tipoInfo) is
		aux: tipoPunt;
   begin
		aux := new tipoNodo;
		aux.all.info := i;
		If (q.final /= null) then
			aux.all.sig := q.final;
			q.final := aux;
		else
			q.frente := aux;		--cola vacia
		end if
		q.final := aux;
      --raise operacionNoImplementada;
   exception
      when STORAGE_ERROR => raise colaLlena;
   end encolar;


   procedure desencolar (q: in out tipoCola) is

   begin
	raise operacionNoImplementada;
   end desencolar;


   procedure frente(q: in tipoCola; i: out tipoInfo) is
   begin
      raise operacionNoImplementada;
   end frente;


   procedure vaciar(q:in out tipoCola) is
		ant: tipoPunt;
   begin
		While (q.frente /= null) loop
			ant := q.frente;
			a.frente := q.frente.all.sig;
			free(ant);
		end loop
		q.final := q.frente;
      --raise operacionNoImplementada;
   end vaciar;

   function esVacia(q:in tipoCola) return boolean is
   begin
      return (q.frente=null);
   end esVacia;

end cola;

package body estructuras is

	function patenteMayor (patA, patB: in tipoClaveAuto) return boolean is
	begin
		return ((patA.letras > patB.letras) and (patA.num > patB.num));
	end patenteMayor;
	
	function patenteMenor (patA, patB: in tipoClaveAuto) return boolean is
	begin

		return ((patA.letras < patB.letras) and (patA.num < patB.num));
	end patenteMenor;
	
	function patenteIgual (patA, patB: in tipoClaveAuto) return boolean is
	begin

		return ((patA.letras = patB.letras) and (patA.num = patB.num));
	end patenteIgual;
	
	
end estructuras;

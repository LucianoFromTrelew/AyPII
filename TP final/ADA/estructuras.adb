package body estructuras is

	function patenteMayor (patA, patB: in tipoClaveAuto) return boolean is
	begin
		if(patA.letras > patB.letras) then
			if(patA.num > patB.num) then
				return true;
			else
				return false;
			end if;
		else
			return false;
		end if;
	end patenteMayor;
	
	function patenteMenor (patA, patB: in tipoClaveAuto) return boolean is
	begin
		if(patA.letras < patB.letras) then
			if(patA.num < patB.num) then
				return true;
			else
				return false;
			end if;
		else
			return false;
		end if;
	end patenteMenor;
	
	function patenteIgual (patA, patB: in tipoClaveAuto) return boolean is
	begin
		if(patA.letras = patB.letras) then
			if(patA.num = patB.num) then
				return true;
			else
				return false;
			end if;
		else
			return false;
		end if;
	end patenteIgual;
	
	
end estructuras;

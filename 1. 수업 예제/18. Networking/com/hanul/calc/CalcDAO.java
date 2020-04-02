package com.hanul.calc;

public class CalcDAO {

	public void getResultDTO(CalcDTO dto) {
			if (dto.getOpcode().equals("+")){
				dto.setResult(dto.getNum1() + dto.getNum2());
			} else if (dto.getOpcode().equals("-")) {
				dto.setResult(dto.getNum1() - dto.getNum2());
			} else if (dto.getOpcode().equals("*")) {
				dto.setResult(dto.getNum1() * dto.getNum2());
			} else if (dto.getOpcode().equals("/")) {
				dto.setResult(dto.getNum1() / dto.getNum2());
			} else if (dto.getOpcode().equals("%")) {
				dto.setResult(dto.getNum1() % dto.getNum2());			}
	} // getResult()


	public int getResult(CalcDTO dto) {
		int num1 = dto.getNum1();
		int num2 = dto.getNum2();
		String opcode = dto.getOpcode();
		
		int result = 0;
		if(opcode.equals("+")) {
			result = num1 + num2;
		} else if(opcode.equals("-")) {
			result = num1 - num2;
		} else if(opcode.equals("*")) {
			result = num1 * num2;
		} else if(opcode.equals("/")) {
			result = num1 / num2;
		} else if(opcode.equals("%")) {
			result = num1 % num2;
		}
		
		return result;
	}
} // class
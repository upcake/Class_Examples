package com.hanul.study;

public class SumMachine {
	public int getSum(int num1, int num2) {
		int sum = 0;
		for(int i = num1; i <= num2; i++) {
			sum += i;
		}
		return sum;
	}
}

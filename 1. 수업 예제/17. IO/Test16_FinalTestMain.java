import com.hanul.study.FinalTestDAO;

public class Test16_FinalTestMain {
	// ○ 요구사항 및 출력 예시
	// 성적 처리 할 학생 수를 입력하세요 : x
	
	// n번 학생의 이름을 입력하세요 : xxx
	
	// n번 학생의 국어 점수를 입력하세요 : xx
	// 국어 점수의 입력 범위는 0~ 100까지 입니다!
	// n번 학생의 국어 점수를 입력하세요 : xx
	
	// n번 학생의 영어 점수를 입력하세요 : xx
	// 영어 점수의 입력 범위는 0 ~ 100까지 입니다!
	// n번 학생의 영어 점수를 입력하세요 : xx

	// n번 학생의 수학 점수를 입력하세요 : xx
	// 수학 점수의 입력 범위는 0 ~ 100까지 입니다!
	// n번 학생의 수학 점수를 입력하세요 : xx
	
	// 입력을 완료하였습니다!
	// 번호	이름	국어	영어 	수학
	//	1	xxx	xx	xx	xx
	//	2	xxx	xx	xx	xx
	//	3	xxx	xx	xx	xx
	// ====================> SungjukInput.txt 저장
	
	// SungjukInput.txt 파일의 내용을 라인 단위로 읽은 후
	// 총점과 평균을 구하고 평균의 내림차순으로 정렬 후
	// SungjukOutput.txt 저장
	// 번호	이름	국어	영어 	수학	총점	평균
	//	x	xxx	xx	xx	xx	xxx	xx.x
	//	x	xxx	xx	xx	xx	xxx	xx.x
	//	x	xxx	xx	xx	xx	xxx	xx.x
	// =============================
	// FinalTestMain.java	▶ default package
	// FinalTestDTO.java	▶ com.hanul.study package
	// FinalTestDAO.java	▶ com.hanul.study package
	public static void main(String[] args) {
		FinalTestDAO dao = new FinalTestDAO();
		dao.getScore();
		dao.inputSave();
		dao.readFile();
		dao.getSumAvg();
		dao.AvgDescSort();
		dao.outputSave();
	} // main()
} // class
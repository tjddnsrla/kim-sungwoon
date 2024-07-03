package sec06.exam06;

public class CarExample {
	public static void main(String[] args) {
       Car myCar = new Car();
		
		// 잘못된 속도 변경 setter메소드 호출 
		myCar.setSpeed(-50);
		
		System.out.println("현재 속도: " + myCar.getSpeed()); //-50
		
		//올바른 속도 변경 
		myCar.setSpeed(60);
		System.out.println("현재 속도: " + myCar.getSpeed()); //60
		
		// 멈추는 코드
		if(!myCar.isStop()) {
			myCar.setStop(true);
		}
		
		System.out.println("현재 속도: " + myCar.getSpeed()); //0
	}	
}

package exam01;

import sec06.exam04.package1.A;

public class D extends A {
    public D() {
		super(); // A의 기본생성자를 호출
		this.field = "value";	// A의 field 멤버변수
		this.method();	// A의 메소드
	}

	private void method() {
		// TODO Auto-generated method stub
		
	}
}

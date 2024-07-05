package com.bochung1;

public class StorageImpl<T> implements Storage<T> {
	// 필드
	private T[] array;

	// 생성자
	public StorageImpl(int size) {
		this.array = (T[])new Object[size];	// 객체 배열 초기화
	}
		
	// 메소드
	public void add(T item, int index) {
		array[index] = item;
	}
	
	public T get(int index) {
		return array[index];
	}
}

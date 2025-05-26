package org.zerock.cart.vo;

import java.util.List;

import lombok.Data;

@Data
public class CartVO {

	private long cart_no; //seq 사용 - cycle 순환처리:최대->1
	private long goods_no;
	private String goods_name;
	private long size_no;
	private String size_name;
	private long color_no;
	private String color_name;
	private long goods_option_no;
	private String option_name;
	private int count;
	
	// 여러개의 객체(vo) 데이터를 한꺼번에 받으려면 DS이 List로 만들어서 넘겨 준다. 그래서 필요하다.
	// Controller에서는 객체(vo)로 받는 것으로 선언하고 @ModelAttribute을 붙여 준다.
	private List<CartVO> list;
	
}

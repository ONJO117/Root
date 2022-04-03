package com.root.board.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReplyVO {

	private long rno;
	private long no;
	private String content;
	private String writer;
	private Date writeDate ;

}

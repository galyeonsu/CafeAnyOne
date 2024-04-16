package kr.co.jykjy.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
	private Long rno;
	private String content;
	private Date regDate;
	private String id;
	private Long bno;
}

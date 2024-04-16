package kr.co.jykjy.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @author kss
 * @ 리뷰 필드
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private Long rvNo;
	private String rvContent;
	private Long rvScore;
	private Date rvRegDate;
	private String id;
	private Long proNo;
}

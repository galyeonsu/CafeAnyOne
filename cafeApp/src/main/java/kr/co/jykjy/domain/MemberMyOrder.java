package kr.co.jykjy.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberMyOrder {
	private Long cartNo;
    private String proName;
    private String proPrice;
    private Date regDate;
    private String proAmt;
}
  
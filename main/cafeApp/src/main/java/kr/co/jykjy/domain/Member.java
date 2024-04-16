package kr.co.jykjy.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String gradeNO;
	private String addr;
	private Date regdate;
	private String email;
	private boolean admin;
	private Long orderNo;
	private String img;
	private String mUuid;
	private String mOrigin;
	private String mPath;
	
	public String getQs() {
		List<String> list = new ArrayList<String>();
		list.add("uuid=" + mUuid);
		list.add("origin=" + mOrigin);
		list.add("path=" + mPath);
		return String.join("&", list);
	}
	
}

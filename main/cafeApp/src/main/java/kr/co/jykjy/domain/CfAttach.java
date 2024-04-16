package kr.co.jykjy.domain;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import util.UploadUtils;

/**
 * 
 * @author kjy
 * @ 카페 첨부 필드
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CfAttach {
	private String cfUuid;
	private String cfOrigin;
	private String cfFilePath;
	private Long cafeNo;
	
	public String getQs() {
		List<String> list = new ArrayList<String>();
		list.add("uuid=" + cfUuid);
		list.add("origin=" + cfOrigin);
		list.add("path=" + cfFilePath);
		return String.join("&", list);
	}
	public File toFile() {
		return new File(UploadUtils.REPOSITORY+ "/" + cfFilePath, cfUuid);
	}
}

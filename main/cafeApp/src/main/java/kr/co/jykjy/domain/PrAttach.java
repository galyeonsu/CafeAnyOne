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
 * @author kss
 * @ 상품 이미지 필드
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PrAttach {
	private String prUuid;
	private String origin;
	private String filePath;
	private Long proNo;
	
	public String getQs() {
		List<String> list = new ArrayList<String>();
		list.add("uuid=" + prUuid);
		list.add("origin=" + origin);
		list.add("path=" + filePath);
		return String.join("&", list);
	}
	public File toFile() {
		return new File(UploadUtils.REPOSITORY+ "/" + filePath, prUuid);
	}
}

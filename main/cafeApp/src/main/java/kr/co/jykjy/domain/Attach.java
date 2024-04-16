package kr.co.jykjy.domain;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import util.UploadUtils;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Attach {
	private String uuid;
	private String origin;
	private String filePath;
	private boolean image;
	
	private Long bno;
	
	public String getQs() {
		List<String> list = new ArrayList<String>();
		list.add("uuid=" + uuid);
		list.add("origin=" + origin);
		list.add("path=" + filePath);
		return String.join("&", list);
	}
	
	// 원본 이미지 경로
	public String getUrl() {
		List<String> list = new ArrayList<String>();
		list.add("uuid=" + uuid);
		list.add("origin=" + origin);
		list.add("path=" + filePath);
		list.add("image=" + image);
		return String.join("&", list);
	}
	
	// 섬네일 이미지 경로
	public String getThumb() {
		if(!image) return "";
		List<String> list = new ArrayList<String>();
		list.add("uuid=s_" + uuid);
		list.add("origin=" + origin);
		list.add("path=" + filePath);
		return String.join("&", list);
	}
	public File toFile() {
		return toFile(false);
	}
	public File toFile(boolean thumb) {
		File file = new File(UploadUtils.REPOSITORY + "/" + filePath, uuid);
		//file = new File(file, (thumb ? "s_" : "") + uuid + "_"  + origin);
		return file;
	}
}

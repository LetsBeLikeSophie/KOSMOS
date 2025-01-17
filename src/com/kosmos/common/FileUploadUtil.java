package com.kosmos.common;

import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;

public class FileUploadUtil {
	
	private String imgfilePaths;
	private int imgfileSize; 
	private String encodeType;	
	private MultipartRequest mr;;

	public FileUploadUtil(String imgfilePaths, int imgfileSize, String encodeType) {
		this.imgfilePaths = imgfilePaths;
		this.imgfileSize = imgfileSize;
		this.encodeType = encodeType;		
	}
	
	public boolean imgfileUpload(HttpServletRequest req) {		
		boolean bool = imgfileUpload(req, imgfilePaths);		
		return bool;
	}
	
	public boolean imgfileUploadSize(HttpServletRequest req) {		
		boolean bool = imgfileUploadSize(req, imgfilePaths);		
		return bool;
	}

	public boolean imgfileUpload(HttpServletRequest req, String filePath) {
		boolean bool = false;
		try {
			mr = new MultipartRequest(req, filePath, imgfileSize, encodeType, new FileRename());
			System.out.println("mr >>> : " + mr);
			bool=true;
		}catch(Exception e) {
			System.out.println("imgfileUploadUtil.imgfileUpload() >>> : " + mr);			
		}		
		return bool;
	}
	
	public boolean imgfileUploadSize(HttpServletRequest req, String filePath) {
		boolean bool = false;
		try {
			mr = new MultipartRequest(req, filePath, imgfileSize, encodeType, new FileRename());
			System.out.println("mr >>> : " + mr);
			System.out.println("mr.getOriginalFileName(\"bo_file\") >>> : " + mr.getOriginalFileName("bo_file"));
			System.out.println("mr.getFilesystemName(\"bo_file\") >>> : " + mr.getFilesystemName("bo_file"));
			
			ThumnailImg.thumnailFun(filePath, mr.getFilesystemName("bo_file"));	
			bool=true;						
		}catch(Exception e) {
			System.out.println("imgfileUploadUtil.imgfileUpload() >>> : " + mr);			
		}		
		return bool;
	}

// 파라미터	
	// 파라미터 하나
	public String getParameter(String s){
		return mr.getParameter(s);
	}
	
	// 파라미터 여러 개
	public String[] getParameterValues(String s){
		return mr.getParameterValues(s);		
	}
	
// 파일명	
	// 파일명 하나
	public String getFileName(String f){
		return mr.getFilesystemName(f);
	}
	
	// 파일명 여러 개
	public ArrayList<String> getFileNames(){
		@SuppressWarnings("unchecked")
		Enumeration<String> en = mr.getFileNames();
		ArrayList<String> a = new ArrayList<String>();
		
		while (en.hasMoreElements()){
			String f = en.nextElement().toString();
			a.add(mr.getFilesystemName(f));
		}		
		return a;
	}
}


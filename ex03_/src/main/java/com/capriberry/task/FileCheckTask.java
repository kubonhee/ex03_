package com.capriberry.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.capriberry.controller.UploadController;
import com.capriberry.domain.BoardAttachVO;
import com.capriberry.mapper.BoardAttachMapper;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class FileCheckTask {
	@Autowired
	private BoardAttachMapper mapper;
	
	
	@Scheduled(cron="0 30 9 * * *")
	public void checkFiles() {
		log.warn("file check task run .................");
		log.warn("==============================================");
		
		List<BoardAttachVO> fileList = mapper.getOldFiles();
		if(fileList == null || fileList.size() == 0) return;
		
		log.warn("==============================================");
		fileList.forEach(log::warn);
		List<Path> fileListPaths = fileList.stream().map(
				vo -> Paths.get(UploadController.UPLOAD_PATH, vo.getDownPath())).collect(Collectors.toList());
		fileList.stream().filter(vo-> vo.isImage()).map(
				vo -> Paths.get(UploadController.UPLOAD_PATH, vo.getThumbPath())).forEach(fileListPaths::add);
		log.warn("==============================================");
		fileListPaths.forEach(log::warn);
		File targetDir = Paths.get(UploadController.UPLOAD_PATH, fileList.get(0).getUploadPath()).toFile();
		log.info(targetDir);
		List<File> removeFiles = Arrays.asList(targetDir.listFiles(file -> !fileListPaths.contains(file.toPath())));
		removeFiles.forEach(file -> {
			log.warn("========================= 삭제될 파일 =========================");
			log.warn(file.getAbsolutePath());
			file.delete();	
		});
	}
	
	
}

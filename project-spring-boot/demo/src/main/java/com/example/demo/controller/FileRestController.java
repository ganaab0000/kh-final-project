package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.example.demo.domain.dto.UploadFileDTO;
import com.example.demo.repository.UploadFileRepository;
import com.example.demo.service.FileStorageService;
import com.example.demo.util.LogUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class FileRestController {

	@Autowired
	private FileStorageService fileStorageService;
	@Autowired
	private UploadFileRepository uploadFileInfoRepository;
	@Autowired
    private LogUtil logUtil;

	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@PostMapping("/api/file")
	public Map<String,String> uploadFile(@RequestParam MultipartFile file, HttpServletRequest request) {
		logUtil.defaultLog(request);
		String fileType = file.getContentType();
		if (!fileType.contains("image")) {
			throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "upload only image file : " + fileType);
		}
		int id = uploadFileInfoRepository.getNextId();
		String fileName = fileStorageService.storeFile(file, id + "_" + file.getOriginalFilename());
		String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath().path("/api").path("/file/")
				.path(fileName).toUriString();
		System.out.println(fileDownloadUri);
		UploadFileDTO uploadFile = new UploadFileDTO();
		uploadFile.setId(id);
		uploadFile.setUploadName(file.getOriginalFilename());
		uploadFile.setSaveName(fileName);
		uploadFile.setFileType(fileType);
		uploadFile.setFileSize(file.getSize());
		uploadFile.setMemberId(0);// ?
		uploadFile.setFileType(file.getContentType());

		uploadFileInfoRepository.saveWithId(uploadFile);
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("uploaded", "true");
		resultMap.put("id", ""+id);//ck test
		resultMap.put("url", "/api/file/"+id);
		resultMap.put("fileName", uploadFile.getSaveName());
		return resultMap;
	}

	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@PostMapping("/api/ckfile")
	public Map<String,String> uploadCkFile(@RequestParam MultipartFile upload, HttpServletRequest request) {
		logUtil.defaultLog(request);
		return uploadFile(upload, request);
	}

    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @PostMapping("/api/multiplefiles")
    public List<Map<String,String>> uploadMultipleFiles(@RequestParam("files") MultipartFile[] files, HttpServletRequest request) {
        return Arrays.asList(files)
                .stream()
                .map(file -> uploadFile(file, request))
                .collect(Collectors.toList());
    }


	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@GetMapping("/api/file/{id}")
	public ResponseEntity<Resource> downloadFile(@PathVariable int id, HttpServletRequest request) {
		logUtil.defaultLog(request);
		Optional<UploadFileDTO> file = uploadFileInfoRepository.findById(id);
		if (!file.isPresent()) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "entity not found");
		}
		UploadFileDTO filedto = file.get();
		Resource resource = fileStorageService.loadFileAsResource(filedto.getSaveName());

		String contentType = null;
		try {
			contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
		} catch (IOException ex) {
			log.info("Could not determine file type.");
		}

		if (contentType == null) {
			contentType = "application/octet-stream";
		}

		return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
				.body(resource);
	}
}

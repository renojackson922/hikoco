package org.silkdog.maven.simpleboard.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

@Controller
@CrossOrigin
@RequestMapping("/imageUpload")
public class ImageUploadController {

    @PostMapping
    public void imageUpload(MultipartHttpServletRequest req,
                            HttpServletResponse resp,
                            MultipartFile file) throws IOException {

        /** 국제시간을 고려해서 UTC로 수정할 것. */
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String today = dtf.format(now);

        String realFolder = req.getSession().getServletContext().getRealPath("imgs_uploaded");
        UUID uuid = UUID.randomUUID();

        String filepath = realFolder + "/" + today;

        File dir = new File(filepath);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        String org_filename = uuid + file.getOriginalFilename();
        byte[] bytes = file.getBytes();
        File f = new File(filepath, org_filename);
        FileCopyUtils.copy(bytes, f);

        resp.setContentType("text/html;charset=utf-8");
        /* 게시했을때 절대주소를 고려하면 됨. */
        resp.getWriter().write("/imgs_uploaded/"  + today + "/" + org_filename);
    }
}

/**

{
//        PrintWriter out = resp.getWriter();
//        업로드할 폴더 경로
//        String realFolder = req.getSession().getServletContext().getRealPath("profileUpload");
        UUID uuid = UUID.randomUUID();

        // 업로드할 파일 이름
        String org_filename = file.getOriginalFilename();
        String str_filename = uuid.toString() + org_filename;

//        System.out.println("원본 파일명 : " + org_filename);
//        System.out.println("저장할 파일명 : " + str_filename);

        String filePath = "/Users/aikocandy/imgs/";

//        String filePath = realFolder + "/" + email + "/" + str_filename;
//        System.out.println("파일경로 : " + filePath);

        File f = new File(filePath);
        if (!f.exists()) {
        f.mkdirs();
        }
        file.transferTo(f);

        resp.setContentType("text/html;charset=utf-8");
        resp.getWriter().write(filePath);
//        out.println("profileUpload/"+email+"/"+str_filename);
//        out.close();
        }



*/
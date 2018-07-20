package org.silkdog.maven.hikoco.member.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
    private MultipartFile imgFile;

    public MultipartFile getImgFile() {
        return imgFile;
    }

    public void setImgFile(MultipartFile imgFile) {
        this.imgFile = imgFile;
    }
}

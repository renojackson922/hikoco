package org.silkdog.maven.hikoco.member.vo;

import java.util.ArrayList;
import java.util.List;

public class MultiFileVO {
    private List<FileVO> files = new ArrayList<FileVO>();

    public MultiFileVO(){
        files.add(new FileVO());
        files.add(new FileVO());
        files.add(new FileVO());
    }

    public List<FileVO> getFiles() {
        return files;
    }

    public void setFiles(List<FileVO> files) {
        this.files = files;
    }
}

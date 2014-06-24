package com.lumesse.dto;

public class RestResponseDTO {

	private final String content;

    public RestResponseDTO(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

}

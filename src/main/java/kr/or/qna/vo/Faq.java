package kr.or.qna.vo;

import lombok.Data;

@Data
public class Faq {
	private int faqNo;
	private String faqQ;
	private String faqA;
	private int category;
}

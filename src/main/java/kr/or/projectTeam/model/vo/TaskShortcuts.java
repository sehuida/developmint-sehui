package kr.or.projectTeam.model.vo;

import lombok.Data;

@Data
public class TaskShortcuts {
	private int taskShortcutNo;
	private int projectNo;
	private int taskNo;
	private String tsLinkAddr;
	private String tsLinkName;
}

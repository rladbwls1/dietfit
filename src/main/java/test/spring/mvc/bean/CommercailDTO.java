package test.spring.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@Data
public class CommercailDTO  {
	private int num;			// ����
	private String comname;		// �����
	private String companyid;	// ȸ�� ���̵�
	private String comfile;		// ���� �̹��� �̸�
	private int admincheck;		// ������ ���� ����
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startdate;		// ���� ����
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date enddate;		// ���� ����
	private String imagePath;   // �̹��� ��� 
}

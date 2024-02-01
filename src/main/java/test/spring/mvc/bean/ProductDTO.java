package test.spring.mvc.bean;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProductDTO {
	private int num; 		// ��ȣ
	private String boardname;	// �Խñ۸�
	private String companyid;	// ��üID
	private String category;	// ī�װ� �Һз� 
	private String category2;	// ���ǹ�ȣ 2�ڸ�
	private String flavor;		// �� �з�
	private String detail;		// �󼼼���
	private int isfile;			// ���� ����
	private String delivery;	// �������
	private Date reg;			// ��ϳ�¥
	private int count;			// ��ȸ��
	private String product;		// ��ǰ��
	private int stock;			// ����
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date expiry;		// �������
	private String price;		// ����
	private String imagePath;   // �̹��� ��� 
	private int sale; // ������
	private List<ProductimgDTO> images; // �̹��� ����Ʈ
	
	private ProductimgDTO pimg;
	private ProductinfoDTO productinfo;
}

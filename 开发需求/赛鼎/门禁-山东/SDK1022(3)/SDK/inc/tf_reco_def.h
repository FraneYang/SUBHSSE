#ifndef TF_RECO_DEF_H
#define TF_RECO_DEF_H
//��ѯTF�����ļ���
struct RecordFolders
{
	char FolderNames[1024][128];
	RecordFolders(){
		memset(this, 0, sizeof(RecordFolders));
	}
};

struct RecordFileNames
{
	//ÿ�λص�100������
	char Recordfiles[100][128]; 
	RecordFileNames(){
		memset(this, 0, sizeof(RecordFileNames));
	}
};

struct tfRecordData
{
	int nYear;
	int nMonth;
	int nDay;
	tfRecordData(){
		memset(this, 0, sizeof(tfRecordData));
	}
};

struct RecordImg
{
	unsigned char img_normal[655360];  //ץ��Сͼ
	int  len_img_normal;  //ͼƬ����
	unsigned char img_big[655360];  //��ͼ����
	int len_img_big;  //��ͼ����
	RecordImg(){
		memset(this, 0, sizeof(RecordImg));
	}
};

//���̷�������
struct tf_devParts
{
	int partstate;   // ����״̬:1=δ��ʽ��,2=δ����,3=���ڸ�ʽ��,4=����ɾ��,5=��������,6=ֻ��
	char partname[128];   // ���̷�����
	int total;			// ������С(MB)
	int left;			// ����ʣ��ռ�(MB)
	int used;			// // ����ʹ�ÿռ�(MB)
	tf_devParts(){
		memset(this, 0, sizeof(tf_devParts));
	}
};

struct tf_diskinfo
{
	char devname[128];   // ��������
	int devtotal;       //�����ܿռ� (MB)
	int devtype;      // ��������:0=SD,1=USB
	tf_devParts dev;  //���̷�������
	tf_diskinfo(){
		memset(this, 0, sizeof(tf_diskinfo));
	}
};

struct wg_special
{
	unsigned int ic_ins;						//��ӿ�����
	unsigned int ic_del;						//ɾ��������
	unsigned int face_ins;						//�����������
	unsigned int face_del;						//ɾ����������
	unsigned int sync_all;						//ͬ��������
};
#endif
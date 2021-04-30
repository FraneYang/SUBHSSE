#ifndef TF_RECO_DEF_H
#define TF_RECO_DEF_H
//查询TF卡的文件夹
struct RecordFolders
{
	char FolderNames[1024][128];
	RecordFolders(){
		memset(this, 0, sizeof(RecordFolders));
	}
};

struct RecordFileNames
{
	//每次回调100条数据
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
	unsigned char img_normal[655360];  //抓拍小图
	int  len_img_normal;  //图片长度
	unsigned char img_big[655360];  //大图数据
	int len_img_big;  //大图长度
	RecordImg(){
		memset(this, 0, sizeof(RecordImg));
	}
};

//磁盘分区数组
struct tf_devParts
{
	int partstate;   // 磁盘状态:1=未格式化,2=未挂载,3=正在格式化,4=正在删除,5=工作正常,6=只读
	char partname[128];   // 磁盘分区名
	int total;			// 分区大小(MB)
	int left;			// 分区剩余空间(MB)
	int used;			// // 分区使用空间(MB)
	tf_devParts(){
		memset(this, 0, sizeof(tf_devParts));
	}
};

struct tf_diskinfo
{
	char devname[128];   // 磁盘名称
	int devtotal;       //磁盘总空间 (MB)
	int devtype;      // 磁盘类型:0=SD,1=USB
	tf_devParts dev;  //磁盘分区数组
	tf_diskinfo(){
		memset(this, 0, sizeof(tf_diskinfo));
	}
};

struct wg_special
{
	unsigned int ic_ins;						//添加卡卡号
	unsigned int ic_del;						//删除卡卡号
	unsigned int face_ins;						//添加人脸卡号
	unsigned int face_del;						//删除人脸卡号
	unsigned int sync_all;						//同步卡卡号
};
#endif
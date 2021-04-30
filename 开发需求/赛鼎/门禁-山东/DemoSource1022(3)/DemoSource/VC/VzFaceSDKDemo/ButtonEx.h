#pragma once


// CButtonEx
#define  WM_BN_CLICK  WM_USER + 100
class CButtonEx : public CButton
{
	DECLARE_DYNAMIC(CButtonEx)

public:
	CButtonEx();
	virtual ~CButtonEx();
	void OnBnClicked();
	CButtonEx(int nItem, int nSubItem,int index, CRect rect, HWND hParent, void * pData);
public:
	int m_index;
	int m_inItem;           //所属listctrl的行
	int m_inSubItem;        //所属listctrl的列
	CRect m_rect;           //按钮所在的位置
	HWND m_hParent;         //按钮的父窗口
	BOOL bEnable;
	void * m_pData;         //按钮带的用户自定义数据
	DECLARE_MESSAGE_MAP()
};



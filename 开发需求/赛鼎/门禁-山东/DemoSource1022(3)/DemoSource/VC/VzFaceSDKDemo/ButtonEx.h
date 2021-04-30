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
	int m_inItem;           //����listctrl����
	int m_inSubItem;        //����listctrl����
	CRect m_rect;           //��ť���ڵ�λ��
	HWND m_hParent;         //��ť�ĸ�����
	BOOL bEnable;
	void * m_pData;         //��ť�����û��Զ�������
	DECLARE_MESSAGE_MAP()
};



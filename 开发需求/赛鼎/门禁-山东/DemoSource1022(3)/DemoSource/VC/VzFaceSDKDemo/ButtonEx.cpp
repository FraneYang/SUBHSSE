// ButtonEx.cpp : 实现文件
//

#include "stdafx.h"
#include "ButtonEx.h"


// CButtonEx

IMPLEMENT_DYNAMIC(CButtonEx, CButton)

CButtonEx::CButtonEx(int nItem, int nSubItem,int index, CRect rect, HWND hParent, void * pData)
{
	m_index = index;
	m_inItem = nItem;
	m_inSubItem = nSubItem;
	m_hParent = hParent;
	bEnable = TRUE;
	m_pData = pData;
}

CButtonEx::~CButtonEx()
{
}


BEGIN_MESSAGE_MAP(CButtonEx, CButton)
	ON_CONTROL_REFLECT(BN_CLICKED, &CButtonEx::OnBnClicked)
END_MESSAGE_MAP()



// CButtonEx 消息处理程序
void CButtonEx::OnBnClicked()
{
	// TODO: 在此添加控件通知处理程序代码
	if (m_index==-1)
	{
		::SendMessage(m_hParent, WM_BN_CLICK, m_inItem, m_inSubItem);   //
	}
	else
	{
		::SendMessage(m_hParent, WM_BN_CLICK, m_inItem, m_index);   //
	}
}


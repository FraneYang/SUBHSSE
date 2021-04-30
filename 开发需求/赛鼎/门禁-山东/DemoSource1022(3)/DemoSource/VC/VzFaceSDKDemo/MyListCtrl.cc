
// MyListCtrl1.cpp : implementation file

#include "stdafx.h"
#include "MyListCtrl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CExArray
/**************************************
*	函数名称：Add(CELLVALUE& cell)
*	函数类型：void
*	参数说明：CELLVALUE& cell:CELLVALUE的结构体的引用
*	函数功能：添加CELLVALUE结构到CExArray类中，它的内存大小会动态的增加和减小
**************************************/
template <class T>
void CExArray<T>::Add(T& cell)
{
	T* pCell = GetAt(cell.dwRow, cell.dwCol);
	if (pCell != NULL)
	{
		memcpy(pCell, &cell, sizeof(T));
		return;
	}
	//////////////////////////////
	if (m_dwCurCount >= m_dwSize)
	{
		T *pTmp1, *pTmp2;
		pTmp1 = m_pVal;
		m_dwSize += 10;
		pTmp2 = new T[m_dwSize];
		memcpy(pTmp2, m_pVal, sizeof(T) * m_dwCurCount);
		m_pVal = pTmp2;
		delete[] pTmp1;
	}
	////////////////////////////
	memcpy(&m_pVal[m_dwCurCount], &cell, sizeof(T));
	m_dwCurCount++;
}

template <class T>
void CExArray<T>::DelAll()
{
	m_dwCurCount = 0;
	if (m_pVal != NULL)
	{
		delete[] m_pVal;
		m_pVal = NULL;
	}
	m_pVal = new T[10];
	m_dwSize = 10;
}

template<class T>
void CExArray<T>::DelAt(DWORD dwRow, DWORD dwCol)
{
	for (int i = 0; (DWORD)i < m_dwCurCount; i++)
	{
		if (m_pVal[i].dwCol == dwCol && m_pVal[i].dwRow == dwRow)
		{
			for (int j = i; (DWORD)j < m_dwCurCount - 1; j++)
			{
				m_pVal[j] = m_pVal[j + 1];
			}
			m_dwCurCount--;
			break;
		}
	}
	// 动态减小内存
	if (m_dwCurCount <= (m_dwSize - 10))
	{
		T *pTmp1, *pTmp2;
		pTmp1 = m_pVal;
		m_dwSize -= 10;
		pTmp2 = new T[m_dwSize];
		memcpy(pTmp2, m_pVal, sizeof(T) * m_dwCurCount);
		m_pVal = pTmp2;
		delete[] pTmp1;		
	}
}

template<class T>
BOOL CExArray<T>::GetAt(DWORD dwRow, DWORD dwCol, T& cell)
{
	for (int i = 0; (DWORD)i < m_dwCurCount; i++)
	{
		if (m_pVal[i].dwCol == dwCol && m_pVal[i].dwRow == dwRow)
		{
			cell = m_pVal[i];
			return TRUE;
		}
	}
	return FALSE;
}

template<class T>
BOOL CExArray<T>::GetAt(DWORD dwIndex, T& cell)
{
	if (dwIndex >= 0 && dwIndex < m_dwCurCount)
	{
		cell = m_pVal[dwIndex];
		return TRUE;
	}
	return FALSE;
}

template<class T>
T* CExArray<T>::GetAt(DWORD dwIndex)
{
	if (dwIndex >= 0 && dwIndex < m_dwCurCount)
	{
		return (m_pVal + dwIndex);
	}
	return NULL;
}

template<class T>
T* CExArray<T>::GetAt(DWORD dwRow, DWORD dwCol)
{
	for (int i = 0; (DWORD)i < m_dwCurCount; i++)
	{
		if (m_pVal[i].dwCol == dwCol && m_pVal[i].dwRow == dwRow)
		{
			return (m_pVal + i);
		}
	}
	return NULL;
}

template<class T>
int CExArray<T>::GetCount()
{
	return m_dwCurCount;
}

/////////////////////////////////////////////////////////////////////////////
// CMyListCtrl

CMyListCtrl::CMyListCtrl()
{
	m_pComboKillFocus = NULL;
	m_pItemDblClk = NULL;
	//////////////////
	m_pCV = NULL;
	m_pCombo = NULL;
	m_pEdit = NULL;
	m_pFont = NULL;
	m_nRowHeight = 0;
	m_pCmbFont = NULL;
	m_pItemFont = NULL;
	m_nFont = 0;
	m_nFontSize = 0;
	/////////////////////
	m_bLineSelectBkColor = TRUE;
	m_bLineSelectedMode = FALSE;
	m_bLineSelected = FALSE;
	m_nCurSelected = -1;
	m_nCurSelCol = -1;
	m_nPrevSelected = -1;
	/////////////////////
	m_nCurItemChange = 0;
	m_bColSelectedMode = FALSE;


	m_uID = 0;
	font.CreatePointFont(100, "宋体");
}

void CMyListCtrl::createItemButton(int nItem, int nSubItem, HWND hMain, LPCTSTR lpszCaption, void * pData, int nID1, int nID2)
{
	CRect rect;
	/*if( !EnsureVisible(nItem, TRUE))
	return ;*/
	GetSubItemRect(nItem, nSubItem, LVIR_BOUNDS, rect);
	CRect rectTmp = rect;
	rectTmp.left = rect.left + 40;
	rectTmp.bottom = rect.top + 40;
	rectTmp.top = rect.top + 20;
	rectTmp.right = rectTmp.left + 20;
	DWORD dwStyle = WS_CHILD | WS_VISIBLE |  BS_BITMAP;
	CButtonEx *pButton = new CButtonEx(nItem, nSubItem, 0, rectTmp, hMain, (void*)m_uID++);
	pButton->Create(lpszCaption, dwStyle, rectTmp, this, m_uID);
	//CDC* pDC = pButton->GetDC();
	//pDC->SetTextColor(RGB(255,0,0));
	pButton->SetFont(&font);
	HBITMAP hBmp;
	hBmp = ::LoadBitmap(AfxGetInstanceHandle(), MAKEINTRESOURCE(nID1));
	pButton->SetBitmap(hBmp);
	m_mButton.insert(make_pair(nItem, pButton));

	rectTmp.OffsetRect(40, 0);
	CButtonEx *pButtonDel = new CButtonEx(nItem, nSubItem, 1, rectTmp, hMain, (void*)m_uID++);
	pButtonDel->Create("", dwStyle, rectTmp, this, m_uID);
	//CDC* pDC = pButton->GetDC();
	//pDC->SetTextColor(RGB(255,0,0));
	pButtonDel->SetFont(&font);

	hBmp = ::LoadBitmap(AfxGetInstanceHandle(), MAKEINTRESOURCE(nID2));
	pButtonDel->SetBitmap(hBmp);
	//纵向添加用
	m_mButtonDel.insert(make_pair(nItem, pButtonDel));
}

void CMyListCtrl::createItemButton(int nItem, int nSubItem, HWND hMain, LPCTSTR lpszCaption, int type, int nID)
{
	CRect rect;
	/*if( !EnsureVisible(nItem, TRUE))
	return ;*/
	GetSubItemRect(nItem, nSubItem, LVIR_BOUNDS, rect);
	int nWith = rect.Width();
	int nHeight = rect.Height();
	CRect rectTmp = rect;
	rectTmp.left = rect.left + nWith/5;
	rectTmp.bottom = rect.bottom - nHeight / 10;
	rectTmp.top = rect.top + nHeight/10;
	rectTmp.right = rectTmp.right - nWith / 5;
	DWORD dwStyle = WS_CHILD | WS_VISIBLE |  BS_BITMAP;
	CButtonEx *pButton = new CButtonEx(nItem, nSubItem, nSubItem, rectTmp, hMain, NULL);
	CString str = lpszCaption;
	if (!str.IsEmpty())
	{
		dwStyle = WS_CHILD | WS_VISIBLE ;
	}
	pButton->Create(lpszCaption, dwStyle, rectTmp, this, m_uID++);
	//CDC* pDC = pButton->GetDC();
	//pDC->SetTextColor(RGB(255,0,0));
	pButton->SetFont(&font);
	if (nID)
	{
		HBITMAP hBmp;
		hBmp = ::LoadBitmap(AfxGetInstanceHandle(), MAKEINTRESOURCE(nID));
		pButton->SetBitmap(hBmp);
	}
	m_mButton.insert(make_pair(nItem, pButton));
	m_mSubButton.insert(make_pair(nSubItem, pButton));
}

void CMyListCtrl::release()
{
	button_map::iterator iter  = m_mButton.begin();
	while (iter  != m_mButton.end())
	{
		delete iter->second;
		iter->second  = NULL;
		iter++;
	}
	m_mButton.clear();
	iter = m_mButtonDel.begin();
	while (iter != m_mButtonDel.end())
	{
		delete iter->second;
		iter->second = NULL;
		iter++;
	}
	m_mButtonDel.clear();
}

CMyListCtrl::~CMyListCtrl()
{
	/////////////////////////
	if (m_pFont != NULL)
	{
		delete m_pFont;
		m_pFont = NULL;
	}
	/////////////////////////
	if (m_pCmbFont != NULL)
	{
		delete m_pCmbFont;
		m_pCmbFont = NULL;
	}
	/////////////////////////
	if (m_pCombo != NULL)
	{
		delete m_pCombo;
		m_pCombo = NULL;
	}
	/////////////////////////
	if (m_pEdit != NULL)
	{
		delete m_pEdit;
		m_pEdit = NULL;
	}
	/////////////////////////
	if (m_pItemFont != NULL)
	{
		delete[] m_pItemFont;
		m_pItemFont = NULL;
	}
	/////////////////////////

	release();
}


BEGIN_MESSAGE_MAP(CMyListCtrl, CListCtrl)
	//{{AFX_MSG_MAP(CMyListCtrl)
	ON_EN_SETFOCUS(IDC_EDT_CTRL, OnSetfocusEdit)
	ON_EN_KILLFOCUS(IDC_EDT_CTRL, OnKillfocusEdit)
	ON_CBN_SETFOCUS(IDC_CMB_CTRL, OnSetfocusCombo)
	ON_CBN_KILLFOCUS(IDC_CMB_CTRL, OnKillfocusCombo)
	//ON_MESSAGE(WM_BN_CLICK, OnBnClicked)
	ON_WM_LBUTTONDOWN()
	ON_WM_MOUSEWHEEL()
	ON_WM_LBUTTONDBLCLK()
	ON_WM_CTLCOLOR()
	ON_WM_KEYDOWN()
	ON_NOTIFY_REFLECT(LVN_COLUMNCLICK, OnColumnclick)
	ON_WM_MEASUREITEM()
	ON_WM_MEASUREITEM_REFLECT()
	ON_WM_VSCROLL()
	ON_NOTIFY_REFLECT(NM_CUSTOMDRAW, OnNMCustomdraw)
	//}}AFX_MSG_MAP
	//ON_NOTIFY_REFLECT(NM_CUSTOMDRAW, OnNMCustomdraw)


	//ON_NOTIFY_REFLECT(NM_CLICK, &CMyListCtrl::OnNMClick)
	//ON_NOTIFY_REFLECT(NM_DBLCLK, &CMyListCtrl::OnNMDBClick)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMyListCtrl message handlers

//void CMyListCtrl::OnNMClick(NMHDR *pNMHDR, LRESULT *pResult)
//{
//	//AfxMessageBox("111");
//	//CListCtrl::OnNMClick(pNMHDR, pResult);
//}

//void CMyListCtrl::OnNMDBClick(NMHDR *pNMHDR, LRESULT *pResult)
//{
//
//	AfxMessageBox("222");
//}

void CMyListCtrl::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	// TODO:  在此添加消息处理程序代码和/或调用默认值
	CListCtrl::OnVScroll(nSBCode, nPos, pScrollBar);
	//ShowButton(-1);
	//updateListCtrlButtonPos();
}
//LRESULT CMyListCtrl::OnBnClicked(WPARAM w, LPARAM p)
//{
//	// TODO: 在此添加控件通知处理程序代码
//	::SendMessage(m_hParent, WM_BN_CLICK, w, p);   //
//	return 1l;
//}
void CMyListCtrl::updateListCtrlButtonPos()
{
	
	button_map::iterator iter  = m_mButton.begin();
	button_map::iterator itrEnd  = m_mButton.end();

	CRect rect;
	GetClientRect(rect);
	LONG Height  = rect.top;
	//调整横向的
	int posx = GetScrollPos(SB_VERT);//取得水平滚动条的位置
	for (; iter  != itrEnd; ++iter)
	{
		
		rect  = iter->second->m_rect;
		rect.top  -= posx;
		rect.bottom  -= posx;
		if (rect.top > 0)
		{
			if (rect.bottom > Height)
			{
				iter->second->MoveWindow(&rect);
				iter->second->ShowWindow(SW_SHOW);
			}
			
		}
		else{
			iter->second->ShowWindow(SW_HIDE);
		}

		/*if( iLine < iTopIndex )
		{
		iterUp->second->ShowWindow( SW_HIDE );
		}*/
	}
	return;
}

void CMyListCtrl::PreSubclassWindow() 
{
	// TODO: Add your specialized code here and/or call the base class
	// TODO: 在此添加专用代码和/或调用基类
	ModifyStyle(0, LVS_OWNERDRAWFIXED);
	ModifyStyle(1, LVS_REPORT);
	
	CListCtrl::PreSubclassWindow();
	this->SetExtendedStyle(LVS_EX_FULLROWSELECT | LVS_EX_HEADERDRAGDROP | LVS_EX_GRIDLINES);

	CHeaderCtrl *pHeader = GetHeaderCtrl();
	m_Head.SubclassWindow(pHeader->GetSafeHwnd());

	CListCtrl::PreSubclassWindow();
}

void CMyListCtrl::OnMeasureItem(int nIDCtl, LPMEASUREITEMSTRUCT lpMeasureItemStruct)
{
	// TODO: 在此添加消息处理程序代码和/或调用默认值

	CListCtrl::OnMeasureItem(nIDCtl, lpMeasureItemStruct);
}

void CMyListCtrl::MeasureItem(LPMEASUREITEMSTRUCT lpMeasureItemStruct)
{
	if (m_nRowHeight>0)
	{
		lpMeasureItemStruct->itemHeight = m_nRowHeight;
	}
}

/**************************************************************
*	函数名称：	Attach(DWORD dwItem, DWORD dwSubItem, void* pData, unsigned char cDataType,\
*						 unsigned char cCtrlType, int nComboStr, CString* pComboStr)
*	函数类型：	void
*	参数说明：	DWORD dwItem,DWORD dwSubItem:列表的行号,列号。
*				void* pData:内存地址，关联这个单元格的一块内存
*				unsigned char cDataTyoe:数据类型(int-2字节,char,uchar,long-4字节,float,double)
*				unsigned char cCtrlTye:控件类型(CTRL_TYPE_EDIT,CTRL_TYPE_COMBO)
*				int nComboStr,CString* pComboStr:CComboBox控件的下拉列表的个数,下拉列表字符串指针
*	函数功能：	将列表中的单元格关联一个控件和一块内存地址
**************************************************************/
void CMyListCtrl::Attach(DWORD dwItem, DWORD dwSubItem, void* pData, unsigned char cDataType,\
						 unsigned char cCtrlType, int nComboStr, CString* pComboStr)
{
	CELLVALUE cv;	
	memset(&cv, 0, sizeof(CELLVALUE));
	cv.cCtrlType = cCtrlType;
	cv.cDataType = cDataType;
	cv.dwCol = dwSubItem;
	cv.dwRow = dwItem;
	cv.pValue = pData;
	cv.nComboStr = nComboStr;
	cv.pComboStr = pComboStr;
	// Init
	cv.nStrMaxLen = 256;
	strcpy(cv.strPrevItem, "!@#$%^&*");
	m_val.Add(cv);
	/////////////////////////
}

/*******************************************
*	函数名称：	GetItemChangeNum()
*	函数类型：	int
*	函数功能：	返回CListCtrl列表中数据变化的单元格数量
*******************************************/
int CMyListCtrl::GetItemChangeNum()
{
	int num = 0;
	CELLVALUE* pcv;
	for (int i = 0; i < m_val.GetCount(); i++)
	{
		pcv = m_val.GetAt(i);
		if (pcv == NULL)
			continue;
		if (pcv->bItemChange)
			num++;
	}
	return num;
}

/*******************************************
*	函数名称：	GetFirstItemChange(int& row, int& col)
*	函数类型：	bool
*	参数说明：	int& row,int& col:行号,列号
*	函数功能：	获取第一个值改变单元格的行号和列号,如果有返回TRUE,否则返回FALSE
*******************************************/
bool CMyListCtrl::GetFirstItemChange(int& row, int& col)
{
	m_nCurItemChange = 0;
	bool bRet = TRUE;
	bRet = GetNextItemChange(row, col);
	return bRet;
}

/*******************************************
*	函数名称：	GetNextItemChange(int& row, int& col)
*	函数类型：	bool
*	参数说明：	int& row,int& col:行号,列号
*	函数功能：	获取下一个值改变单元格的行号和列号,如果有返回TRUE,否则返回FALSE
*******************************************/
bool CMyListCtrl::GetNextItemChange(int& row, int& col)
{
	CELLVALUE* pcv;
	int num = m_val.GetCount();
	int i = 0;
	for (i = m_nCurItemChange; i < num; i++)
	{
		pcv = m_val.GetAt(i);
		if (pcv == NULL)
			continue;
		if (pcv->bItemChange)
		{
			row = pcv->dwRow;
			col = pcv->dwCol;
			break;
		}
	}
	if (i >= num)
	{
		m_nCurItemChange = 0;
		return FALSE;
	}
	m_nCurItemChange = i + 1;
	return TRUE;
}

// CEdit控件响应的SetFocus事件消息
void CMyListCtrl::OnSetfocusEdit()
{
	CString str = this->GetItemText(m_pCV->dwRow, m_pCV->dwCol);
	m_pEdit->SetWindowText(str);
	m_pEdit->SetSel(0, -1);
}

// CEdit控件响应的KillFocus事件消息
void CMyListCtrl::OnKillfocusEdit()
{
	CString str;
	if (m_pEdit == NULL)
		return;

	m_pEdit->GetWindowText(str);
	SetItemText(m_pCV->dwRow, m_pCV->dwCol, str);
	Update(m_pCV->dwRow, m_pCV->dwCol, str);
	////////////////////////////////////////////////////////
	if (m_pEdit != NULL)
	{
		delete m_pEdit;
		m_pEdit = NULL;
	}
}

// CComboBox控件响应的SetFocus事件消息
void CMyListCtrl::OnSetfocusCombo()
{
	CString str = this->GetItemText(m_pCV->dwRow, m_pCV->dwCol);
	m_pCombo->SetWindowText(str);
	m_pCombo->SetEditSel(0, -1);
}

// CComboBox控件响应的KillFocus事件消息
void CMyListCtrl::OnKillfocusCombo()
{
	CString str;
	if (m_pCombo == NULL)
		return;

	m_pCombo->GetWindowText(str);
	SetItemText(m_pCV->dwRow, m_pCV->dwCol, str);
	Update(m_pCV->dwRow, m_pCV->dwCol, str);
	////////////////////////////////////////////
	if (m_pCombo != NULL)
	{
		delete m_pCombo;
		m_pCombo = NULL;
	}
	////////////////////////////
	// Use Callback Fuction
	if (m_pComboKillFocus != NULL)
		m_pComboKillFocus(m_pDlg, m_pCV->dwCol);
}

// CListCtrl控件的DrawItem消息
void CMyListCtrl::DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct)
{
	// TODO:  添加您的代码以绘制指定项
	TCHAR lpBuffer[CELL_MAXLEN];
	int nRow = lpDrawItemStruct->itemID;

	LV_ITEM lvi;

	LV_COLUMN lvc, lvcprev;
	::ZeroMemory(&lvc, sizeof(lvc));
	::ZeroMemory(&lvcprev, sizeof(lvcprev));
	lvc.mask = LVCF_WIDTH | LVCF_FMT;
	lvcprev.mask = LVCF_WIDTH | LVCF_FMT;

	CDC *pDC;
	pDC = CDC::FromHandle(lpDrawItemStruct->hDC);
	
	CRect rtClient;
	GetClientRect(&rtClient);
	//////////////////////////////////////////////////////////////////////////
	for (int nCol = 0; GetColumn(nCol, &lvc); nCol++)
	{
		HEADCELL *pHead = m_Head.FindHeadCell(nCol);
		CELLVALUE *pCell = m_val.GetAt(nRow, nCol);
		if (nCol > 0) 
		{
			// Get Previous Column Width in order to move the next display item
			GetColumn(nCol - 1, &lvcprev);
			lpDrawItemStruct->rcItem.left += lvcprev.cx;
			lpDrawItemStruct->rcItem.right += lpDrawItemStruct->rcItem.left; 
		}

		CRect rcItem;
		if (!GetSubItemRect(lpDrawItemStruct->itemID, nCol, LVIR_LABEL, rcItem))
			continue;

		::ZeroMemory(&lvi, sizeof(lvi));
		lvi.iItem = lpDrawItemStruct->itemID;
		lvi.mask = LVIF_TEXT | LVIF_PARAM;
		lvi.iSubItem = nCol;
		lvi.pszText = lpBuffer;
		lvi.cchTextMax = sizeof(lpBuffer);
		
		VERIFY(GetItem(&lvi));
		CRect rcTemp;
		rcTemp = rcItem;

		if (nCol == 0)
		{
			rcTemp.left -= 2;
		}

		// 背景色
		CRect rcBk, rct;
		GetCellRect(nRow, nCol, rct);
		rcBk = rct;
		//////////////////////////////////////////////////////////////////////////
// 		if (nRow == 0)
// 			rcBk.top -= 1;
// 		else
// 			rcBk.top += 1;
		rcBk.bottom -= 1;
		//////////////////////////////////////////////////////////////////////////
		COLORREF color;
		color = GetBkColor();
		pDC->FillSolidRect(rcBk, color);
		if (color == RGB(212,208,200))
		{
			rct.top -= 1;
			rct.right += 1;
			pDC->DrawEdge(&rct, BDR_RAISEDINNER | EDGE_RAISED, BF_RECT);
		}

		// 列
		if (FindColColor(nCol, color) > -1)
		{
			pDC->FillSolidRect(rcBk, color);
			if (color == RGB(212,208,200))
			{
				rct.top -= 1;
				rct.right += 1;
				pDC->DrawEdge(&rct, BDR_RAISEDINNER | EDGE_RAISED, BF_RECT);
			}
		}
		// 行
		if(FindRowColor(nRow, color) > -1)
		{
			pDC->FillSolidRect(rcBk, color);
			if (color == RGB(212,208,200))
			{
				rct.top -= 1;
				rct.right += 1;
				pDC->DrawEdge(&rct, BDR_RAISEDINNER | EDGE_RAISED, BF_RECT);
			}
		}
		// 单元格
		if (FindItemColor(nCol, nRow, color) > -1)
		{
			pDC->FillSolidRect(rcBk, color);
			if (color == RGB(212,208,200))
			{
				rct.top -= 1;
				rct.right += 1;
				pDC->DrawEdge(&rct, BDR_RAISEDINNER | EDGE_RAISED, BF_RECT);
			}
		}
		//////////////////////////////////////////////////////////////////////////
		COLORREF colorBack = color;
		//////////////////////////////////////////////////////////////////////////

		UINT uFormat = DT_CENTER;

		if (pHead && pHead->cFormat == 0)
		{
			uFormat = DT_LEFT;
		}
		else if (pHead && pHead->cFormat == 1)
		{
			uFormat = DT_CENTER;
		}
		else if (pHead && pHead->cFormat == 2)
		{
			uFormat = DT_RIGHT;
		}
		TEXTMETRIC metric;
		pDC->GetTextMetrics(&metric);
		int ofst;
		ofst = rcItem.Height() - metric.tmHeight;
		rcItem.OffsetRect(0, ofst / 2);
		// 文本颜色
		pDC->SetTextColor(ITEMTEXTCOLOR);
		// 列
		if (FindColTextColor(nCol, color) > -1)
		{
			pDC->SetTextColor(color);
		}
		// 行
		if (FindRowTextColor(nRow, color) > -1)
		{
			pDC->SetTextColor(color);
		}
		// 单元格
		if (FindItemTextColor(nCol, nRow, color) > -1)
		{
			pDC->SetTextColor(color);
		}
		////////////////////////////////////////////////////////////////
		//选中状态!
		//if (lpDrawItemStruct->itemState & ODS_SELECTED) // 选中状态!
		////////////////////////////////////////////////////////////////
		// 选中一列
		if (m_bColSelectedMode)
		{
			if (nCol == m_nColSelected)
			{
				this->GetSubItemRect(nRow, nCol, LVIR_BOUNDS, rct);
				pDC->FillSolidRect(&rct, RGB(234,236,245));

				if (nRow == 0)
				{
					pDC->FillSolidRect(rct.left + 2, rct.top + 1, rct.Width() - 3, 2, RGB(10,36,106));
					pDC->FillSolidRect(rct.left + 2, rct.top + 1, 2, rct.Height() + 1, RGB(10,36,106));
					pDC->FillSolidRect(rct.right - 3, rct.top + 1, 2, rct.Height() + 1, RGB(10,36,106));
				}
				else if (nRow == GetItemCount() - 1)
				{
					pDC->FillSolidRect(rct.left + 2, rct.bottom - 3, rct.Width() - 3, 2, RGB(10,36,106));
					pDC->FillSolidRect(rct.left + 2, rct.top + 1, 2, rct.Height() - 2, RGB(10,36,106));
					pDC->FillSolidRect(rct.right - 3, rct.top + 1, 2, rct.Height() - 2, RGB(10,36,106));
				}
				else
				{
					pDC->FillSolidRect(rct.left + 2, rct.top, 2, rct.Height() + 1, RGB(10,36,106));
					pDC->FillSolidRect(rct.right - 3, rct.top, 2, rct.Height() + 1, RGB(10,36,106));
				}
			}
		}
		// 行选中
		if (m_nCurSelected != -1 && m_nCurSelected == nRow)
		{
			// 选中一行
			if (m_bLineSelected)
			{
				CPen pen, *pOld;
				pen.CreatePen(PS_SOLID, 2, RECTANGLE);
				CBrush *pBrush = CBrush::FromHandle((HBRUSH)GetStockObject(NULL_BRUSH)); // 创建空画刷，防止遮挡内容;
				CBrush *pOldBrush;

				// 先是每个单元绘制背景，然后再画一个透明背景的一行矩形框
				if (m_bLineSelectBkColor)
				{
					if (colorBack != RGB(212,208,200) || nCol != 0)
					{
						this->GetSubItemRect(nRow, nCol, LVIR_BOUNDS, rct);
						pDC->FillSolidRect(&rct, FILLSOLIDRECT);
					}
				}

				pOld = pDC->SelectObject(&pen);
				pOldBrush = pDC->SelectObject(pBrush);

				CRect rct;
				this->GetItemRect(nRow, &rct, LVIR_BOUNDS);
				FindColColor(0, colorBack);
				if (colorBack == RGB(212,208,200))
				{
					GetCellRect(nRow, 0, rcBk);
					rct.left += rcBk.Width();
				}
				//////////////////////////////////////////////////
				rct.top += 1;
				rct.left += 2;
				rct.bottom -= 1;
				rct.right -= 1;
				pDC->Rectangle(&rct);
				pDC->SetTextColor(TEXTCOLOR);
				pDC->SelectObject(pOldBrush);
				pDC->SelectObject(pOld);
				pen.DeleteObject();

			}
			// 选中某一个单元
			else
			{
				if (m_nCurSelCol != -1 && m_nCurSelCol == nCol)
				{
					CPen pen, *pOld;
					pen.CreatePen(PS_SOLID, 2, RECTANGLE);
					CBrush *pBrush = CBrush::FromHandle((HBRUSH)GetStockObject(NULL_BRUSH)); // 创建空画刷，防止遮挡内容
					CBrush *pOldBrush;

					pOld = pDC->SelectObject(&pen);
					pOldBrush = pDC->SelectObject(pBrush);

					CRect rct;
					rct = rcTemp;
					//rct.top += 1;
					rct.left += 1;
					rct.bottom -= 1;
					//rct.right -= 1;

					pDC->Rectangle(&rct);
					pDC->FillSolidRect(&rct, FILLSOLIDRECT);
					pDC->SetTextColor(TEXTCOLOR);
					pDC->SelectObject(pOldBrush);
					pDC->SelectObject(pOld);
					pen.DeleteObject();

					//CRect rct;
					//rct = rcTemp;
					//rct.top += 1;
					//rct.left += 2;
					//rct.bottom -= 1;
					//rct.right -= 1;
					//pDC->Rectangle(&rct);
					//pDC->FillSolidRect(&rct, FILLSOLIDRECT);
					//pDC->SetTextColor(TEXTCOLOR);
					//pDC->SelectObject(pOldBrush);
					//pDC->SelectObject(pOld);
					//pen.DeleteObject();
				}
			}
		}
		/////////////////////////////////////////////////////////////////
		// 贴位图!
		CBitmap bmp, *pOldBmp;
		CDC memDC;
		memDC.CreateCompatibleDC(pDC);
		if (pCell)
		{
			CRect rect;
			GetCellRect(pCell->dwRow, pCell->dwCol, rect);
			if (pCell->nIDResource > 0 && bmp.LoadBitmap(pCell->nIDResource))
			{
				BITMAP bm;
				bmp.GetBitmap(&bm);
				pOldBmp = memDC.SelectObject(&bmp);
				int offH = rect.Height() - bm.bmHeight;
				int offW = rect.Width() - bm.bmWidth;
				if (offH > 0)
				{
					rect.top += offH / 2;
					rect.bottom -= (offH - offH / 2);
				}
				if (offW > 0)
				{
					rect.left += offW / 2;
					rect.right -= (offW - offW / 2);
				}
				// 显示
				pDC->StretchBlt(rect.left, rect.top, rect.Width(), rect.Height(),
					&memDC, 0, 0, bm.bmWidth, bm.bmHeight, SRCCOPY);
				// Clean
				memDC.SelectObject(pOldBmp);
				bmp.DeleteObject();
			}
		}
		// Clean
		memDC.DeleteDC();
		///////////////////////////////////////////////
		// 文本字体
		CFont *pOldFont = NULL; 
		if (m_pFont != NULL)
			pOldFont = pDC->SelectObject(m_pFont);

		int nFontID = FindColFont(nCol);
		if (nFontID >= 0)
		{
			pDC->SelectObject(pOldFont);
			pOldFont = pDC->SelectObject(&m_pItemFont[nFontID].font);
		}

		nFontID = FindItemFont(nRow, nCol);
		if (nFontID >= 0)
		{
			pDC->SelectObject(pOldFont);
			pOldFont = pDC->SelectObject(&m_pItemFont[nFontID].font);
		}
		// 输出文本
		rcItem.left += 1;
		rcItem.top -= 2;
		pDC->DrawText(lpBuffer, &rcItem, uFormat);
		// 恢复字体
		if (pOldFont != NULL)
			pDC->SelectObject(pOldFont);
		///////////////////////////////////////////////
		// 更新
		if (pCell)
		{
			Update(nRow, nCol, lpBuffer);
		}
		///////////////////////////////////////////////
		// 控件
	}
}

/**********************************
*	函数名称：	SetHeadHeight(float Height)
*	函数类型：	void
*	参数说明：	float Height:表头的高度值,采用倍数的值(1.5倍、2倍等)
*	函数功能：	设置表头高度的倍数
**********************************/
void CMyListCtrl::SetHeadHeight(float Height)
{
	m_Head.m_fHeight = Height;
}

/**********************************
*	函数名称：	SetColColor(int col, COLORREF color)
*	函数类型：	void
*	参数说明：	int col,COLORREF color:列号,颜色值
*	函数功能：	设置列表某一列的背景颜色
**********************************/
void CMyListCtrl::SetColColor(int col,COLORREF color)
{
	COLORREF cr;
	stColor Color;
	Color.nCol = col;
	Color.rgb = color;
	int nRet = FindColColor(col,cr);
	if (nRet >= 0)
	{
		if (color == cr)
			return;
		m_ptrListCol.RemoveAt(nRet, 1);
	}
	m_ptrListCol.Add(Color);
}

/**********************************
*	函数名称：	SetRowColor(int row, COLORREF color)
*	函数类型：	void
*	参数说明：	int row,COLORREF color:行号,颜色值
*	函数功能：	设置列表某一行的背景颜色
**********************************/
void CMyListCtrl::SetRowColor(int row, COLORREF color)
{
	COLORREF cr;
	stColor Color;		
	Color.nRow = row;
	Color.rgb = color;
	int nRet = FindRowColor(row, cr);
	if (nRet >= 0)
	{
		if (color == cr)
			return;
		m_ptrListRow.RemoveAt(nRet, 1);
	}	
	m_ptrListRow.Add(Color);
	////////////////////////////
	CRect rect;
	GetItemRect(row, &rect, LVIR_BOUNDS);
	this->InvalidateRect(&rect);
}

/**********************************
*	函数名称：	UnSetRowColor(int row)
*	函数类型：	void
*	参数说明：	int row:行号
*	函数功能：	取消设置的行颜色
**********************************/
void CMyListCtrl::UnSetRowColor(int row)
{
	COLORREF cr;
	int nRet = FindRowColor(row, cr);
	if (nRet >= 0)
		m_ptrListRow.RemoveAt(nRet, 1);
	////////////////////////////
	CRect rect;
	GetItemRect(row, &rect, LVIR_BOUNDS);
	this->InvalidateRect(&rect);
}

/**********************************
*	函数名称：	SetItemColor(int row, int col, COLORREF color)
*	函数类型：	void
*	参数说明：	int row,int col,COLORREF color:行号,列号,颜色值
*	函数功能：	设置列表某一单元格的背景颜色
**********************************/
void CMyListCtrl::SetItemColor(int row, int col, COLORREF color)
{
	COLORREF cr;
	stColor Color;
	Color.nCol = col;
	Color.nRow = row;
	Color.rgb = color;
	int nRet = FindItemColor(col, row, cr);
	if (nRet >= 0)
	{
		if (cr == color)
			return;
		m_ptrListItem.RemoveAt(nRet, 1);
	}
	m_ptrListItem.Add(Color);
}

/**********************************
*	函数名称：	SetRowHeigt(int nHeight)
*	函数类型：	void
*	参数说明：	int nHeight:高度值
*	函数功能：	设置列表的行高
**********************************/
void CMyListCtrl::SetRowHeigt(int nHeight)
{
	m_nRowHeight = nHeight;

	CRect rcWin;
	GetWindowRect(&rcWin);
	WINDOWPOS wp;
	wp.hwnd = m_hWnd;
	wp.cx = rcWin.Width();
	wp.cy = rcWin.Height();
	wp.flags = SWP_NOACTIVATE | SWP_NOMOVE | SWP_NOOWNERZORDER | SWP_NOZORDER;
	SendMessage(WM_WINDOWPOSCHANGED, 0, (LPARAM)&wp);
}

/**********************************
*	函数名称：	SetHeadFont(int nSize, bool bBold, bool bItalic, bool bUnderLine, LPCTSTR pszName)
*	函数类型：	void
*	参数说明：	int nSize,bool bBold,bool bItalic,bool bUnderLine,LPCTSTR pszName:字体大小,是否粗体,是否斜体,
*				是否有下划线,字体类型(如:宋体)
*	函数功能：	设置列表头所有的字体
**********************************/
void CMyListCtrl::SetHeadFont(int nSize, BOOL bBold, BOOL bItalic, BOOL bUnderLine, LPCTSTR pszName)
{
	if (m_Head.m_pFont != NULL)
	{
		delete m_Head.m_pFont;
		m_Head.m_pFont = NULL;
	}
	m_Head.m_pFont = new CFont();
	m_Head.m_pFont->CreateFont(
		-nSize,
		0,
		0,
		0,
		bBold ? FW_NORMAL : FW_BOLD,
		bItalic,
		bUnderLine,
		0,
		DEFAULT_CHARSET,
		OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,
		DEFAULT_QUALITY,
		DEFAULT_PITCH | FF_SWISS,
		pszName
		);
}

/**********************************
*	函数名称：	SetHeadTextColor(COLORREF color, int col)
*	函数类型：	void
*	参数说明：	COLORREF color, int col:颜色值,列号
*	函数功能：	设置列表头某一列的文本颜色
**********************************/
void CMyListCtrl::SetHeadTextColor(COLORREF color, int col)
{
	if (col == -1)
	{
		for (int i = 0; i < m_Head.GetItemCount(); i++)
			m_Head.m_HeadCell[i].rgbText = color;
	}
	else
	{
		HEADCELL* pHead = m_Head.FindHeadCell(col);
		if (pHead)
		{
			pHead->rgbText = color;
		}
	}
}

/**********************************
*	函数名称：	SetColFont(int col, int nSize, BOOL bBold, BOOL bItalic, BOOL bUnderLine, LPCTSTR pszName)
*	函数类型：	void
*	参数说明：	int col,int nSize,BOOL bBold,BOOL bItalic,BOOL bUnderLine,LPCTSTR pszName:列号,字体大小,
*				是否粗体,是否斜体,是否有下划线,字体类型(如:宋体)
*	函数功能：	设置列表某一列的字体
**********************************/
void CMyListCtrl::SetColFont(int col, int nSize, BOOL bBold, BOOL bItalic, BOOL bUnderLine, LPCTSTR pszName)
{
	for (int i = 0; i < m_nFont; i++)
	{
		if (m_pItemFont[i].nCol == col)
		{
			m_pItemFont[i].font.DeleteObject();
			m_pItemFont[i].font.CreateFont(
				-nSize,
				0,
				0,
				0,
				bBold ? FW_BOLD : FW_NORMAL,
				bItalic,
				bUnderLine,
				0,
				DEFAULT_CHARSET,
				OUT_DEFAULT_PRECIS,
				CLIP_DEFAULT_PRECIS,
				DEFAULT_QUALITY,
				DEFAULT_PITCH | FF_SWISS,
				pszName
				);
			return;
		}
	}
	///////////////////////////////////////////
	if (m_nFont >= m_nFontSize)
	{
		stFont *pTmp1, *pTmp2;
		pTmp1 = m_pItemFont;
		m_nFontSize += 10;
		pTmp2 = new stFont[m_nFontSize];
		if (m_pItemFont != NULL)
			memcpy(pTmp2, m_pItemFont, sizeof(stFont)*m_nFont);
		m_pItemFont = pTmp2;
		if (m_pItemFont != NULL)
			delete[] pTmp1;
	}
	m_pItemFont[m_nFont].nCol = col;
	m_pItemFont[m_nFont].nRow = -1;
	if (m_pItemFont != NULL)
		m_pItemFont[m_nFont].font.DeleteObject();
	m_pItemFont[m_nFont].font.CreateFont(
		-nSize,
		0,
		0,
		0,
		bBold ? FW_BOLD : FW_NORMAL,
		bItalic,
		bUnderLine,
		0,
		DEFAULT_CHARSET,
		OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,
		DEFAULT_QUALITY,
		DEFAULT_PITCH | FF_SWISS,
		pszName
		);
	//////////////////////////////
	m_nFont++;
}

/**********************************
*	函数名称：	SetItemFont(int row, int col, int nSize, BOOL bBold, BOOL bItalic, BOOL bUnderLine, LPCTSTR pszName)
*	函数类型：	void
*	参数说明：	int row,int col,int nSize,BOOL bBold,BOOL bItalic,BOOL bUnderLine,LPCTSTR pszName:行号,列号
*				字体大小,是否粗体,是否斜体,是否有下划线,字体类型(如:宋体)
*	函数功能：	设置列表某一单元格的字体
**********************************/
void CMyListCtrl::SetItemFont(int row, int col, int nSize, BOOL bBold, BOOL bItalic, BOOL bUnderLine, LPCTSTR pszName)
{
	for (int i = 0; i < m_nFont; i++)
	{
		if (m_pItemFont[i].nCol == col && m_pItemFont[i].nRow == row)
		{
			m_pItemFont[i].font.DeleteObject();
			m_pItemFont[i].font.CreateFont(
				-nSize,
				0,
				0,
				0,
				bBold ? FW_BOLD : FW_NORMAL,
				bItalic,
				bUnderLine,
				0,
				DEFAULT_CHARSET,
				OUT_DEFAULT_PRECIS,
				CLIP_DEFAULT_PRECIS,
				DEFAULT_QUALITY,
				DEFAULT_PITCH | FF_SWISS,
				pszName
				);
			return;
		}
	}
	///////////////////////////////////////////
	if (m_nFont >= m_nFontSize)
	{
		stFont *pTmp1, *pTmp2;
		pTmp1 = m_pItemFont;
		m_nFontSize += 10;
		pTmp2 = new stFont[m_nFontSize];
		if (m_pItemFont != NULL)
			memcpy(pTmp2, m_pItemFont, sizeof(stFont)*m_nFont);
		m_pItemFont = pTmp2;
		if (m_pItemFont != NULL)
			delete[] pTmp1;
	}
	m_pItemFont[m_nFont].nCol = col;
	m_pItemFont[m_nFont].nRow = row;
	if (m_pItemFont != NULL)
		m_pItemFont[m_nFont].font.DeleteObject();
	m_pItemFont[m_nFont].font.CreateFont(
		-nSize,
		0,
		0,
		0,
		bBold ? FW_BOLD : FW_NORMAL,
		bItalic,
		bUnderLine,
		0,
		DEFAULT_CHARSET,
		OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,
		DEFAULT_QUALITY,
		DEFAULT_PITCH | FF_SWISS,
		pszName
		);
	//////////////////////////////
	m_nFont++;
}

/**********************************
*	函数名称：	SetFont(int nSize, BOOL bBold, BOOL bItalic, BOOL bUnderLine, LPCTSTR pszName)
*	函数类型：	void
*	参数说明：	int nSize,BOOL bBold,BOOL bItalic,BOOL bUnderLine,LPCTSTR pszName:
*				字体大小,是否粗体,是否斜体,是否有下划线,字体类型(如:宋体)
*	函数功能：	设置列表所有的字体
**********************************/
void CMyListCtrl::SetFont(int nSize, BOOL bBold, BOOL bItalic, BOOL bUnderLine, LPCTSTR pszName)
{
	/////////////////////////////////////////////////////////
	if (m_pFont != NULL)
	{
		delete m_pFont;
		m_pFont = NULL;
	}
	m_pFont = new CFont();
	m_pFont->CreateFont(
		-nSize,
		0,
		0,
		0,
		bBold ? FW_BOLD : FW_NORMAL,
		bItalic,
		bUnderLine,
		0,
		DEFAULT_CHARSET,
		OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,
		DEFAULT_QUALITY,
		DEFAULT_PITCH | FF_SWISS,
		pszName
		);
	//////////////////////////////
	if (m_pCmbFont != NULL)
	{
		delete m_pCmbFont;
		m_pCmbFont = NULL;
	}
	m_pCmbFont = new CFont();
	m_pCmbFont->CreateFont(
		-nSize + 2,
		0,
		0,
		0,
		bBold ? FW_BOLD : FW_NORMAL,
		bItalic,
		bUnderLine,
		0,
		DEFAULT_CHARSET,
		OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,
		DEFAULT_QUALITY,
		DEFAULT_PITCH | FF_SWISS,
		pszName
		);
}

/**********************************
*	函数名称：	SetColTextColor(int col, COLORREF color)
*	函数类型：	void
*	参数说明：	int col,COLORREF color:列号,颜色值
*	函数功能：	设置列表某一列的文本颜色
**********************************/
void CMyListCtrl::SetColTextColor(int col, COLORREF color)
{
	COLORREF cr;
	stColor Color;
	Color.nCol = col;
	Color.rgb = color;
	int nRet = FindColTextColor(col, cr);
	if (nRet >= 0)
	{
		if (color == cr)
			return;
		m_colTextColor.RemoveAt(nRet, 1);
	}
	m_colTextColor.Add(Color);
}

/**********************************
*	函数名称：	SetRowTextColor(int row, COLORREF color)
*	函数类型：	void
*	参数说明：	int row,COLORREF color:行号,颜色值
*	函数功能：	设置列表某一行的文本颜色
**********************************/
void CMyListCtrl::SetRowTextColor(int row, COLORREF color)
{
	COLORREF cr;
	stColor Color;
	Color.nRow = row;
	Color.rgb = color;
	int nRet = FindRowTextColor(row, cr);
	if (nRet >= 0)
	{
		if (color == cr)
			return;
		m_rowTextColor.RemoveAt(nRet, 1);
	}
	m_rowTextColor.Add(Color);
	//////////////////////////////////
	CRect rect;
	GetItemRect(row, &rect, LVIR_BOUNDS);
	this->InvalidateRect(&rect);
}

/**********************************
*	函数名称：	UnSetRowTextColor(int row)
*	函数类型：	void
*	参数说明：	int row:行号
*	函数功能：	取消设置列表某一行的文本颜色
**********************************/
void CMyListCtrl::UnSetRowTextColor(int row)
{
	COLORREF cr;
	int nRet = FindRowTextColor(row,cr);
	if (nRet >= 0)
		m_rowTextColor.RemoveAt(nRet, 1);
	//////////////////////////////////
	CRect rect;
	GetItemRect(row, &rect, LVIR_BOUNDS);
	this->InvalidateRect(&rect);
}

/**********************************
*	函数名称：	SetItemTextColor(int row, int col, COLORREF color)
*	函数类型：	void
*	参数说明：	int row,int col,COLORREF color:行号,列号,颜色值
*	函数功能：	设置列表某一单元格的文本颜色
**********************************/
void CMyListCtrl::SetItemTextColor(int row, int col, COLORREF color)
{
	COLORREF cr;
	stColor Color;
	Color.nCol = col;
	Color.nRow = row;
	Color.rgb = color;
	int nRet = FindItemTextColor(col, row, cr);
	if (nRet >= 0)
	{
		if (color == cr)
			return;
		m_ItemTextColor.RemoveAt(nRet, 1);
	}
	m_ItemTextColor.Add(Color);
}

int CMyListCtrl::InsertColumn(int col, LPCTSTR pszHead, UINT Format, int nHeadWidth)
{
	HEADCELL hc;
	switch(Format)
	{
	case DT_LEFT:
		hc.cFormat = 0;
		break;
	case DT_CENTER:
		hc.cFormat = 1;
		break;
	case DT_RIGHT:
		hc.cFormat = 2;
		break;
	default:
		hc.cFormat = 1;
		break;
	}
	hc.nCol = col;
	hc.rgbBack = RGB(212,208,200);
	hc.rgbText = RGB(0,0,0);
	hc.strHead.Format("%s", pszHead);
	m_Head.m_HeadCell.Add(hc);

	return CListCtrl::InsertColumn(col, pszHead, Format, nHeadWidth);
}

void CMyListCtrl::InsertColumn(int num, CString* pHead, UINT Format, int* pHeadWidth)
{
	int nWidth = 0;
	CRect rect;
	int nW = 0;
	this->GetClientRect(&rect);
	if (pHeadWidth == NULL)
		nW = rect.Width() / num;

	for (int i = 0; i < num; i++)
	{
		if (pHeadWidth)
		{
			InsertColumn(i, pHead[i], Format, pHeadWidth[i]);
			nWidth += pHeadWidth[i];
		}
		else
		{
			InsertColumn(i, pHead[i], Format, nW);
			nWidth += nW;
		}
	}
	// 	if (rect.Width() > nWidth)
	// 		InsertColumn(num, "", Format, rect.Width() - nWidth);
}

void CMyListCtrl::SetHeadBKColor(COLORREF rgb, int Gradient, int col)
{
	m_Head.m_nGradient = Gradient;
	if (col == -1)
	{
		for (int i = 0; i < m_Head.m_HeadCell.GetSize(); i++)
		{
			m_Head.m_HeadCell[i].rgbBack = rgb;
		}
	}
	else
	{
		HEADCELL *pHead = m_Head.FindHeadCell(col);
		if (pHead)
		{
			pHead->rgbBack = rgb;
		}
	}
}

// 鼠标左键单击列表某一点事件
void CMyListCtrl::OnLButtonDown(UINT nFlags, CPoint point)
{
	// TODO: Add your message handler code here and/or call default
	// 刷新!
	CRect rect;
	//////////////////////////////////////////////////
	if (m_nCurSelected != -1)
	{
		GetItemRect(m_nCurSelected, &rect, LVIR_BOUNDS);
		this->InvalidateRect(&rect);
	}
	//////////////////////////////////////////////////
	// 找出选中的是哪一行
	for (int i = 0; i < this->GetItemCount(); i++)
	{
		this->GetItemRect(i, &rect, LVIR_BOUNDS);
		if (rect.PtInRect(point))
		{
			//////////////////////////
			// 上一次选中的行号
			m_nPrevSelected = m_nCurSelected;
			// 当前选中的行号
			m_nCurSelected = i;
			// 判断是否设置了行选中模式
			if (m_bLineSelectedMode)
				m_bLineSelected = TRUE;
			else
			{
				////////////////////////////////////////////
				// 非行选中模式时，还要在找出选中的是哪一列
				GetCellRect(i, 0, rect);
				m_bLineSelected = FALSE;
				CPoint pt;
				::GetCursorPos(&pt);
				::ScreenToClient(this->m_hWnd, &pt);
				for (int j = 0; j < this->GetHeaderCtrl()->GetItemCount(); j++)
				{
					GetCellRect(i, j, rect);
					if (rect.PtInRect(pt))
					{
						m_nCurSelCol = j;
						break;
					}
				}

				/* 源码保留
				if (rect.PtInRect(point))
					m_bLineSelected = TRUE;
				else
				{
					m_bLineSelected = FALSE;
					CPoint pt;
					::GetCursorPos(&pt);
					::ScreenToClient(this->m_hWnd, &pt);
					for (int j = 0; j < this->GetHeaderCtrl()->GetItemCount(); j++)
					{
						GetCellRect(i, j, rect);
						if (rect.PtInRect(pt))
						{
							m_nCurSelCol = j;
							break;
						}
					}
				} */
			}
			//////////////////////////////
			break;
		}
	}
	
	CListCtrl::OnLButtonDown(nFlags, point);
}

// 鼠标左键双击列表某一点事件
void CMyListCtrl::OnLButtonDblClk(UINT nFlags, CPoint point) 
{
	// TODO: Add your message handler code here and/or call default
	CRect rect;
	//////////////////////////////////////////////
	int i = 0;
	for (i = 0; i < m_val.GetCount(); i++)
	{
		m_pCV = m_val.GetAt(i);
		this->GetSubItemRect(m_pCV->dwRow, m_pCV->dwCol, LVIR_BOUNDS, rect);
		if (rect.PtInRect(point))
		{
			CreateCtrl(m_pCV);
			break;
		}
	}
	if (m_pItemDblClk != NULL)
	{
		for (i = 0; i < GetItemCount(); i++)
		{
			this->GetSubItemRect(i, m_nColItem, LVIR_BOUNDS, rect);
			if (rect.PtInRect(point))
			{
				CString str = GetItemText(i, m_nColItem);
				m_pItemDblClk(i, m_nColItem, m_pVoid);
				break;
			}
		}
	}

	CListCtrl::OnLButtonDblClk(nFlags, point);
}

// 获取列表的某一行某一列的矩形区域
void CMyListCtrl::GetCellRect(int nItem, int nSubItem, CRect &rect)
{
	this->GetItemRect(nItem, &rect, LVIR_BOUNDS);

	LVCOLUMN column;
	column.mask = LVCF_WIDTH;
	for (int i = 0; i < nSubItem; i++)
	{
		this->GetColumn(i, &column);
		rect.left += column.cx;
	}

	this->GetColumn(nSubItem, &column);
	rect.right = rect.left+column.cx;
}

// 根据pCV中的参数创建文本框还是下拉框控件等
BOOL CMyListCtrl::CreateCtrl(CELLVALUE *pCV)
{
	DWORD dwStyle;
	CRect rect;
	/////////////////////////////////////////////////////////////
	if (m_pEdit != NULL)
	{
		delete m_pEdit;
		m_pEdit = NULL;
	}
	if (m_pCombo != NULL)
	{
		delete m_pCombo;
		m_pCombo = NULL;
	}
	/////////////////////////////////////////////////////////////
	CString str = this->GetItemText(pCV->dwRow, pCV->dwCol);
	this->GetSubItemRect(pCV->dwRow, pCV->dwCol, LVIR_BOUNDS, rect);

	switch (pCV->cCtrlType)
	{
	case CTRL_TYPE_EDIT:
		{
			m_pEdit = new CRichEditCtrl();
			dwStyle = WS_BORDER | WS_VISIBLE | ES_AUTOHSCROLL | ES_LEFT;
			rect.top -= 1;
			rect.right += 1;
			m_pEdit->Create(dwStyle, rect, this, IDC_EDT_CTRL);
			if (m_pFont != NULL)
				m_pEdit->SetFont(m_pFont);
			m_pEdit->SetWindowText(str);
			m_pEdit->ShowWindow(SW_SHOW);
			m_pEdit->SetFocus();
		}
		break;
	case CTRL_TYPE_COMBO:
		{
			m_pCombo = new CComboBox();
			dwStyle = WS_CHILD | CBS_DROPDOWN | WS_VISIBLE | WS_VSCROLL;
			rect.bottom += 200;
			m_pCombo->Create(dwStyle, rect, this, IDC_CMB_CTRL);
			if (m_pCmbFont != NULL)
				m_pCombo->SetFont(m_pCmbFont);
			
			for (int i = 0; i < pCV->nComboStr; i++)
			{
				m_pCombo->AddString(pCV->pComboStr[i]);
			}

			m_pCombo->ShowWindow(SW_SHOW);
			m_pCombo->SetFocus();
		}
		break;
	case CTRL_TYPE_CHECK:
		{
		}
		break;
	}
	if (m_pCombo != NULL || m_pEdit != NULL)
		return TRUE;
	else
		return FALSE;
}

// 查找列颜色
int CMyListCtrl::FindColColor(int col, COLORREF &color)
{
	int flag = -1;
	for (int i = 0; i < m_ptrListCol.GetSize(); i++)
	{
		stColor Color = m_ptrListCol.GetAt(i);
		if (Color.nCol == col)
		{
			flag = i;
			color = Color.rgb;
			break;
		}
	}
	return flag;
}

// 查找行颜色
int CMyListCtrl::FindRowColor(int row, COLORREF &color)
{
	int flag = -1;
	for (int i = 0; i < m_ptrListRow.GetSize(); i++)
	{
		stColor Color = m_ptrListRow.GetAt(i);
		if (Color.nRow == row)
		{
			flag = i;
			color = Color.rgb;
			break;
		}
	}
	return flag;
}

// 查找某一单元颜色
int CMyListCtrl::FindItemColor(int col, int row, COLORREF &color)
{
	int flag = -1;
	for (int i = 0; i < m_ptrListItem.GetSize(); i++)
	{
		stColor Color = m_ptrListItem.GetAt(i);
		if (Color.nCol == col && Color.nRow == row)
		{
			flag = i;
			color = Color.rgb;
			break;
		}
	}
	return flag;
}

// 查找列文本颜色
int CMyListCtrl::FindColTextColor(int col, COLORREF &color)
{
	int flag = -1;
	for (int i = 0; i < m_colTextColor.GetSize(); i++)
	{
		stColor Color = m_colTextColor.GetAt(i);
		if (Color.nCol == col)
		{
			flag = 1;
			color = Color.rgb;
			break;
		}
	}
	return flag;
}

// 查找行文本颜色
int CMyListCtrl::FindRowTextColor(int row, COLORREF &color)
{
	int flag = -1;
	for (int i = 0; i < m_rowTextColor.GetSize(); i++)
	{
		stColor Color = m_rowTextColor.GetAt(i);
		if (Color.nRow == row)
		{
			flag = i;
			color = Color.rgb;
			break;
		}
	}
	return flag;
}

// 查找某一单元文本颜色
int CMyListCtrl::FindItemTextColor(int col, int row, COLORREF &color)
{
	int flag = -1;
	for (int i = 0; i < m_ItemTextColor.GetSize(); i++)
	{
		stColor Color = m_ItemTextColor.GetAt(i);
		if (Color.nCol == col && Color.nRow == row)
		{
			flag = i;
			color = Color.rgb;
			break;
		}
	}
	return flag;
}

// 查找列字体
int CMyListCtrl::FindColFont(int col)
{
	for (int i = 0; i < m_nFont; i++)
	{
		if (m_pItemFont[i].nCol == col && m_pItemFont[i].nRow == -1)
		{
			return i;
		}
	}
	return -1;
}

// 查找某一单元字体
int CMyListCtrl::FindItemFont(int row, int col)
{
	for (int i = 0; i < m_nFont; i++)
	{
		if (m_pItemFont[i].nCol == col && m_pItemFont[i].nRow == row)
		{
			return i;
		}
	}
	return -1;
}

// 刷新
void CMyListCtrl::Update(int row, int col, LPCTSTR pszTxt)
{
	CString str;
	str.Format("%s", pszTxt);
	CELLVALUE *pCV = m_val.GetAt(row, col);
	if (pCV == NULL) // 判断指针是否为NULL
		return;
	///////////////////////////////////////
	// 判断单元格中的内容是否有改变!
	if (strcmp(pCV->strPrevItem, "!@#$%^&*") == 0)
	{
		memset(pCV->strPrevItem, 0, CELL_MAXLEN);
		strcpy(pCV->strPrevItem, str);
	}

	if (strcmp(str, pCV->strPrevItem) != 0)
		pCV->bItemChange = 1;
	else
		pCV->bItemChange = 0;
	//////////////////////////////////////
	switch (pCV->cDataType)
	{
	case DATA_TYPE_CHAR: // char
		{
			UpdateCharData(pCV, str);
		}
		break;
	case DATA_TYPE_INT: // int(2B)
		{
			UpdateIntData(pCV, str);
		}
		break;
	case DATA_TYPE_FLOAT: // float
		{
			UpdateFloatData(pCV, str);
		}
		break;
	case DATA_TYPE_STRING: // char *
		{
			UpdateStringData(pCV, str);
		}
		break;
	case DATA_TYPE_UCHAR: // unsigned char
		{
			UpdateUCharData(pCV, str);
		}
		break;
	case DATA_TYPE_LONG: // unsigned long
		{
			UpdateLongData(pCV, str);
		}
		break;
	case DATA_TYPE_DOUBLE: // 2个float
		{
			UpdateDoubleData(pCV, str);
		}
		break;
	}
}

void CMyListCtrl::UpdateCharData(CELLVALUE *pcv, CString &strItem)
{
	if (pcv->pValue == NULL)
		return;
	///////////////////////
	switch (pcv->cCtrlType)
	{
	case CTRL_TYPE_EDIT:
		{
			if (strItem.GetLength() > 0 && strItem.GetLength() < 2)
			{
				if ((strItem.GetAt(0) >= 'a' && strItem.GetAt(0) <= 'z') || (strItem.GetAt(0) >= 'A' && \
					strItem.GetAt(0) <= 'Z'))
					*((char *)pcv->pValue) = strItem.GetAt(0);
				else
					*((char *)pcv->pValue) = atoi(strItem);
			}
			if (strItem.GetLength() > 1)
			{
				*((char *)pcv->pValue) = atoi(strItem);
			}
		}
		break;
	case CTRL_TYPE_CHECK:
		break;
	case CTRL_TYPE_COMBO:
		{
			char nIndex;
			if (m_pCombo != NULL)
				nIndex = m_pCombo->GetCurSel();
			if (strItem == "")
				*((char *)pcv->pValue) = -1;
			else
			{
				if (m_pCombo != NULL)
					*((char *)pcv->pValue) = nIndex;
				else
				{
					for (int i = 0; i < pcv->nComboStr; i++)
					{
						if (strcmp(pcv->pComboStr[i], strItem) == 0)
						{
							*((char *)pcv->pValue) = i;
							break;
						}
					}
				}
			}
		}
		break;
	}	
}

void CMyListCtrl::UpdateUCharData(CELLVALUE *pcv, CString &strItem)
{
	if (pcv->pValue == NULL)
		return;
	///////////////////////
	switch (pcv->cCtrlType)
	{
	case CTRL_TYPE_EDIT:
		{
			if (strItem.GetLength() > 0 && strItem.GetLength() < 2)
			{
				if ((strItem.GetAt(0) >= 'a' && strItem.GetAt(0) <= 'z') ||
					(strItem.GetAt(0) >= 'A' && strItem.GetAt(0) <= 'Z'))
					*((unsigned char *)pcv->pValue) = strItem.GetAt(0);
				else
					*((unsigned char *)pcv->pValue) = atoi(strItem);
			}
			if (strItem.GetLength() > 1)
			{
				if (pcv->pValue != NULL)
					*((unsigned char *)pcv->pValue) = atoi(strItem);
			}			
		}
		break;
	case CTRL_TYPE_CHECK:
		break;
	case CTRL_TYPE_COMBO:
		{
			unsigned char nIndex;
			if (m_pCombo != NULL)
				nIndex = m_pCombo->GetCurSel();
			if (strItem == "")
				*((unsigned char *)pcv->pValue) = -1;
			else
			{
				if (m_pCombo != NULL)
					*((unsigned char *)pcv->pValue) = nIndex;
				else
				{
					for (int i = 0; i < pcv->nComboStr; i++)
					{
						if (strcmp(pcv->pComboStr[i], strItem) == 0)
						{
							*((unsigned char *)pcv->pValue) = i;
							break;
						}
					}
				}
			}
		}
		break;
	}
}

void CMyListCtrl::UpdateStringData(CELLVALUE *pcv, CString &strItem)
{
	if (pcv->pValue == NULL)
		return;
	////////////////////////
	switch (pcv->cCtrlType)
	{
	case CTRL_TYPE_EDIT:
		{
			if (strItem.GetLength()>pcv->nStrMaxLen)
				memcpy((char *)pcv->pValue, strItem, pcv->nStrMaxLen);
			else
				strcpy((char *)pcv->pValue, strItem);
		}
		break;
	case CTRL_TYPE_CHECK:
		break;
	case CTRL_TYPE_COMBO:
		{
			if (strItem.GetLength()>pcv->nStrMaxLen)
				memcpy(((char *)pcv->pValue), strItem,pcv->nStrMaxLen);
			else
				strcpy(((char *)pcv->pValue), strItem);
		}
		break;
	}
}

void CMyListCtrl::UpdateIntData(CELLVALUE *pcv, CString &strItem)
{
	if (pcv->pValue == NULL)
		return;
	///////////////////////
	switch (pcv->cCtrlType)
	{
	case CTRL_TYPE_EDIT:
		{
			*((WORD *)pcv->pValue) = atoi(strItem);
		}
		break;
	case CTRL_TYPE_CHECK:
		break;
	case CTRL_TYPE_COMBO:
		{
			WORD nIndex;
			if (m_pCombo != NULL)
				nIndex = m_pCombo->GetCurSel();
			if (strItem == "")
				*((WORD *)pcv->pValue) = -1;
			else
			{
				if (m_pCombo != NULL)
					*((WORD *)pcv->pValue) = nIndex;
				else
				{
					for (int i = 0; i < pcv->nComboStr; i++)
					{
						if (strcmp(pcv->pComboStr[i], strItem) == 0)
						{
							*((WORD *)pcv->pValue) = i;
							break;
						}
					}
				}
			}
		}
		break;
	}
}

void CMyListCtrl::UpdateLongData(CELLVALUE *pcv, CString &strItem)
{
	if (pcv->pValue == NULL)
		return;
	///////////////////////
	switch (pcv->cCtrlType)
	{
	case CTRL_TYPE_EDIT:
		{
			*((DWORD *)pcv->pValue) = atoi(strItem);
		}
		break;
	case CTRL_TYPE_COMBO:
		{
			DWORD nIndex;
			if (m_pCombo != NULL)
				nIndex = m_pCombo->GetCurSel();
			if (strItem == "")
				*((DWORD *)pcv->pValue) = -1;
			else
			{
				if (m_pCombo != NULL)
					*((DWORD *)pcv->pValue) = nIndex;
				else
				{
					for (int i = 0; i < pcv->nComboStr; i++)
					{
						if (strcmp(pcv->pComboStr[i], strItem) == 0)
						{
							*((DWORD *)pcv->pValue) = i;
							break;
						}
					}
				}
			}
		}
		break;
	case CTRL_TYPE_CHECK:
		break;
	}
}

void CMyListCtrl::UpdateFloatData(CELLVALUE *pcv, CString &strItem)
{
	if (pcv->pValue == NULL)
		return;
	///////////////////////
	switch (pcv->cCtrlType)
	{
	case CTRL_TYPE_EDIT:
		{
			*((float *)pcv->pValue) = (float)atof(strItem);
		}
		break;
	case CTRL_TYPE_CHECK:
		break;
	case CTRL_TYPE_COMBO:
		{
			float fIndex;
			if (m_pCombo != NULL)
				fIndex = (float)m_pCombo->GetCurSel();
			if (strItem == "")
				*((float *)pcv->pValue) = -1.0;
			else
			{
				if (m_pCombo != NULL)
					*((float *)pcv->pValue) = fIndex;
				else
				{
					for (int i = 0; i < pcv->nComboStr; i++)
					{
						if (strcmp(pcv->pComboStr[i], strItem) == 0)
						{
							*((float *)pcv->pValue) = (float)i;
							break;
						}
					}
				}
			}
		}
		break;
	}
}

void CMyListCtrl::UpdateDoubleData(CELLVALUE *pcv, CString &strItem)
{
	if (pcv->pValue == NULL)
		return;
	//////////////////////
	switch (pcv->cCtrlType)
	{
	case CTRL_TYPE_EDIT:
		{
			*((double *)pcv->pValue) = atof(strItem);
		}
		break;
	case CTRL_TYPE_COMBO:
		{
			double fIndex;
			if (m_pCombo != NULL)
				fIndex = (double)m_pCombo->GetCurSel();
			if (strItem == "")
				*((double *)pcv->pValue) = -1.0;
			else
			{
				if (m_pCombo != NULL)
					*((double *)pcv->pValue) = fIndex;
				else
				{
					for (int i = 0; i < pcv->nComboStr; i++)
					{
						if (strcmp(pcv->pComboStr[i], strItem) == 0)
						{
							*((double *)pcv->pValue) = (double)i;
							break;
						}
					}
				}
			}
		}
		break;
	case CTRL_TYPE_CHECK:
		break;
	}
}

void CMyListCtrl::MoveButton(CRect rect, CButtonEx* btn)
{
	int nWith = rect.Width();
	int nHeight = rect.Height();
	CRect rectTmp = rect;
	rectTmp.left = rect.left + nWith / 5;
	rectTmp.bottom = rect.bottom - nHeight / 10;
	rectTmp.top = rect.top + nHeight / 10;
	rectTmp.right = rectTmp.right - nWith / 5;
	btn->MoveWindow(rectTmp);
}

HBRUSH CMyListCtrl::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor) 
{
	HBRUSH hbr = CListCtrl::OnCtlColor(pDC, pWnd, nCtlColor);
	
	// TODO: Change any attributes of the DC here
	if (pWnd->GetDlgCtrlID() == CTRL_TYPE_CHECK)
	{
		pDC->SetBkMode(TRANSPARENT);
		pDC->SetTextColor(RGB(0,0,0));
		pDC->SetBkColor(RGB(255,255,255));
		hbr = (HBRUSH)GetStockObject(WHITE_BRUSH);
	}
	// TODO: Return a different brush if the default is not desired
	return hbr;
}

void CMyListCtrl::SetHeadColFont(int col, int nFontSize, BOOL Bold, BOOL Italic, BOOL UnderLine, LPCTSTR pszFontName)
{
	m_Head.SetColFont(col, nFontSize, Bold, Italic, UnderLine, pszFontName);
}

void CMyListCtrl::SetItemImage(int row, int col, UINT nIDResource)
{
	CELLVALUE *pCell;
	CELLVALUE cell;
	memset(&cell, 0, sizeof(CELLVALUE));
	pCell = m_val.GetAt(row, col);
	if (pCell)
	{
		pCell->nIDResource = nIDResource;
	}
	else
	{
		cell.dwRow = row;
		cell.dwCol = col;
		cell.nIDResource = nIDResource;
		m_val.Add(cell);
	}
	////////////////////////////
	// 刷新
	CRect rect;
	GetCellRect(row, col, rect);
	this->InvalidateRect(&rect, FALSE);
}

BOOL CMyListCtrl::IsItemImage(int row, int col)
{
	CELLVALUE *pCell = m_val.GetAt(row, col);
	if (pCell)
	{
		if(pCell->nIDResource > 0)
			return TRUE;
	}
	return FALSE;
}

void CMyListCtrl::UnSetItemImage(int row, int col)
{
	CELLVALUE *pCell = m_val.GetAt(row, col);
	if (pCell)
	{
		pCell->nIDResource = 0;
	}
	////////////////////////////
	// 刷新
	CRect rect;
	GetItemRect(row, &rect, LVIR_BOUNDS);
	this->InvalidateRect(&rect, FALSE);
}

void CMyListCtrl::UpdateCombo(int nCol, CString *pComboStr, int nComboStr)
{
	for (int i = 0; i < m_val.GetCount(); i++)
	{
		if (m_val.GetAt(0, nCol)->cCtrlType == CTRL_TYPE_COMBO)
		{
			m_val.GetAt(0, nCol)->nComboStr = nComboStr;
			m_val.GetAt(0, nCol)->pComboStr = pComboStr;
		}
	}
}

void CMyListCtrl::SetLineSelectMode(bool bLineSelect, bool bLineSelectBkColor)
{
	m_bLineSelectedMode = bLineSelect;
	m_bLineSelected = TRUE;
	m_bLineSelectBkColor = bLineSelectBkColor;
}

void CMyListCtrl::SetColSelectMode(bool bColSelect)
{
	m_bColSelectedMode = bColSelect;
}

void CMyListCtrl::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
	// TODO: Add your message handler code here and/or call default
	CRect rect;
	//////////////////////////////////////////////////
	if (m_nCurSelected != -1)
	{
		GetItemRect(m_nCurSelected, &rect, LVIR_BOUNDS);
		this->InvalidateRect(&rect);
	}
	//////////////////////////////////////////////////
	switch (nChar)
	{
	case 40: // ↓
		m_nCurSelected++;
		if (m_nCurSelected >= this->GetItemCount())
			m_nCurSelected--;
		break;
	case 38: // ↑
		m_nCurSelected--;
		if (m_nCurSelected < 0)
			m_nCurSelected++;
		break;
	case 39: // →
		m_nCurSelCol++;
		if (m_nCurSelCol >= this->GetHeaderCtrl()->GetItemCount())
			m_nCurSelCol--;
		break;
	case 37: // ←
		m_nCurSelCol--;
		if (m_nCurSelCol < 0)
			m_nCurSelCol++;
		break;
	}
	this->GetItemRect(m_nCurSelected, &rect, LVIR_BOUNDS);
	this->InvalidateRect(&rect);

	CListCtrl::OnKeyDown(nChar, nRepCnt, nFlags);
}

void CMyListCtrl::OnSelectedDown() 
{
	// TODO: Add your message handler code here and/or call default
	OnKeyDown(40, 0, 0);
}

void CMyListCtrl::OnSelectedUp() 
{
	// TODO: Add your message handler code here and/or call default
	OnKeyDown(38, 0, 0);
}

void CMyListCtrl::SetCurSel(int nItem)
{
	CRect rect;
	//////////////////////////////////////////////////
	if (m_nCurSelected != -1)
	{
		m_bLineSelected = FALSE;
		GetItemRect(m_nCurSelected, &rect, LVIR_BOUNDS);
		this->InvalidateRect(&rect);
	}
	m_nCurSelected = nItem;
	m_bLineSelected = TRUE;
	this->GetItemRect(m_nCurSelected, &rect, LVIR_BOUNDS);
	this->InvalidateRect(&rect);

	if (nItem != -1)
	{
		/////////////////////////////
		//滚动到指定的行
		CSize size;
		size.cx = 0;
		int nVerPos = this->GetScrollPos(SB_VERT) + 1;
		if (nVerPos == nItem)
			return;
		else if (nVerPos < nItem)
			size.cy = (nItem - nVerPos) * rect.Height();
		else if (nVerPos > nItem)
			size.cy = (nItem-nVerPos) * rect.Height();

		this->Scroll(size);
	}
}

int CMyListCtrl::GetCurSel()
{
	return m_nCurSelected;
}

int CMyListCtrl::GetPrevSel()
{
	return m_nPrevSelected;
}

void CMyListCtrl::SetCallbackFunc(COMBOKILLFOCUS pFunc, CDialog* pDlg)
{
	m_pComboKillFocus = pFunc;
	m_pDlg = pDlg;
}

void CMyListCtrl::SetItemDblClkFunc(ITEMDBLCLK pFunc, int nColItem, void* pParam)
{
	m_pItemDblClk = pFunc;
	m_nColItem = nColItem;
	m_pVoid = pParam;
}

void CMyListCtrl::SetStrMaxLen(int nRow, int nCol, int nMaxLen)
{
	CELLVALUE* pcv = m_val.GetAt(nRow, nCol);
	pcv->nStrMaxLen = nMaxLen;
}

// CListCtrl的列头单击事件
void CMyListCtrl::OnColumnclick(NMHDR* pNMHDR, LRESULT* pResult) 
{
	NM_LISTVIEW* pNMListView = (NM_LISTVIEW*)pNMHDR;
	// TODO: Add your control notification handler code here

	*pResult = 0;
}

BOOL CMyListCtrl::DeleteItemEx(int nItem){
	int n = m_mapImg.size();
	for (int i =0; i<n;i++)
	{
		if (i >= nItem)
		{
			m_mapImg[i] = m_mapImg[i + 1];
		}
	}
	m_mapImg.erase(m_mapImg.size());
	int nCout = GetItemCount();
	delete m_mButton[nCout - 1];
	m_mButton[nCout - 1] = NULL;
	if (m_mButtonDel.size()>0)
	{

		delete m_mButtonDel[nCout - 1];
		m_mButtonDel[nCout - 1] = NULL;
	}
	return DeleteItem(nItem);
}

void CMyListCtrl::Clear()
{
	
	m_mapImg.clear();
	m_val.DelAll();
	release();

	DeleteAllItems();
	/////////////////////////
}

void CMyListCtrl::ClearHead(void)
{
	int headCount = m_Head.GetItemCount();
	for (int i = 0; i < headCount; i++)
	{
		DeleteColumn(0);
	}
	m_Head.m_HeadCell.RemoveAll();
}

int	 CMyListCtrl::InsertItemInt(int nItem, int val)
{
	CString str = "";
	if (val < 0)
		str.Format("-%d", abs(val));
	else
		str.Format("%d", val);
	return InsertItem(nItem, str);
}

BOOL CMyListCtrl::SetItemInt(int nItem, int nSubItem, int val)
{
	CString str = "";
	if (val < 0)
		str.Format("-%d", abs(val));
	else
		str.Format("%d", val);
	return SetItemText(nItem, nSubItem, str);
}

BOOL CMyListCtrl::SetItemFloat(int nItem, int nSubItem, float val)
{
	CString str = "";
	if (val < 0.0)
		str.Format("-%.4f", (val * -1.0));
	else
		str.Format("%.4f", val);
	return SetItemText(nItem, nSubItem, str);
}

int	 CMyListCtrl::GetItemInt(int nItem, int nSubItem)
{
	CString str = GetItemText(nItem, nSubItem);
	return (atoi(str));
}

float CMyListCtrl::GetItemFloat(int nItem, int nSubItem)
{
	CString str = GetItemText(nItem, nSubItem);
	return ((float)atof(str));	
}
void CMyListCtrl::OnNMCustomdraw(NMHDR *pNMHDR, LRESULT *pResult)
{
#if 0 
	LPNMCUSTOMDRAW pNMCD = reinterpret_cast<LPNMCUSTOMDRAW>(pNMHDR);
	// TODO:  在此添加控件通知处理程序代码
	*pResult = 0;
#endif
	NMLVCUSTOMDRAW* pLVCD = reinterpret_cast<NMLVCUSTOMDRAW*>(pNMHDR);

	*pResult = 0;

	// If this is the beginning of the control's paint cycle, request
	// notifications for each item.

	if (CDDS_PREPAINT == pLVCD->nmcd.dwDrawStage)
	{
		
		*pResult = CDRF_NOTIFYITEMDRAW;
	}
	else if (CDDS_ITEMPREPAINT == pLVCD->nmcd.dwDrawStage)
	{
		// This is the pre-paint stage for an item.  We need to make another
		// request to be notified during the post-paint stage.
		
		*pResult = CDRF_NOTIFYPOSTPAINT;
	}
	else if (CDDS_ITEMPOSTPAINT == pLVCD->nmcd.dwDrawStage)
	{
		// If this item is selected, re-draw the icon in its normal
		// color (not blended with the highlight color).
		LVITEM rItem;
		int    nItem = static_cast<int>(pLVCD->nmcd.dwItemSpec);
		CDC*  pDC = CDC::FromHandle(pLVCD->nmcd.hdc);
		CRect rcIcon;
#if 1
		GetSubItemRect(nItem, pLVCD->iSubItem, LVIR_BOUNDS, rcIcon);
		//CRect rc5;
		//GetSubItemRect(nItem, 5, LVIR_BOUNDS, rc5);
		//MoveButton(rc5,m_mButton[nItem]);
		if (pLVCD->iSubItem == 0)
		{
			int offset = rcIcon.left;
			CRect firstColumnRect;
			GetHeaderCtrl()->GetItemRect(0, &firstColumnRect);
			rcIcon.left = firstColumnRect.left + offset;
			rcIcon.right = firstColumnRect.right + offset;
			CImage img;
			CString img_path = m_mapImg[nItem];
			HRESULT hr = img.Load(img_path);
			if (SUCCEEDED(hr))
			{
				RECT rcSrc;
				rcSrc.left = 0;
				rcSrc.top = 0;
				rcSrc.right = img.GetWidth();
				rcSrc.bottom = img.GetHeight();
				SetStretchBltMode(pDC->m_hDC, COLORONCOLOR);
				//img.Draw( pDC->m_hDC, rc, rcSrc);
				img.Draw(pDC->m_hDC, rcIcon);
				//ReleaseDC(pDC);
			}
		}
		*pResult = 0;
		// Get the image index and state of this item.  Note that we need to
		// check the selected state manually.  The docs _say_ that the
		// item's state is in pLVCD->nmcd.uItemState, but during my testing
		// it was always equal to 0x0201, which doesn't make sense, since
		// the max CDIS_ constant in commctrl.h is 0x0100.
#else
		ZeroMemory(&rItem, sizeof(LVITEM));
		rItem.mask = LVIF_IMAGE | LVIF_STATE;
		rItem.iItem = nItem;
		rItem.stateMask = LVIS_SELECTED;
		m_List.GetItem(&rItem);

		// If this item is selected, redraw the icon with its normal colors.

		if (rItem.state & LVIS_SELECTED)
		{
			CDC*  pDC = CDC::FromHandle(pLVCD->nmcd.hdc);
			CRect rcIcon;

			// Get the rect that holds the item's icon.
			//m_List.GetItemRect(nItem, &rcIcon, LVIR_BOUNDS);
			m_List.GetSubItemRect(nItem, pLVCD->iSubItem, LVIR_BOUNDS, rcIcon);
			if (pLVCD->iSubItem == 0)
			{
				int offset = rcIcon.left;
				CRect firstColumnRect;
				m_List.GetHeaderCtrl()->GetItemRect(0, &firstColumnRect);
				rcIcon.left = firstColumnRect.left + offset;
				rcIcon.right = firstColumnRect.right + offset;
			}
			CImage img;
			CString img_path = "E:\\Code\\59.jpg";
			HRESULT hr = img.Load(img_path);
			if (SUCCEEDED(hr))
			{
				RECT rcSrc;
				rcSrc.left = 0;
				rcSrc.top = 0;
				rcSrc.right = img.GetWidth();
				rcSrc.bottom = img.GetHeight();

				SetStretchBltMode(pDC->m_hDC, COLORONCOLOR);

				//img.Draw( pDC->m_hDC, rc, rcSrc);
				img.Draw(pDC->m_hDC, rcIcon);
				ReleaseDC(pDC);
			}
			// Draw the icon.
			//m_imglist.Draw(pDC, rItem.iImage, rcIcon.TopLeft(),
			//	ILD_TRANSPARENT);
			*pResult = CDRF_SKIPDEFAULT;
		}
#endif

	}
}


void CMyListCtrl::SetImagePath(int nItem, CString filePath){
	m_mapImg[nItem] = filePath;
}

void CMyListCtrl ::ShowButton(int nItem){
	for (auto i:m_mButton)
	{
		i.second->ShowWindow(SW_HIDE);
#if 0
		if (i.first==nItem)
		{
			CRect rc5;
			GetSubItemRect(nItem, 5, LVIR_BOUNDS, rc5);
			MoveButton(rc5, m_mButton[nItem]);
			i.second->ShowWindow(SW_SHOW);
		}
		else
		{
			i.second->ShowWindow(SW_HIDE);
		}
#endif
	}
}

BOOL CMyListCtrl::OnMouseWheel(UINT nFlags, short zDelta, CPoint pt)
{
	// TODO:  在此添加消息处理程序代码和/或调用默认值
	//ShowButton(-1);

	//updateListCtrlButtonPos();
	return CListCtrl::OnMouseWheel(nFlags, zDelta, pt);
}

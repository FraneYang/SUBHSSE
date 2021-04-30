// VzTreeCtrl.cpp : implementation file
//

#include "stdafx.h"
#include "VzTreeCtrl.h"
#include <atlimage.h>

// VzTreeCtrl

IMPLEMENT_DYNAMIC(VzTreeCtrl, CTreeCtrl)

VzTreeCtrl::VzTreeCtrl()
{

}

VzTreeCtrl::~VzTreeCtrl()
{
}


BEGIN_MESSAGE_MAP(VzTreeCtrl, CTreeCtrl)
ON_WM_PAINT()
ON_NOTIFY_REFLECT(NM_DBLCLK, &VzTreeCtrl::OnNMDblclk)
END_MESSAGE_MAP()



// VzTreeCtrl message handlers

static bool LoadImageFromResource(IN CImage* pImage,
								  IN UINT nResID, 
								  IN LPCSTR lpTyp)
{
	if ( pImage == NULL) return false;
	pImage->Destroy();
	// ������Դ
	HRSRC hRsrc = ::FindResource(AfxGetResourceHandle(), MAKEINTRESOURCE(nResID), lpTyp);
	if (hRsrc == NULL) return false;

	// ������Դ

	HGLOBAL hImgData = ::LoadResource(AfxGetResourceHandle(), hRsrc);
	if (hImgData == NULL)
	{
		::FreeResource(hImgData);
		return false;
	}
	// �����ڴ��е�ָ����Դ

	LPVOID lpVoid    = ::LockResource(hImgData);
	LPSTREAM pStream = NULL;
	DWORD dwSize    = ::SizeofResource(AfxGetResourceHandle(), hRsrc);
	HGLOBAL hNew    = ::GlobalAlloc(GHND, dwSize);
	LPBYTE lpByte    = (LPBYTE)::GlobalLock(hNew);
	::memcpy(lpByte, lpVoid, dwSize);
	// ����ڴ��е�ָ����Դ

	::GlobalUnlock(hNew);

	// ��ָ���ڴ洴��������

	HRESULT ht = ::CreateStreamOnHGlobal(hNew, TRUE, &pStream);
	if ( ht != S_OK )
	{
		GlobalFree(hNew);
	}
	else
	{
		// ����ͼƬ
		pImage->Load(pStream);
		GlobalFree(hNew);
	}
	// �ͷ���Դ
	::FreeResource(hImgData);
	return true;
}


void VzTreeCtrl::OnPaint()
{
	CTreeCtrl::OnPaint();
	CPaintDC dc(this); // device context for painting
	// TODO: Add your message handler code here
	// Do not call CTreeCtrl::OnPaint() for painting messages
	
	HTREEITEM hItem = GetSelectedItem();
	if(hItem == NULL)
		return;
	RECT tRect;
	GetItemRect(hItem, &tRect, 0);
	CDC *pDC = GetWindowDC();
	tRect.left += 2;
	tRect.top += 2;
	tRect.bottom += 2;
	tRect.right += 2;
	pDC->Draw3dRect(&tRect, RGB(0, 125, 255), RGB(0, 125, 255));
	/*CImage image;
	LoadImageFromResource(&image, IDB_PNG_ALARM, _T("PNG") );
	CBitmap bitmap; 
	bitmap.Attach(image.Detach()); 
	CDC memdc;
	memdc.CreateCompatibleDC(pDC);
	memdc.SelectObject(&bitmap);
	pDC->BitBlt(0,0,0,0,&memdc,0,0,SRCCOPY);*/
	ReleaseDC(pDC);	//*/
}

void VzTreeCtrl::OnNMDblclk(NMHDR *pNMHDR, LRESULT *pResult)
{
	// TODO: Add your control notification handler code here
	HTREEITEM hItem = GetSelectedItem();
//	::SendMessage(GetParent()->m_hWnd, WM_USER_NM_DBL_CLK, 0, (LPARAM)hItem);

	*pResult = 0;
}

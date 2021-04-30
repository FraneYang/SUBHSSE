#include "stdafx.h"
#include "ThreadBasic.h"

CThreadBasic::CThreadBasic(void)
{
    m_hEvent       =NULL;
    m_bThreadStart =FALSE;
    m_bThreadLoop  =FALSE;
    m_dwSleep      =1;
    m_dwThreadID   = 0;
}

CThreadBasic::~CThreadBasic(void)
{
}
BOOL CThreadBasic::StartThread(DWORD dwThreadID, DWORD dwSleep, BOOL bLoop)
{
    if( m_bThreadStart )
        return FALSE;

    // @todo �����߳�����ʱ��
    if( dwSleep>0 )
        m_dwSleep = dwSleep;

    // @todo �����߳��Ƿ���ѭ��ģʽ����
    m_bThreadLoop = bLoop;

    // @todo ���ڵ�ǰ�����̵߳ķ�ʽ�޷���ȡ�߳�ID�������ҵ������ID�����ID==0��ʾΪ���ID��
    if( dwThreadID==0 )
        m_dwThreadID = GetTickCount();
    else
        m_dwThreadID = dwThreadID;

    // @todo �����߳�ͬ���¼�
    m_hEvent=CreateEvent(NULL,TRUE,FALSE,NULL);

    // @todo �����̱߳�־
    m_bThreadStart=TRUE;

    // @todo �����߳�
    _beginthreadex(NULL,0,ThreadProc,this,0,NULL);

    return TRUE;
}

BOOL CThreadBasic::StopThread(DWORD dwTimeout,BOOL bDlgThreadMode)
{
    if( !m_bThreadStart )
        return FALSE;

    // @todo ��λ�����߳����б�־
    m_bThreadStart = FALSE;
    
    // @todo �ȴ��߳��˳���ͬ����־
    //::WaitForSingleObject( m_hEvent, dwTimeout );
    //WaitThreadWithHandleMsg(m_hEvent);

	if( bDlgThreadMode )
		WaitThreadWithHandleMsg(m_hEvent);
	else
		::WaitForSingleObject( m_hEvent, dwTimeout );

    // @todo �ͷ��߳�ͬ����־
    if( m_hEvent )
    {
        CloseHandle(m_hEvent);
        m_hEvent=NULL;
    }

    return TRUE;
}

unsigned CThreadBasic::ThreadProc(void* pArguments )
{
    CThreadBasic* pThis = (CThreadBasic*)pArguments;
    if( pThis )
    {
        // @todo ����߳���ѭ��ģʽ���У�����Start��־�������У���StopThread�����߳�ֹͣ��
        // @todo ����̷߳�ѭ��ģʽ���У���һ����ִ����Ϻ��������٣��������StopThread�����߳�ֹͣ��
        if( !pThis->m_bThreadLoop )
        {
            pThis->Run();
        }
        else
        {
            while (pThis->m_bThreadStart)
            {
                 pThis->Run();

                // @todo �߳�ִ��һ�κ�����ָ��ʱ��
                Sleep(pThis->m_dwSleep);
            }
        }

        // @todo �߳�ִ���������ͬ����־��λ
        SetEvent(pThis->m_hEvent);
    }

    // @todo �����߳�ID
    return pThis->m_dwThreadID;
}


int  CThreadBasic::WaitThreadWithHandleMsg(HANDLE hEventThread)
{
	HRESULT        hResult  =  S_FALSE;
	BOOL        bWait  =  TRUE;

	while  (bWait) 
	{
		DWORD dwEvt  =  MsgWaitForMultipleObjects( 1 , & hEventThread,FALSE,INFINITE,QS_ALLINPUT);

		switch (dwEvt) 
		{
		case  WAIT_OBJECT_0:        
			bWait  =   false ;
			hResult  =  TRUE;
			break ;
		case  WAIT_OBJECT_0  +   1 :        
			{
				MSG msg;
				while (::PeekMessage( & msg, NULL,  0 ,  0 , PM_NOREMOVE)) 
				{
					if  (WM_CLOSE  ==  msg.message  ||  WM_QUIT  ==  msg.message) 
					{
						bWait  =   false ;
						break ;
					} 
					else  
					{
						PeekMessage( & msg, NULL,  0 ,  0 , PM_REMOVE);
						TranslateMessage( & msg);
						DispatchMessage( & msg);
					} 
				} 
				break ;
			} 
		default :   //  WAIT_TIMEOUT  WAIT_FAILED 
			bWait  =   false ;
			hResult  =  FALSE;
			break ;
		} 
	}    //  end while 

	return  hResult;
}
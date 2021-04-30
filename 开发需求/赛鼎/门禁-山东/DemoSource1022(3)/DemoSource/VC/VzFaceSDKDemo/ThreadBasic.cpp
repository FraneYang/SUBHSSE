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

    // @todo 设置线程休眠时间
    if( dwSleep>0 )
        m_dwSleep = dwSleep;

    // @todo 设置线程是否以循环模式启动
    m_bThreadLoop = bLoop;

    // @todo 由于当前创建线程的方式无法获取线程ID，因此由业务层管理ID。如果ID==0表示为随机ID。
    if( dwThreadID==0 )
        m_dwThreadID = GetTickCount();
    else
        m_dwThreadID = dwThreadID;

    // @todo 创建线程同步事件
    m_hEvent=CreateEvent(NULL,TRUE,FALSE,NULL);

    // @todo 启动线程标志
    m_bThreadStart=TRUE;

    // @todo 启动线程
    _beginthreadex(NULL,0,ThreadProc,this,0,NULL);

    return TRUE;
}

BOOL CThreadBasic::StopThread(DWORD dwTimeout,BOOL bDlgThreadMode)
{
    if( !m_bThreadStart )
        return FALSE;

    // @todo 复位设置线程运行标志
    m_bThreadStart = FALSE;
    
    // @todo 等待线程退出的同步标志
    //::WaitForSingleObject( m_hEvent, dwTimeout );
    //WaitThreadWithHandleMsg(m_hEvent);

	if( bDlgThreadMode )
		WaitThreadWithHandleMsg(m_hEvent);
	else
		::WaitForSingleObject( m_hEvent, dwTimeout );

    // @todo 释放线程同步标志
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
        // @todo 如果线程以循环模式运行，则以Start标志进行运行，由StopThread控制线程停止；
        // @todo 如果线程非循环模式运行，则一次性执行完毕后自行销毁，无需调用StopThread控制线程停止；
        if( !pThis->m_bThreadLoop )
        {
            pThis->Run();
        }
        else
        {
            while (pThis->m_bThreadStart)
            {
                 pThis->Run();

                // @todo 线程执行一次后，休眠指定时间
                Sleep(pThis->m_dwSleep);
            }
        }

        // @todo 线程执行体结束后，同步标志复位
        SetEvent(pThis->m_hEvent);
    }

    // @todo 返回线程ID
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
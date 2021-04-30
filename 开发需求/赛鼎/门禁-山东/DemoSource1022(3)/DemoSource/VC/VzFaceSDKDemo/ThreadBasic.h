#pragma once
#include <process.h>

/** \file  ThreadBasic.h
 * ʵ����һ���ṩ�����������̻߳��࣬�ܹ�ʵ���Զ����̵߳�ID������ʱ�䣬��ʱʱ�䣬�Ƿ�ѭ��ִ���̵߳����ԣ����ṩ�˻�����������ֹͣ�̵߳ķ���.

 * ʹ�÷������£�
    class CMyThread : public CThreadBasic
    {
    public:
        virtual void Run();
    };

    void CMyThread::Run()
    {
        // code....
    }

    void Main()
    {
        CMyThread* pMyThread = new CMyThread;
        if(pMyThread)
        {
            pMyThread->StartThread();
        }

        pMyThread->StopThread();
        
        delete pMyThread;
        pMyThread=NULL;
    }
 */


/*! \class     CThreadBasic
 *  \brief     �̻߳���
 *  \author    Zhang.W
 *  \version   1.0.0.1
 *  \date      2012-06-07
 *  \bug       NULL.
 *  \warning   NULL.
 */

/*! ��װ�̵߳Ļ��࣬�����̵߳ļ򵥲��� */
class CThreadBasic
{
public:
    CThreadBasic(void);
    ~CThreadBasic(void);

    /*! \fn    BOOL StartThread(DWORD dwThreadID=0, DWORD dwSleep=1, DWORD dwTimeout=INFINITE, BOOL bLoop=TRUE)
    *  \brief  �����߳�
    *  \param  dwThreadID �߳�ID; 0��ʾ���ID���ڲ��Զ�����ID. Ĭ��ֵΪ0.
    *  \param  dwSleep    ����ʱ��; ��λ���룬�̼߳���������е�ʱ��Ĭ��ֵΪ1.
    *  \param  bLoop      �Ƿ�ѭ���������߳����������Ƿ�ѭ��ִ�е�����.
    *  \return �ɹ�����TRUE; ���򷵻�FALSE.
    */
    BOOL StartThread(DWORD dwThreadID=0, DWORD dwSleep=1, BOOL bLoop=TRUE);
    /*! \fn    BOOL StopThread()
    *  \brief  ֹͣ�߳�
    *  \param  dwTimeout  ��ʱʱ�䣻��λ���룬�߳��˳�ʱ�ȴ�ʱ�䣬Ĭ��ֵINFINITE(���޵ȴ�).
    *  \return �ɹ�����TRUE; ���򷵻�FALSE.
    */
    BOOL StopThread(DWORD dwTimeout=INFINITE, BOOL bDlgThreadMode=FALSE);
    /*! \fn    virtual void Run()=0
    *  \brief  �߳�ִ���壬�麯�����ɼ̳�������ʵ������.
    *  \return ��.
    */
    virtual void Run()=0;

private:
    /*! \fn    static unsigned __stdcall ThreadProc(void* pArguments )
    *  \brief  �߳��庯����˽�еľ�̬����.
    *  \param  pArguments  ������ָ��.
    *  \return �����߳�ID
    */
    static unsigned __stdcall ThreadProc(void* pArguments );
	int  WaitThreadWithHandleMsg(HANDLE hEventThread);
private:
    /*! �߳�ͬ���ź� */
    HANDLE           m_hEvent;
    /*! �߳�����/ֹͣ��־ */
    BOOL             m_bThreadStart;
    /*! �߳��Ƿ�ѭ��ִ�б�־ */
    BOOL             m_bThreadLoop;
    /*! �߳�����ʱ�䣬��λ���� */
    DWORD            m_dwSleep;
    /*! �߳�ID */
    DWORD            m_dwThreadID;
};

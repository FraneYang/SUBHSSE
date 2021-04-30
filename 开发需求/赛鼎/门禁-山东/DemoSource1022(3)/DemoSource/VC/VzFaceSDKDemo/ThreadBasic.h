#pragma once
#include <process.h>

/** \file  ThreadBasic.h
 * 实现了一个提供基本操作的线程基类，能够实现自定义线程的ID，休眠时间，超时时间，是否循环执行线程等属性；并提供了基本的启动和停止线程的方法.

 * 使用方法如下：
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
 *  \brief     线程基类
 *  \author    Zhang.W
 *  \version   1.0.0.1
 *  \date      2012-06-07
 *  \bug       NULL.
 *  \warning   NULL.
 */

/*! 封装线程的基类，用于线程的简单操作 */
class CThreadBasic
{
public:
    CThreadBasic(void);
    ~CThreadBasic(void);

    /*! \fn    BOOL StartThread(DWORD dwThreadID=0, DWORD dwSleep=1, DWORD dwTimeout=INFINITE, BOOL bLoop=TRUE)
    *  \brief  启动线程
    *  \param  dwThreadID 线程ID; 0表示随机ID，内部自动分配ID. 默认值为0.
    *  \param  dwSleep    休眠时间; 单位毫秒，线程间隔两次运行的时间差，默认值为1.
    *  \param  bLoop      是否循环；决定线程体运行体是否循环执行的属性.
    *  \return 成功返回TRUE; 否则返回FALSE.
    */
    BOOL StartThread(DWORD dwThreadID=0, DWORD dwSleep=1, BOOL bLoop=TRUE);
    /*! \fn    BOOL StopThread()
    *  \brief  停止线程
    *  \param  dwTimeout  超时时间；单位毫秒，线程退出时等待时间，默认值INFINITE(无限等待).
    *  \return 成功返回TRUE; 否则返回FALSE.
    */
    BOOL StopThread(DWORD dwTimeout=INFINITE, BOOL bDlgThreadMode=FALSE);
    /*! \fn    virtual void Run()=0
    *  \brief  线程执行体，虚函数，由继承类重载实现内容.
    *  \return 无.
    */
    virtual void Run()=0;

private:
    /*! \fn    static unsigned __stdcall ThreadProc(void* pArguments )
    *  \brief  线程体函数，私有的静态函数.
    *  \param  pArguments  上下文指针.
    *  \return 返回线程ID
    */
    static unsigned __stdcall ThreadProc(void* pArguments );
	int  WaitThreadWithHandleMsg(HANDLE hEventThread);
private:
    /*! 线程同步信号 */
    HANDLE           m_hEvent;
    /*! 线程启动/停止标志 */
    BOOL             m_bThreadStart;
    /*! 线程是否循环执行标志 */
    BOOL             m_bThreadLoop;
    /*! 线程休眠时间，单位毫秒 */
    DWORD            m_dwSleep;
    /*! 线程ID */
    DWORD            m_dwThreadID;
};

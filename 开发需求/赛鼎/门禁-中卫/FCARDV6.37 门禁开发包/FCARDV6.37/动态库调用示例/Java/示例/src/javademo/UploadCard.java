/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//上传卡片
package javademo;

import Net.PC15.Command.CommandDetial;
import Net.PC15.Command.INCommand;
import Net.PC15.Command.INCommandResult;
import Net.PC15.Connector.*;
import Net.PC15.Connector.TCPClient.TCPClientDetial;
import Net.PC15.Connector.TCPServer.TCPServerClientDetial;
import Net.PC15.Data.INData;
import Net.PC15.FC8800.Command.Card.ClearCardDataBase;
import Net.PC15.FC8800.Command.Card.Parameter.ClearCardDataBase_Parameter;
import Net.PC15.FC8800.Command.Card.Parameter.WriteCardListBySequence_Parameter;
import Net.PC15.FC8800.Command.Card.Parameter.WriteCardListBySort_Parameter;
import Net.PC15.FC8800.Command.Card.WriteCardListBySequence;
import Net.PC15.FC8800.Command.Card.WriteCardListBySort;
import Net.PC15.FC8800.Command.Data.CardDetail;
import Net.PC15.FC8800.Command.Data.FC8800WatchTransaction;
import Net.PC15.FC8800.Command.System.SearchEquptOnNetNum;
import Net.PC15.FC8800.FC8800Identity;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author 吕广论1
 */
public class UploadCard implements INConnectorEvent {

    @Override
    public void ClientOnline(TCPServerClientDetial client) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void ClientOffline(TCPServerClientDetial client) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void CommandCompleteEvent(INCommand cmd, INCommandResult result) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void CommandProcessEvent(INCommand cmd) {
        try {
            StringBuilder strBuf = new StringBuilder(100);
            strBuf.append("<html>");
            strBuf.append("当前命令：");
            //strBuf.append(GetCommandName(cmd));
            strBuf.append("<br/>正在处理： ");
            strBuf.append(cmd.getProcessStep());
            strBuf.append(" / ");
            strBuf.append(cmd.getProcessMax());
            strBuf.append("</html>");
            strBuf = null;
        } catch (Exception e) {
            System.out.println("fcardiodemo.frmMain.CommandProcessEvent() -- 发生错误：" + e.toString());
        }

    }

    @Override
    public void ConnectorErrorEvent(INCommand cmd, boolean isStop) {
        try {
            StringBuilder strBuf = new StringBuilder(100);
            if (isStop) {
                strBuf.append("命令已手动停止!");
            } else {
                strBuf.append("网络连接失败!");
            };
            strBuf = null;
        } catch (Exception e) {
            System.out.println("fcardiodemo.frmMain.ConnectorErrorEvent() --- " + e.toString());
        }

    }

    @Override
    public void ConnectorErrorEvent(ConnectorDetial detial) {
        try {
            StringBuilder strBuf = new StringBuilder(100);
            strBuf.append("网络通道故障，IP信息：");
            strBuf = null;
        } catch (Exception e) {
            System.out.println("fcardiodemo.frmMain.ConnectorErrorEvent() -- " + e.toString());
        }

    }

    @Override
    public void CommandTimeout(INCommand cmd) {
        try {
            if (cmd instanceof SearchEquptOnNetNum) {
                return;
            }
            StringBuilder strBuf = new StringBuilder(100);
            strBuf.append("命令超时，已失败！");
            strBuf = null;
        } catch (Exception e) {
            System.out.println("fcardiodemo.frmMain.CommandTimeout() -- " + e.toString());
        }

    }

    @Override
    public void PasswordErrorEvent(INCommand cmd) {
        try {
            StringBuilder strBuf = new StringBuilder(100);
            strBuf.append("通讯密码错误，已失败！");
            strBuf = null;
        } catch (Exception e) {
            System.out.println("fcardiodemo.frmMain.PasswordErrorEvent() -- " + e.toString());
        }

    }

    @Override
    public void ChecksumErrorEvent(INCommand cmd) {
        try {
            StringBuilder strBuf = new StringBuilder(100);
            strBuf.append("命令返回的校验和错误，已失败！");
            strBuf = null;
        } catch (Exception e) {
            System.out.println("fcardiodemo.frmMain.ChecksumErrorEvent() -- " + e.toString());
        }

    }

    @Override
    public void WatchEvent(ConnectorDetial detial, INData event) {
        try {
            StringBuilder strBuf = new StringBuilder(100);
            strBuf.append("数据监控:");

            if (event instanceof FC8800WatchTransaction) {
                FC8800WatchTransaction WatchTransaction = (FC8800WatchTransaction) event;
                strBuf.append("，SN：");
                strBuf.append(WatchTransaction.SN);
                strBuf.append("\n");
            } else {
                strBuf.append("，未知事件：");
                strBuf.append(event.getClass().getName());
            }
            strBuf = null;

        } catch (Exception e) {
            System.out.println("fcardiodemo.frmMain.WatchEvent() -- " + e.toString());
        }
    }
    private ConnectorAllocator _Allocator;

    public UploadCard(ConnectorAllocator global) {
        if (global != null) {
            _Allocator = global;
        }else {
            System.out.println("命令对象不能为空");
            return;
        }
        
        //添加监听
        _Allocator.AddListener(this);
    }
    //非排序区
    public void UploadCardList(){
        CommandDetial commandDetial = new CommandDetial();
        commandDetial.Timeout=8000;//此函数超时时间设定长一些
        TCPClientDetial tcpClientDetial = new TCPClientDetial("192.168.1.126",8000);
        
        commandDetial.Connector = tcpClientDetial;
        commandDetial.Identity = new FC8800Identity("MC-5824T25070244","FFFFFFFF",E_ControllerType.FC8800);
        //创建卡片列表对象
        ArrayList<CardDetail> mCardList = new ArrayList<>();
        //创建卡片
        CardDetail cd = new CardDetail(2345678);
        cd.Password = "8888";
        Calendar CardExpiry = Calendar.getInstance();
        CardExpiry.setTime(new Date(2018,2, 28));
        cd.Expiry = CardExpiry;
        cd.OpenTimes = 5;
        cd.CardStatus = 0;
        cd.SetDoor(1, true);
        cd.SetDoor(2,true);
        cd.SetNormal();//设定卡片没有特权
        cd.HolidayUse = true;//设定受节假日限制。
        mCardList.add(cd);
        WriteCardListBySequence_Parameter par = new WriteCardListBySequence_Parameter(commandDetial, mCardList);
        WriteCardListBySequence cmd = new WriteCardListBySequence(par);
        //添加命令到队列
        _Allocator.AddCommand(cmd);
    }
    //排序区
    public void UploadSortCardList(){
        //创建连接信息对象
        CommandDetial commandDetial = new CommandDetial();
        commandDetial.Timeout=8000;//此函数超时时间设定长一些
        TCPClientDetial tcpClientDetial = new TCPClientDetial("192.168.1.126",8000);
        commandDetial.Connector = tcpClientDetial;
        //commandDetial.Timeout = 10000;
        commandDetial.Identity = new FC8800Identity("MC-5824T25070244","FFFFFFFF",E_ControllerType.FC8800);
        ArrayList<CardDetail> mCardList = new ArrayList<>();
        //创建卡片信息
        CardDetail cd = new CardDetail(8765432);
        cd.Password = "88888888";
        Calendar CardExpiry = Calendar.getInstance();
        CardExpiry.setTime(new Date(2018,2, 28));
        cd.Expiry = CardExpiry;
        cd.OpenTimes = 5;
        cd.CardStatus = 0;
        //cd.Expiry = 
        cd.SetDoor(1, true);
        cd.SetDoor(2,true);
        cd.SetNormal();//设定卡片没有特权
        cd.HolidayUse = true;//设定受节假日限制。
        mCardList.add(cd);
        WriteCardListBySort_Parameter par = new WriteCardListBySort_Parameter(commandDetial, mCardList);
        WriteCardListBySort cmd = new WriteCardListBySort(par);
        //添加命令到队列
        _Allocator.AddCommand(cmd);
    }
    //清空卡片列表
    public void ClearCards(){
        //创建连接信息对象
        CommandDetial commandDetial = new CommandDetial();
        TCPClientDetial tcpClientDetial = new TCPClientDetial("192.168.1.126",8000);        
        commandDetial.Connector = tcpClientDetial;
        //commandDetial.Timeout = 10000;
        commandDetial.Identity = new FC8800Identity("MC-5824T25070244","FFFFFFFF",E_ControllerType.FC8800);
        commandDetial.Timeout = 5000;
        ClearCardDataBase_Parameter par = new ClearCardDataBase_Parameter(commandDetial, 3);
        ClearCardDataBase cmd = new ClearCardDataBase(par);
        //添加命令到队列
        _Allocator.AddCommand(cmd);
    }
    
}

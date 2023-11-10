/* Generated by Together */
/*
	Class OuterServer，负责与GateServer的连接管理和通信
	注意：OuterServer纯粹是一个Struct的结构，全局性的数据请添加入GameServerApp类，不要添加入这个类
*/
#ifndef OUTERSERVER_H
#define OUTERSERVER_H
#include "ThreadPool.h"
#include "CommRPC.h"
#include "PacketQueue.h"
#include "NetCommand.h"
#include "GameApp.h"

_DBC_USING

class OuterServer : public TcpServerApp, public RPCMGR, public PKQueue {
	friend class ToGateServer;

public:
	OuterServer(ThreadPool* proc, ThreadPool* comm);
	~OuterServer();

private:
	void ProcessData(DataSocket* datasock, RPacket recvbuf);
	WPacket ServeCall(DataSocket* datasock, RPacket in_para);

	bool OnConnect(DataSocket* datasock);				 //返回值:true-允许连接,false-不允许连接
	void OnDisconnect(DataSocket* datasock, int reason); //reason值:0-本地程序正常退出；-3-网络被对方关闭；-1-Socket错误;-5-包长度超过限制。
	void OnProcessData(DataSocket* datasock, RPacket recvbuf);
	WPacket OnServeCall(DataSocket* datasock, RPacket in_para) {
		if (in_para.ReadCmd() == CMD_TM_PING)
			return in_para;
		else
			return SyncPK(datasock, in_para);
	}

	long m_count; //调用计数器
	Mutex m_mutdisc;
};

class ToGateServer : public Task {
public:
	ToGateServer() { dwTimeOut = 3000; }

private:
	virtual long Process();
	DWORD dwTimeOut;
};

//extern OuterServer * g_gmout;
extern char g_szConnectLog[256];

#endif //OUTERSERVER_H

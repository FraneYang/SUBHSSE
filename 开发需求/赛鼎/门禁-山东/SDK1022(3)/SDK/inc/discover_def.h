#ifndef IPSCAN_DEF_H
#define IPSCAN_DEF_H

#include "cross_def.h"

#define MCAST_PORT 22100
#define MCAST_IP_D "228.5.6.2"

#define  MSG_PACKET_PROGRESS				3001
#define  MSG_PACKET_ADVANCE					3002
#define  MSG_PACKET_CMCAST					3003
#define  MSG_PACKET_CMCAST_ACK				3004
#define  MSG_PACKET_IPSET                   3005


struct ipscan_t
{
	//mac 地址
    char mac[20];
	//IP
    char ip[20];
    char netmask[20];
	//制造商
    char manufacturer[16];
    char platform[32];
    char system[32];
    char version[64];
	//设备类型  人脸设备  类型为100
	int usr_type;
};

struct ipset_t
{
    char mac[20];
    char ip[20];
    char netmask[20];
    char gateway[20];
};

typedef void(SDK_CALL* discover_ipscan_cb_t)(const struct ipscan_t* ipscan,
                                             size_int usr_param);

#endif


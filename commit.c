//
//  commit.c
//  WebCamilo
//
//  Created by camilo on 1/29/24.
//  Copyright © 2024 camilo. All rights reserved.
//

#include "commit.h"
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <netinet/in.h>
#include <net/if.h>

int _interfaceAddressForName(char* interfaceName, struct sockaddr* interfaceAddress) {

    struct ifreq ifr;
    int fd = socket(AF_INET, SOCK_DGRAM, 0);
    ifr.ifr_addr.sa_family = AF_INET;

    strncpy(ifr.ifr_name, interfaceName, IFNAMSIZ-1);

    int ioctl_res;
    if ( (ioctl_res = ioctl(fd, SIOCGIFADDR, &ifr)) < 0){
        return ioctl_res;
    }

    close(fd);
    memcpy(interfaceAddress, &ifr.ifr_addr, sizeof(struct sockaddr));
    return 0;
}
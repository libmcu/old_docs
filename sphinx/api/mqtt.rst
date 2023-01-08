MQTT
====

.. uml::
    :caption: A Class Diagram

     enum mqtt_event_type {
    	MQTT_EVT_CONNACK
    	MQTT_EVT_DISCONNECT
    	MQTT_EVT_PUBLISH
    	MQTT_EVT_PUBACK /' Acknowledgment for published message with QoS 1. '/
    	MQTT_EVT_PUBREC /' Reception confirmation for published message with QoS 2. '/
    	MQTT_EVT_PUBREL /' Release of published message with QoS 2. '/
    	MQTT_EVT_PUBCOMP /' Confirmation to a publish release message with QoS 2. '/
    	MQTT_EVT_SUBACK
    	MQTT_EVT_UNSUBACK
    	MQTT_EVT_PINGRESP
    }
    
    struct mqtt_conn_params {
    	client_id
    	username
    	userpass
    	will
    	keepalive
    }
    
    struct mqtt_topic {
    	const uint8_t *pathname
    	size_t pathname_len
    	uint8_t qos
    }
    
    struct mqtt_payload {
    	const uint8_t *data
    	size_t data_len
    }
    
    struct mqtt_message {
    	struct mqtt_topic topic
    	struct mqtt_payload payload
    	uint16_t id
    }
    
    struct mqtt_subscription_list {
    	struct mqtt_topic *list
    	uint16_t count
    	uint16_t id
    }
    
    struct mqtt_event {
    	struct mqtt_message message
    	enum mqtt_event_type type
    }
    
    class mqtt_client {
    	const struct transport_interface *transport
    
    	int mqtt_client_init(struct mqtt_client *client, mqtt_event_callback_t event_callback)
    	int mqtt_connect(struct mqtt_client *client, struct mqtt_conn_params *params)
    	int mqtt_disconnect(struct mqtt_client *client)
    	int mqtt_publish(struct mqtt_client *client, const struct mqtt_message *msg)
    	int mqtt_subscribe(struct mqtt_client *client, const struct mqtt_subscription_list *params)
    	int mqtt_unsubscribe(struct mqtt_client *client, const struct mqtt_subscription_list *params)
    	int mqtt_step(struct mqtt_client *client)
    
    	void (*mqtt_event_callback_t)(struct mqtt_client *client, struct mqtt_event *event)
    }

.. doxygenfile:: pmqtt/include/pmqtt/mqtt.h
   :project: libmcu
   :sections: func typedef innerclass public-attrib enum define

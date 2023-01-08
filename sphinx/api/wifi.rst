WiFi
====

.. uml::
    :caption: A Class Diagram

    struct WifiInfo {
    	uint8_t ssid[]
    	uint8_t ssid_len
    	uint8_t mac[]
    	uint8_t mac_len
    	int8_t rssi
    	uint8_t band
    	uint8_t channel
    	uint8_t security
    	uint8_t mfp /* management frame protection */
    }
    
    struct WifiConf {
    	uint8_t *ssid
    	uint8_t ssid_len
    	uint8_t *psk
    	uint8_t psk_len
    	uint8_t *sae
    	uint8_t sae_len
    	uint8_t band
    	uint8_t channel
    	uint8_t security
    	uint8_t mfp
    	int timeout_ms
    }
    
    enum WifiEvent {
    	WIFI_EVENT_CONNECT_RESULT
    	WIFI_EVENT_DISCONNECT_RESULT
    	WIFI_EVENT_SCAN_RESULT
    	WIFI_EVENT_SCAN_DONE
    	WIFI_EVENT_AP_ACTIVATE_RESULT
    	WIFI_EVENT_AP_DEACTIVATE_RESULT
    }
    
    enum WifiSecurity {
    	WIFI_SEC_TYPE_PSK
    	WIFI_SEC_TYPE_PSK_SHA256
    	WIFI_SEC_TYPE_PSK_SAE
    }
    
    enum WifiMfp {
    	WIFI_MFP_DISABLED
    	WIFI_MFP_OPTIONAL
    	WIFI_MFP_REQUIRED
    }
    
    enum WifiFreqBand {
    	WIFI_FREQ_BAND_2_4_GHZ
    	WIFI_FREQ_BAND_5_GHZ
    	WIFI_FREQ_BAND_6_GHZ
    }
    
    enum WifiMode {
    	WIFI_MODE_INFRA
    	WIFI_MODE_AP
    	WIFI_MODE_MESH
    }
    
    enum WifiLinkMode {
    	WIFI_LM_80211
    	WIFI_LM_80211_b
    	WIFI_LM_80211_a
    	WIFI_LM_80211_g
    	WIFI_LM_80211_n_HT
    	WIFI_LM_80211_ac_VHT
    	WIFI_LM_80211_ax_HE
    	WIFI_LM_80211_ax_6_GHZ_HE
    	WIFI_LM_80211_BE_EHT
    }
    
    interface Wifi {
    	wifi_connect(handle, struct WifiConf)
    	wifi_disconnect(handle)
    	wifi_scan(handle)
    	wifi_activate_ap(handle)
    	wifi_deactivate_ap(handle)
    	wifi_add_event_callback(handle, cb)
    }

.. doxygenfile:: pwifi/include/pwifi/wifi.h
   :project: libmcu
   :sections: func typedef innerclass public-attrib enum define
.. doxygenfile:: pwifi/include/pwifi/wifi_interface.h
   :project: libmcu
   :sections: func typedef innerclass public-attrib enum define

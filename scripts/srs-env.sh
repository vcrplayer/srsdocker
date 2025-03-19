#!/bin/bash
chmod 777 /data/server.cfg
# Function to update config value
update_config() {
    local key=$1
    local value=$2
    local config_file="/data/server.cfg"
    
    # Escape special characters for sed
    value=$(echo "$value" | sed 's/[\/&]/\\&/g')
    
    # Check if the key exists in the file
    if grep -q "^${key}=" "$config_file"; then
        # Update the value
        sed -i "s/^${key}=.*/${key}=${value}/" "$config_file"
        echo "Updated ${key} to ${value}"
    else
        echo "Warning: Key ${key} not found in config file"
    fi
}

# Check and update server IP if env var exists
if [ ! -z "$SRS_SERVER_IP" ]; then
    update_config "SERVER_IP" "$SRS_SERVER_IP"
fi

# Check and update server port if env var exists 
if [ ! -z "$SRS_SERVER_PORT" ]; then
    update_config "SERVER_PORT" "$SRS_SERVER_PORT"
fi

# Check and update UPNP setting if env var exists
if [ ! -z "$SRS_UPNP_ENABLED" ]; then
    update_config "UPNP_ENABLED" "$SRS_UPNP_ENABLED"
fi

# Check and update coalition security if env var exists
if [ ! -z "$SRS_COALITION_SECURITY" ]; then
    update_config "COALITION_AUDIO_SECURITY" "$SRS_COALITION_SECURITY"
fi

# Check and update LOS setting if env var exists
if [ ! -z "$SRS_LOS_ENABLED" ]; then
    update_config "LOS_ENABLED" "$SRS_LOS_ENABLED"
fi

# Check and update distance setting if env var exists
if [ ! -z "$SRS_DISTANCE_ENABLED" ]; then
    update_config "DISTANCE_ENABLED" "$SRS_DISTANCE_ENABLED"
fi

# Check and update radio encryption if env var exists
if [ ! -z "$SRS_ALLOW_RADIO_ENCRYPTION" ]; then
    update_config "ALLOW_RADIO_ENCRYPTION" "$SRS_ALLOW_RADIO_ENCRYPTION"
fi

# Check and update strict radio encryption if env var exists
if [ ! -z "$SRS_STRICT_RADIO_ENCRYPTION" ]; then
    update_config "STRICT_RADIO_ENCRYPTION" "$SRS_STRICT_RADIO_ENCRYPTION"
fi

# Check and update radio expansion if env var exists
if [ ! -z "$SRS_RADIO_EXPANSION" ]; then
    update_config "RADIO_EXPANSION" "$SRS_RADIO_EXPANSION"
fi


# Check and update show tuned count if env var exists
if [ ! -z "$SRS_SHOW_TUNED_COUNT" ]; then
    update_config "SHOW_TUNED_COUNT" "$SRS_SHOW_TUNED_COUNT"
fi


# Check and update radio effect override if env var exists
if [ ! -z "$SRS_RADIO_EFFECT_OVERRIDE" ]; then
    update_config "RADIO_EFFECT_OVERRIDE" "$SRS_RADIO_EFFECT_OVERRIDE"
fi



# Check and update show transmitter name if env var exists
if [ ! -z "$SRS_SHOW_TRANSMITTER_NAME" ]; then
    update_config "SHOW_TRANSMITTER_NAME" "$SRS_SHOW_TRANSMITTER_NAME"
fi


# Check and update retransmission node limit if env var exists
if [ ! -z "$SRS_RETRANSMISSION_NODE_LIMIT" ]; then
    update_config "RETRANSMISSION_NODE_LIMIT" "$SRS_RETRANSMISSION_NODE_LIMIT"
fi


# Check and update client export file path if env var exists
if [ ! -z "$SRS_CLIENT_EXPORT_FILE_PATH" ]; then
    update_config "CLIENT_EXPORT_FILE_PATH" "$SRS_CLIENT_EXPORT_FILE_PATH"
fi


# Check and update check for beta updates if env var exists
if [ ! -z "$SRS_CHECK_FOR_BETA_UPDATES" ]; then
    update_config "CHECK_FOR_BETA_UPDATES" "$SRS_CHECK_FOR_BETA_UPDATES"
fi


# Check and update external AWACS mode settings if env vars exist
if [ ! -z "$SRS_EXTERNAL_AWACS_MODE_BLUE_PASSWORD" ]; then
    update_config "EXTERNAL_AWACS_MODE_BLUE_PASSWORD" "$SRS_EXTERNAL_AWACS_MODE_BLUE_PASSWORD"
fi


# Check and update external AWACS mode settings if env vars exist
if [ ! -z "$SRS_EXTERNAL_AWACS_MODE_RED_PASSWORD" ]; then
    update_config "EXTERNAL_AWACS_MODE_RED_PASSWORD" "$SRS_EXTERNAL_AWACS_MODE_RED_PASSWORD"
fi

# Check and update transmission log if env var exists
if [ ! -z "$SRS_TRANSMISSION_LOG_ENABLED" ]; then
    update_config "TRANSMISSION_LOG_ENABLED" "$SRS_TRANSMISSION_LOG_ENABLED"
fi

# Check and update client export if env var exists
if [ ! -z "$SRS_CLIENT_EXPORT_ENABLED" ]; then
    update_config "CLIENT_EXPORT_ENABLED" "$SRS_CLIENT_EXPORT_ENABLED"
fi

# Check and update test frequencies if env var exists
if [ ! -z "$SRS_TEST_FREQUENCIES" ]; then
    update_config "TEST_FREQUENCIES" "$SRS_TEST_FREQUENCIES"
fi

# Check and update LOTATC export if env var exists
if [ ! -z "$SRS_LOTATC_EXPORT_ENABLED" ]; then
    update_config "LOTATC_EXPORT_ENABLED" "$SRS_LOTATC_EXPORT_ENABLED"
fi

# Check and update global lobby frequencies if env var exists
if [ ! -z "$SRS_GLOBAL_LOBBY_FREQUENCIES" ]; then
    update_config "GLOBAL_LOBBY_FREQUENCIES" "$SRS_GLOBAL_LOBBY_FREQUENCIES"
fi

# Check and update external AWACS mode if env var exists
if [ ! -z "$SRS_EXTERNAL_AWACS_MODE" ]; then
    update_config "EXTERNAL_AWACS_MODE" "$SRS_EXTERNAL_AWACS_MODE"
fi

# Check and update spectators audio disabled if env var exists
if [ ! -z "$SRS_SPECTATORS_AUDIO_DISABLED" ]; then
    update_config "SPECTATORS_AUDIO_DISABLED" "$SRS_SPECTATORS_AUDIO_DISABLED"
fi

# Check and update IRL radio TX if env var exists
if [ ! -z "$SRS_IRL_RADIO_TX" ]; then
    update_config "IRL_RADIO_TX" "$SRS_IRL_RADIO_TX"
fi

# Check and update IRL radio RX interference if env var exists
if [ ! -z "$SRS_IRL_RADIO_RX_INTERFERENCE" ]; then
    update_config "IRL_RADIO_RX_INTERFERENCE" "$SRS_IRL_RADIO_RX_INTERFERENCE"
fi

# Check and update transmission log retention if env var exists
if [ ! -z "$SRS_TRANSMISSION_LOG_RETENTION" ]; then
    update_config "TRANSMISSION_LOG_RETENTION" "$SRS_TRANSMISSION_LOG_RETENTION"
fi

# Check and update external AWACS mode if env var exists
if [ ! -z "$SRS_EXTERNAL_AWACS_MODE" ]; then
    update_config "EXTERNAL_AWACS_MODE" "$SRS_EXTERNAL_AWACS_MODE"
fi



echo "Configuration updated"
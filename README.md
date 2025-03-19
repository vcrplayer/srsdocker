# SRS Docker Container
Docker Image and scripts for a linux-based docker container for SRS (Simple Radio Standalone) that can be fully unmanaged.

Original SRS project: https://github.com/ciribob/DCS-SimpleRadioStandalone

Also inspired from https://github.com/deephack1982/srs-docker

To Build:

```
docker build -t srsserver:latest .
```

To Run:
```
docker compose up or docker compose up -d
```

Initial Startup takes a very long time, as it has to initialize wine prerequisites such as dotnet. After initial startup, semaphores are set and the container should restart much faster.

you can modify the server.cfg directly after initially running the container (and mounting /data), but if you set environment variables, they will take precedence and overwrite the server.cfg

## Possible Environment Variables:
- VNC_PASSWORD: VNC password
- SRS_SERVER_IP: Server IP address
- SRS_SERVER_PORT: Server port number
- SRS_UPNP_ENABLED: Enable/disable UPNP
- SRS_COALITION_SECURITY: Enable/disable coalition audio security
- SRS_LOS_ENABLED: Enable/disable Line of Sight checks
- SRS_DISTANCE_ENABLED: Enable/disable distance effects
- SRS_ALLOW_RADIO_ENCRYPTION: Allow radio encryption
- SRS_STRICT_RADIO_ENCRYPTION: Enable strict radio encryption
- SRS_RADIO_EXPANSION: Enable radio expansion
- SRS_SHOW_TUNED_COUNT: Show number of clients tuned to frequencies
- SRS_RADIO_EFFECT_OVERRIDE: Override radio effects
- SRS_SHOW_TRANSMITTER_NAME: Show transmitter names
- SRS_RETRANSMISSION_NODE_LIMIT: Set retransmission node limit
- SRS_CLIENT_EXPORT_FILE_PATH: Path for client export file
- SRS_CHECK_FOR_BETA_UPDATES: Check for beta updates
- SRS_EXTERNAL_AWACS_MODE_BLUE_PASSWORD: Blue team AWACS mode password
- SRS_EXTERNAL_AWACS_MODE_RED_PASSWORD: Red team AWACS mode password
- SRS_TRANSMISSION_LOG_ENABLED: Enable transmission logging
- SRS_CLIENT_EXPORT_ENABLED: Enable client export
- SRS_TEST_FREQUENCIES: Set test frequencies
- SRS_LOTATC_EXPORT_ENABLED: Enable LOTATC export
- SRS_GLOBAL_LOBBY_FREQUENCIES: Set global lobby frequencies
- SRS_EXTERNAL_AWACS_MODE: Enable external AWACS mode
- SRS_SPECTATORS_AUDIO_DISABLED: Disable audio for spectators
- SRS_IRL_RADIO_TX: Enable IRL radio transmission
- SRS_IRL_RADIO_RX_INTERFERENCE: Enable IRL radio interference
- SRS_TRANSMISSION_LOG_RETENTION: Set transmission log retention period

## Ports
- 5900: VNC
- 5002: SRS

## Volumes
- /data: SRS data directory
- /wine: Wine prefix directory (this doesn't need to be mounted, but if you want to use your own wine prefix, you can mount it here)


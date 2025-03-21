# SRS Docker Container
Docker Image and scripts for a linux-based docker container for SRS (Simple Radio Standalone) that can be fully unmanaged.

Original SRS project: https://github.com/ciribob/DCS-SimpleRadioStandalone

Also inspired by https://github.com/deephack1982/srs-docker


## To use Docker Hub Image:
https://hub.docker.com/r/vcrplayer01/srs
```
docker pull vcrplayer01/srs:latest
```

To Build:

```
docker build -t srsserver:latest .
```

To Run:
```
docker compose up or docker compose up -d
```
in order to view the log state of the initial install, you can run
```
docker compose logs -f
```

Initial Startup takes a very long time (up to 10 minutes on some devices), as it has to initialize wine prerequisites such as dotnet. After initial startup, semaphores are set and the container should restart much faster.

you can modify the server.cfg directly after initially running the container (and mounting /data), but if you set environment variables, they will take precedence and overwrite the server.cfg before application startup.

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
- 5900/tcp: VNC (not required for headless operation, but can be used to debug)
- 5002/tcp: SRS
- 5002/udp: SRS

## Volumes
- /data: SRS data directory
- /wine: Wine prefix directory (this doesn't need to be mounted, but if you want to use your own wine prefix, you can mount it here)


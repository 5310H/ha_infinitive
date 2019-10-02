# ha_infinitive
Carrier Infinitive interface addon for Home Assistant.

This is a Home Assistant addon of the "infinitive" program so the Carrier Infinitive service can run in a HASSIO environment.

Credit to all the great work of 'acd' and 'will1604' for without it this Addon would not be possible.

Since there are only two machine version of the 'infinitive', amd64 and arm, the build used a wget of https://github.com/acd/infinitive/releases/download/v0.2/ to retreive the correct version.  If for some reason the ACD github is not available the infinitive binaries are located in the data directory and would require changes to the Dockerfile.  Simply comment out the COPY statements and comment the RUN if statement.


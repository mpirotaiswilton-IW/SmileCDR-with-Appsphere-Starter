# Use base Smile CDR image as parent image. Change this if the field entry does not match your local SmileCDR image
FROM <imagename>:<imagetag>

RUN mkdir /home/smile/smilecdr/activemq-data
RUN mkdir /home/smile/smilecdr/database
RUN mkdir /home/smile/smilecdr/log
RUN mkdir /home/smile/smilecdr/tmp
RUN chown -R smile:smile /home/smile/smilecdr/activemq-data
RUN chown -R smile:smile /home/smile/smilecdr/database
RUN chown -R smile:smile /home/smile/smilecdr/log
RUN chown -R smile:smile /home/smile/smilecdr/tmp
RUN chmod 775 /home/smile/smilecdr/activemq-data
RUN chmod 775 /home/smile/smilecdr/database
RUN chmod 775 /home/smile/smilecdr/log
RUN chmod 775 /home/smile/smilecdr/tmp

# Set working directory
WORKDIR /home/smile/smilecdr/classes

# Copy and customize properties files depending on environment.
COPY --chown=smile:smile ./cdr-config-Master.properties ./

# Copy and customize properties files depending on environment.
COPY --chown=smile:smile ./config_seeding/ ./config_seeding/

FROM fineplace/hadoop2.x-base

COPY hadoop-entrypoint.sh /usr/bin/
RUN chmod a+x /usr/bin/hadoop-entrypoint.sh

ENTRYPOINT [ "sh", "-c", "./usr/bin/hadoop-entrypoint.sh; bash"]

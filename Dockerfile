FROM mfocchi/trento_lab_framework@sha256:ef11accaab066aecf71515a3eaca1308ce48bb81445ffba104602dd4b054a11c
USER ${NB_UID}
RUN pip3 install --no-cache-dir --upgrade pip &&\
    pip3 install --no-cache-dir jupyter &&\
    pip3 install --no-cache-dir jupyterlab &&\
    pip3 install --no-cache-dir --upgrade jupyter_core jupyter_client
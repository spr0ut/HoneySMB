FROM ubuntu:18.04

RUN apt-get update -y && apt-get install python2.7 -y
RUN apt-get install python tcpdump python-pip -y
RUN apt-get install aptitude -y

RUN mkdir -p /home/smb
RUN mkdir -p /var/log/honeysmb

COPY libs /home/smb/libs
COPY credentials_file /home/smb/credentials_file
COPY __init__.py /home/smb/__init__.py
COPY shares.conf /home/smb/shares.conf
COPY smbserver.py /home/smb/smbserver.py
COPY smb.conf /home/smb/smb.conf

COPY startup_scripts.sh /home/smb/startup_scripts.sh
RUN chmod 754 /home/smb/startup_scripts.sh

COPY requirements.txt /home/smb/requirements.txt
RUN pip install -r /home/smb/requirements.txt

EXPOSE 445 139

ENTRYPOINT ["bash"]
CMD ["-c","/home/smb/startup_scripts.sh"]

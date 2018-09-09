
# coding: utf-8

# In[1]:


import serial
import time


RECIPIENT = "+917045469323"

phone = serial.Serial("/dev/ttyUSB0",  9600, timeout = 5)

try:
    
    phone.write(b'AT\r')
    time.sleep(0.2)
    print(phone.read(256))

    phone.write(b'AT+CSQ\r')
    time.sleep(0.2)
    print(phone.read(256))

    phone.write(b'AT+CMGF=1\r')
    time.sleep(0.2)
    print(phone.read(256))

    phone.write(b'AT+CMGS="+919022057698"\r')
    time.sleep(0.2)
    phone.write(b'Hii KK\r')
    time.sleep(0.2)
    phone.write(chr(26))
    print(phone.read(256))

    phone.write(b'AT+CREG=2\r')
    time.sleep(5)
    print(phone.read(256))
    
    phone.write(b'AT+COPS=?\r')
    time.sleep(40)
    print(phone.read(2560))

finally:
    phone.close()

